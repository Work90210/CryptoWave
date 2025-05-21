/*
 * Created by Kyle Fuehri
 */

import 'package:freezed_annotation/freezed_annotation.dart';

part 'network_response.freezed.dart';

/// The type of error that occurred during network request
enum NetworkErrorType {
  /// No error occurred
  none,

  /// No internet connection
  noConnection,

  /// Server returned an error response
  serverError,

  /// Authentication error (401)
  authError,

  /// Not found error (404)
  notFound,

  /// Timeout error
  timeout,

  /// Request was cancelled
  cancelled,

  /// Rate limited (429)
  rateLimited,

  /// Unknown error occurred
  unknown,
}

/// A model class representing a network response
@freezed
class NetworkResponseModel<T> with _$NetworkResponseModel<T> {
  /// Constructor for NetworkResponseModel
  const factory NetworkResponseModel({
    /// The HTTP status code
    required int statusCode,

    /// Whether the request was successful
    required bool isSuccess,

    /// The data returned from the API
    T? data,

    /// Error message if the request failed
    String? errorMessage,

    /// The type of error that occurred
    @Default(NetworkErrorType.none) NetworkErrorType errorType,

    /// The path of the request
    String? requestPath,

    /// The HTTP method used for the request
    String? requestMethod,
  }) = _NetworkResponseModel;

  const NetworkResponseModel._();

  /// Whether this response represents an authentication error
  bool get isAuthError => errorType == NetworkErrorType.authError;

  /// Whether this response represents a network connectivity issue
  bool get isConnectionError => errorType == NetworkErrorType.noConnection;

  /// Whether this response represents a timeout
  bool get isTimeoutError => errorType == NetworkErrorType.timeout;

  /// Whether this response represents a rate limit error
  bool get isRateLimited => errorType == NetworkErrorType.rateLimited;

  /// Whether this response represents a cancelled request
  bool get isCancelled => errorType == NetworkErrorType.cancelled;

  /// Whether this response represents a server error
  bool get isServerError => errorType == NetworkErrorType.serverError;

  /// Whether this response represents a not found error
  bool get isNotFoundError => errorType == NetworkErrorType.notFound;
}
