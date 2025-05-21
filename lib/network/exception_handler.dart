/*
 * Created by Kyle Fuehri
 */

import 'package:cryptowave/network/network_response.dart';

/// Utility class for handling API exceptions consistently across the application
class ExceptionHandler {
  /// Transforms a base ApiException to a domain-specific exception
  /// with more context about the operation being performed
  static ApiException enhanceException(Object error, String contextMessage) {
    if (error is ApiException) {
      // Create a new exception with the same type but enhanced message
      String enhancedMessage;

      if (error is ConnectivityException) {
        enhancedMessage = 'No internet connection. $contextMessage';
      } else if (error is ApiTimeoutException) {
        enhancedMessage = 'Request timed out. Please try again.';
      } else if (error is RateLimitedException) {
        enhancedMessage = 'Too many requests. Please try again later.';
      } else if (error is ServerException) {
        enhancedMessage = 'Server error. $contextMessage';
      } else if (error is NotFoundException) {
        enhancedMessage = 'Resource not found. $contextMessage';
      } else if (error is CancelledException) {
        enhancedMessage = 'Request cancelled. $contextMessage';
      } else {
        enhancedMessage = error.message;
      }

      // Create new exception of the same type with enhanced message
      if (error is ConnectivityException) {
        return ConnectivityException(message: enhancedMessage, cause: error.cause);
      } else if (error is ApiTimeoutException) {
        return ApiTimeoutException(message: enhancedMessage, cause: error.cause);
      } else if (error is RateLimitedException) {
        return RateLimitedException(
          message: enhancedMessage,
          statusCode: error.statusCode,
          cause: error.cause,
        );
      } else if (error is ServerException) {
        return ServerException(
          message: enhancedMessage,
          statusCode: error.statusCode,
          cause: error.cause,
        );
      } else if (error is NotFoundException) {
        return NotFoundException(message: enhancedMessage, path: error.path, cause: error.cause);
      } else if (error is CancelledException) {
        return CancelledException(message: enhancedMessage, cause: error.cause);
      } else {
        return ApiException(
          message: enhancedMessage,
          errorType: error.errorType,
          statusCode: error.statusCode,
          cause: error.cause,
        );
      }
    }

    // If it's not an ApiException, wrap it in one
    return ApiException(
      message: '$contextMessage: $error',
      errorType: NetworkErrorType.unknown,
      cause: error,
    );
  }

  /// Creates an appropriate exception from a network response
  static ApiException createExceptionFromResponse<T>(
    NetworkResponseModel<T> response, {
    String? message,
  }) {
    final errorMessage = message ?? response.errorMessage ?? 'Unknown error';

    switch (response.errorType) {
      case NetworkErrorType.authError:
        return AuthException(message: errorMessage, statusCode: response.statusCode);
      case NetworkErrorType.noConnection:
        return ConnectivityException(message: errorMessage);
      case NetworkErrorType.timeout:
        return ApiTimeoutException(message: errorMessage);
      case NetworkErrorType.notFound:
        return NotFoundException(message: errorMessage, path: response.requestPath);
      case NetworkErrorType.serverError:
        return ServerException(message: errorMessage, statusCode: response.statusCode);
      case NetworkErrorType.rateLimited:
        return RateLimitedException(message: errorMessage, statusCode: response.statusCode);
      case NetworkErrorType.cancelled:
        return CancelledException(message: errorMessage);
      case NetworkErrorType.none:
      case NetworkErrorType.unknown:
        return ApiException(
          message: errorMessage,
          errorType: response.errorType,
          statusCode: response.statusCode,
        );
    }
  }

  /// Creates a type mismatch exception with consistent formatting
  ///
  /// This method helps maintain consistent error handling for type mismatch errors
  /// which are common when parsing API responses
  static ApiException createTypeMismatchException(Type expected, Type actual) {
    return ApiException(
      message: 'Type mismatch: Expected $expected but got $actual',
      errorType: NetworkErrorType.unknown,
    );
  }

  /// Creates an exception for unexpected errors with contextual information
  ///
  /// Used for wrapping unknown errors that occur during API calls
  static ApiException createUnexpectedException(Object error, {String? message}) {
    return ApiException(
      message: message ?? 'An unexpected error occurred',
      errorType: NetworkErrorType.unknown,
      cause: error,
    );
  }
}

/// Base exception for API errors
class ApiException implements Exception {
  ApiException({required this.message, required this.errorType, this.statusCode, this.cause});
  final String message;
  final NetworkErrorType errorType;
  final int? statusCode;
  final Object? cause;

  @override
  String toString() => cause != null ? '$message\nCaused by: $cause' : message;
}

/// Authentication error exception
class AuthException extends ApiException {
  AuthException({required super.message, super.statusCode, super.cause})
    : super(errorType: NetworkErrorType.authError);
}

/// Server error exception
class ServerException extends ApiException {
  ServerException({required super.message, super.statusCode, super.cause})
    : super(errorType: NetworkErrorType.serverError);
}

/// Not found exception
class NotFoundException extends ApiException {
  NotFoundException({required super.message, this.path, super.cause})
    : super(errorType: NetworkErrorType.notFound);
  final String? path;
}

/// Network connectivity exception
class ConnectivityException extends ApiException {
  ConnectivityException({required super.message, super.cause})
    : super(errorType: NetworkErrorType.noConnection);
}

/// API timeout exception
class ApiTimeoutException extends ApiException {
  ApiTimeoutException({required super.message, super.cause})
    : super(errorType: NetworkErrorType.timeout);
}

/// Rate limit exception
class RateLimitedException extends ApiException {
  RateLimitedException({required super.message, super.statusCode, super.cause})
    : super(errorType: NetworkErrorType.rateLimited);
}

/// Cancelled request exception
class CancelledException extends ApiException {
  CancelledException({required super.message, super.cause})
    : super(errorType: NetworkErrorType.cancelled);
}
