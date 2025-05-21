/*
 * Created by Kyle Fuehri
 */

import 'dart:async' show TimeoutException;
import 'dart:convert';
import 'dart:io';

import 'package:cryptowave/constants.dart';
import 'package:cryptowave/network/network_response.dart';
import 'package:cryptowave/utils/logger_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

enum NetworkRequestType { delete, get, patch, post, put }

class HttpClient {
  // Private constructor for singleton pattern
  HttpClient._({this.timeoutInSeconds = 10, http.Client? client}) {
    _client = client ?? http.Client();
  }

  // Lazy singleton instance
  static HttpClient? _instance;

  // Public singleton getter
  static HttpClient get instance => _instance ??= HttpClient._();

  // Allow injection of mock client for testing
  @visibleForTesting
  static void setClientForTesting(http.Client mockClient) {
    assert(() {
      // This code only runs in debug/test mode
      if (_instance != null) {
        _instance!._client = mockClient;
      } else {
        _instance = HttpClient._(client: mockClient);
      }
      return true;
    }(), 'This method should only be called during testing');
  }

  // Reset singleton for testing
  @visibleForTesting
  static void resetForTesting() {
    assert(() {
      if (_instance != null) {
        _instance!._client.close();
        _instance = null;
      }
      return true;
    }(), 'This method should only be called during testing');
  }

  late http.Client _client;

  final int timeoutInSeconds;

  // Flag to enable verbose network logging
  bool enableVerboseNetworkLogs = false;

  /// Closes the underlying [http.Client] to free native resources.
  /// Call this exactly once when the application is shutting down.
  void dispose() {
    _client.close();
  }

  // Logger instance
  final _logger = LoggerService.instance;

  // API URL from app constants folder
  final String baseUrl = AppConstants.API_URL;

  /// Masks sensitive information in the request body before logging
  dynamic _maskSensitiveData(dynamic body) {
    if (body == null) return null;

    // If the body is a string that looks like JSON, try to parse it
    if (body is String) {
      try {
        final decoded = jsonDecode(body);
        return _maskSensitiveData(decoded);
      } on FormatException {
        // If it's not valid JSON, return as is
        return body;
      }
    }

    // Handle Maps (JSON objects)
    if (body is Map) {
      final masked = Map.from(body);
      final sensitiveKeys = [
        'password',
        'token',
        'api_key',
        'apiKey',
        'secret',
        'auth',
        'credentials',
        'accessToken',
        'refreshToken',
      ];

      for (final key in masked.keys) {
        final keyStr = key.toString().toLowerCase();
        if (sensitiveKeys.any(keyStr.contains)) {
          masked[key] = '********';
        } else if (masked[key] is Map || masked[key] is List) {
          // Recursively mask nested objects
          masked[key] = _maskSensitiveData(masked[key]);
        }
      }
      return masked;
    }

    // Handle Lists (JSON arrays)
    if (body is List) {
      return body.map(_maskSensitiveData).toList();
    }

    // Return primitives as is
    return body;
  }

  // Default headers that will be included with requests when useDefaultHeaders is true
  Map<String, String> getDefaultHeaders() {
    return {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'x-cg-demo-api-key': dotenv.get('COINGECKO_API_KEY', fallback: ''),
    };
  }

  Future<NetworkResponseModel<T>> delete<T>({
    required String url,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParameters,
    dynamic body,
    bool useDefaultHeaders = true,
    T Function(dynamic data)? converter,
  }) {
    return _performRequest<T>(
      type: NetworkRequestType.delete,
      url: url,
      useDefaultHeaders: useDefaultHeaders,
      queryParameters: queryParameters,
      headers: headers,
      body: body,
      converter: converter,
    );
  }

  Future<NetworkResponseModel<T>> get<T>({
    required String url,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParameters,
    bool useDefaultHeaders = true,
    T Function(dynamic data)? converter,
  }) {
    return _performRequest<T>(
      type: NetworkRequestType.get,
      url: url,
      useDefaultHeaders: useDefaultHeaders,
      queryParameters: queryParameters,
      headers: headers,
      converter: converter,
    );
  }

