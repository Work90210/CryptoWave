/*
 * Created by Kyle Fuehri
 */

import 'package:cryptowave/network/exception_handler.dart' show ApiException, ExceptionHandler;
import 'package:cryptowave/network/http_client.dart';
import 'package:cryptowave/network/network_response.dart';
import 'package:cryptowave/utils/logger_service.dart';

/// Base repository class that all repositories should extend
/// Provides common functionality for API calls
abstract class BaseRepository {
  /// The HttpClient instance used for network requests
  final HttpClient _httpClient = HttpClient.instance;

  /// Logger for repository operations
  final _logger = LoggerService.instance;

  /// Perform a DELETE request
  Future<NetworkResponseModel<T>> delete<T>({
    required String url,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParameters,
    bool useDefaultHeaders = true,
    T Function(dynamic data)? converter,
  }) {
    return _httpClient.delete<T>(
      url: url,
      headers: headers,
      queryParameters: queryParameters,
      useDefaultHeaders: useDefaultHeaders,
      converter: converter,
    );
  }

  /// Perform a GET request
  Future<NetworkResponseModel<T>> get<T>({
    required String url,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParameters,
    bool useDefaultHeaders = true,
    T Function(dynamic data)? converter,
  }) {
    return _httpClient.get<T>(
      url: url,
      headers: headers,
      queryParameters: queryParameters,
      useDefaultHeaders: useDefaultHeaders,
      converter: converter,
    );
  }

  /// Perform a PATCH request
  Future<NetworkResponseModel<T>> patch<T>({
    required String url,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParameters,
    dynamic body,
    bool useDefaultHeaders = true,
    T Function(dynamic data)? converter,
  }) {
    return _httpClient.patch<T>(
      url: url,
      headers: headers,
      queryParameters: queryParameters,
      body: body,
      useDefaultHeaders: useDefaultHeaders,
      converter: converter,
    );
  }

  /// Perform a POST request
  Future<NetworkResponseModel<T>> post<T>({
    required String url,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParameters,
    dynamic body,
    bool useDefaultHeaders = true,
    T Function(dynamic data)? converter,
  }) {
    return _httpClient.post<T>(
      url: url,
      headers: headers,
      queryParameters: queryParameters,
      body: body,
      useDefaultHeaders: useDefaultHeaders,
      converter: converter,
    );
  }

  /// Perform a PUT request
  Future<NetworkResponseModel<T>> put<T>({
    required String url,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParameters,
    dynamic body,
    bool useDefaultHeaders = true,
    T Function(dynamic data)? converter,
  }) {
    return _httpClient.put<T>(
      url: url,
      headers: headers,
      queryParameters: queryParameters,
      body: body,
      useDefaultHeaders: useDefaultHeaders,
      converter: converter,
    );
  }

  /// Handle API responses and map them to models
  ///
  /// This method should be implemented by subclasses to handle specific model mapping
  /// Returns the parsed data of type T if successful, or null for successful responses
  /// with no content (like HTTP 204/205).
  ///
  /// IMPORTANT: Callers should specify a concrete type parameter (not dynamic) when
  /// invoking repository methods to ensure proper type safety. Using dynamic as type T
  /// bypasses compile-time type checking and may lead to runtime errors.
  T? handleResponse<T>({required NetworkResponseModel<T> response}) {
    if (response.isSuccess) {
      if (response.data == null) {
        // Successful response with no content (e.g., HTTP 204/205)
        return null;
      }

      // Special handling for dynamic type - skip type check
      if (T == dynamic) {
        // When T is dynamic, we can't perform meaningful type checking
        // But we can validate common response types
        final data = response.data;
        if (data is Map || data is List || data is String || data is num || data is bool) {
          return data as T;
        } else {
          _logger.w('Returning unvalidated dynamic data of type ${data.runtimeType}');
          return data as T;
        }
      }

      // Normal type checking for non-dynamic types
      if (response.data is T) {
        return response.data as T;
      } else {
        // Use the dedicated helper method for type mismatch exceptions
        throw ExceptionHandler.createTypeMismatchException(T, response.data.runtimeType);
      }
    } else {
      throw ExceptionHandler.createExceptionFromResponse(response);
    }
  }

  /// Handle API responses for specific model types
  ///
  /// This method provides a clean way to handle API responses with proper error handling
  /// Returns the parsed data or null for successful responses with no content (like HTTP 204/205)
  ///
  /// Parameters:
  /// - [apiCall]: Function that returns a NetworkResponseModel
  /// - [errorMessage]: Optional custom error message. If null, the response's error message will be used.
  /// - [useDetailedErrors]: If true, the response's detailed error message will be used, falling back to the provided errorMessage.
  Future<T?> safeApiCall<T>({
    required Future<NetworkResponseModel<T>> Function() apiCall,
    String? errorMessage,
    bool useDetailedErrors = true,
  }) async {
    try {
      final response = await apiCall();
      if (!response.isSuccess) {
        throw ExceptionHandler.createExceptionFromResponse(
          response,
          message: useDetailedErrors ? response.errorMessage ?? errorMessage : errorMessage,
        );
      }
      return handleResponse(response: response);
    } catch (e, stackTrace) {
      _logger.e('API call failed', e, stackTrace);
      if (e is ApiException) {
        rethrow;
      }

      // Use the dedicated helper method for unexpected errors
      throw ExceptionHandler.createUnexpectedException(e, message: errorMessage);
    }
  }
}