  Future<NetworkResponseModel<T>> patch<T>({
    required String url,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParameters,
    dynamic body,
    bool useDefaultHeaders = true,
    T Function(dynamic data)? converter,
  }) {
    return _performRequest<T>(
      type: NetworkRequestType.patch,
      url: url,
      useDefaultHeaders: useDefaultHeaders,
      queryParameters: queryParameters,
      headers: headers,
      body: body,
      converter: converter,
    );
  }

  Future<NetworkResponseModel<T>> post<T>({
    required String url,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParameters,
    dynamic body,
    bool useDefaultHeaders = true,
    T Function(dynamic data)? converter,
  }) {
    return _performRequest<T>(
      type: NetworkRequestType.post,
      url: url,
      useDefaultHeaders: useDefaultHeaders,
      queryParameters: queryParameters,
      headers: headers,
      body: body,
      converter: converter,
    );
  }

  Future<NetworkResponseModel<T>> put<T>({
    required String url,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParameters,
    dynamic body,
    bool useDefaultHeaders = true,
    T Function(dynamic data)? converter,
  }) {
    return _performRequest<T>(
      type: NetworkRequestType.put,
      url: url,
      useDefaultHeaders: useDefaultHeaders,
      queryParameters: queryParameters,
      headers: headers,
      body: body,
      converter: converter,
    );
  }

  Future<NetworkResponseModel<T>> _performRequest<T>({
    required NetworkRequestType type,
    required String url,
    required bool useDefaultHeaders,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParameters,
    dynamic body,
    T Function(dynamic data)? converter,
  }) async {
    final requestTypeString = _networkRequestTypeToString(type);

    // Handle both absolute and relative URLs
    final uri = url.startsWith('http') ? Uri.parse(url) : Uri.parse(baseUrl + url);

    // Apply query parameters if provided
    final finalUri = uri.replace(
      queryParameters: queryParameters?.map((k, v) => MapEntry(k, v.toString())),
    );

    // Headers - merge with defaults if useDefaultHeaders is true
    final finalHeaders = <String, String>{};
    if (useDefaultHeaders) {
      finalHeaders.addAll(getDefaultHeaders());
    }
    if (headers != null) {
      headers.forEach((key, value) {
        if (value != null) {
          finalHeaders[key] = value.toString();
        }
      });
    }

    // Log request in debug mode
    _logger.d('REQUEST [$requestTypeString] => $finalUri');
    if (kDebugMode && body != null && enableVerboseNetworkLogs) {
      final maskedBody = _maskSensitiveData(body);
      _logger.v('REQUEST BODY: $maskedBody');
    }

    http.Response? response;
    String? responseBody;

    try {
      // Ensure no body is processed or passed for GET requests
      final bodyJson =
          type == NetworkRequestType.get
              ? null
              : switch (body) {
                null => null,
                final String s => s, // already encoded
                final List<int> b => b, // binary body
                _ => jsonEncode(body),
              };

      response = await _executeRequest(
        type: type,
        uri: finalUri,
        headers: finalHeaders,
        body: bodyJson,
      ).timeout(Duration(seconds: timeoutInSeconds));

      responseBody = response.body;

      // Parse the response body
      dynamic parsedBody;
      if (responseBody.isNotEmpty) {
        try {
          parsedBody = jsonDecode(responseBody);
        } catch (e) {
          // If the response isn't JSON, use the raw body
          parsedBody = responseBody;
        }
      }

      final networkResponse = _createNetworkResponse<T>(
        response: response,
        parsedBody: parsedBody,
        requestPath: url,
        requestMethod: requestTypeString,
        converter: converter,
      );

      // Log response in debug mode
      if (networkResponse.isSuccess) {
        _logger.d('RESPONSE [${networkResponse.statusCode}] => $url');
        if (kDebugMode && enableVerboseNetworkLogs) {
          _logger.v('RESPONSE DATA: ${networkResponse.data}');
        }
      } else {
        _logger.w(
          'RESPONSE ERROR [${networkResponse.statusCode}] => $url: ${networkResponse.errorMessage}',
        );
      }

      return networkResponse;
    } catch (e, st) {
      _logger.e('REQUEST ERROR [$requestTypeString] => $url', e, st);

      // Handle common exceptions
      if (e is SocketException) {
        return NetworkResponseModel<T>(
          statusCode: 0,
          isSuccess: false,
          errorMessage: 'No internet connection',
          errorType: NetworkErrorType.noConnection,
          requestPath: url,
          requestMethod: requestTypeString,
        );
      } else if (e is TimeoutException) {
        return NetworkResponseModel<T>(
          statusCode: 0,
          isSuccess: false,
          errorMessage: 'Request timed out',
          errorType: NetworkErrorType.timeout,
          requestPath: url,
          requestMethod: requestTypeString,
        );
      }

      if (kDebugMode) rethrow;
      return NetworkResponseModel<T>(
        statusCode: 0,
        isSuccess: false,
        errorMessage: 'Unexpected error: $e',
        errorType: NetworkErrorType.unknown,
        requestPath: url,
        requestMethod: requestTypeString,
      );
    }
  }

  Future<http.Response> _executeRequest({
    required NetworkRequestType type,
    required Uri uri,
    required Map<String, String> headers,
    Object? body,
  }) async {
    switch (type) {
      case NetworkRequestType.get:
        assert(body == null, 'Body should not be provided for GET requests');
        return _client.get(uri, headers: headers);
      case NetworkRequestType.post:
        return _client.post(uri, headers: headers, body: body);
      case NetworkRequestType.put:
        return _client.put(uri, headers: headers, body: body);
      case NetworkRequestType.delete:
        return _client.delete(uri, headers: headers, body: body);
      case NetworkRequestType.patch:
        return _client.patch(uri, headers: headers, body: body);
    }
  }

  NetworkResponseModel<T> _createNetworkResponse<T>({
    required http.Response response,
    required dynamic parsedBody,
    required String requestPath,
    required String requestMethod,
    T Function(dynamic data)? converter,
  }) {
    final statusCode = response.statusCode;
    final isSuccess = statusCode >= 200 && statusCode < 300;

    // Attempt to parse API error messages if available
    String? errorMessage;
    if (!isSuccess && parsedBody is Map<String, dynamic>) {
      // Common error message formats from APIs
      if (parsedBody.containsKey('message')) {
        errorMessage = parsedBody['message'] as String?;
      } else if (parsedBody.containsKey('error')) {
        if (parsedBody['error'] is String) {
          errorMessage = parsedBody['error'] as String;
        } else if (parsedBody['error'] is Map &&
            (parsedBody['error'] as Map).containsKey('message')) {
          errorMessage = (parsedBody['error'] as Map)['message'] as String?;
        }
      }
    }

    // Determine error type based on status code
    final errorType = _getErrorTypeFromStatusCode(statusCode);

    // Use provided converter to transform data if available
    T? convertedData;
    if (isSuccess && converter != null && parsedBody != null) {
      try {
        convertedData = converter(parsedBody);
      } catch (e) {
        _logger.e('Error converting response data', e);
        return NetworkResponseModel<T>(
          statusCode: statusCode,
          errorMessage: 'Error parsing response data: $e',
          isSuccess: false,
          errorType: NetworkErrorType.unknown,
          requestPath: requestPath,
          requestMethod: requestMethod,
        );
      }
    }

    return NetworkResponseModel<T>(
      data:
          isSuccess
              ? (converter != null ? convertedData : (parsedBody is T ? parsedBody : null))
              : null,
      statusCode: statusCode,
      errorMessage:
          isSuccess ? null : (errorMessage ?? 'Request failed with status code $statusCode'),
      isSuccess: isSuccess,
      errorType: errorType,
      requestPath: requestPath,
      requestMethod: requestMethod,
    );
  }

  /// Maps a status code to an error type
  NetworkErrorType _getErrorTypeFromStatusCode(int statusCode) {
    if (statusCode >= 200 && statusCode < 300) {
      return NetworkErrorType.none;
    } else if (statusCode == 401 || statusCode == 403) {
      return NetworkErrorType.authError;
    } else if (statusCode == 404) {
      return NetworkErrorType.notFound;
    } else if (statusCode == 408) {
      return NetworkErrorType.timeout;
    } else if (statusCode == 429) {
      // 429 Too Many Requests - separate type for handling backoff strategies
      return NetworkErrorType.rateLimited;
    } else if (statusCode >= 500) {
      return NetworkErrorType.serverError;
    } else {
      return NetworkErrorType.unknown;
    }
  }

  /// Used to convert enum to string for printing purposes
  String _networkRequestTypeToString(NetworkRequestType t) => t.name.toUpperCase();
}
