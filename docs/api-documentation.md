# CryptoWave API Documentation

This document provides a comprehensive reference for the CryptoWave API.

## 1. API Overview

CryptoWave is a Flutter application that leverages the CoinGecko API to provide real-time cryptocurrency market data, price charts, and detailed coin information. The application's core functionality relies on fetching and processing data from the CoinGecko API.

## 2. Authentication

This API does not require authentication.

## 3. Endpoint/Function Reference

The primary interaction with external data is handled through network requests. The `lib/network/exception_handler.dart` file contains logic for managing API exceptions.

### 3.1. `ExceptionHandler` Class

The `ExceptionHandler` class is a utility for consistently handling API exceptions across the application.

#### 3.1.1. `enhanceException` Method

This static method transforms a base `ApiException` into a domain-specific exception with enhanced context about the operation being performed.

**Signature:**

```dart
static ApiException enhanceException(Object error, String contextMessage)
```

**Parameters:**

*   `error`: The original exception object.
*   `contextMessage`: A string providing additional context about the operation that failed.

**Behavior:**

*   If the `error` is an instance of `ApiException`, it is processed.
*   If the `error` is a `ConnectivityException`, the message is enhanced with "No internet connection. \[contextMessage]".
*   If the `error` is an `ApiTimeoutException`, the message is enhanced with "Request timed out. Please try again.".
*   The method returns an `ApiException` with the potentially enhanced message.

## 4. Request/Response Examples

This documentation does not include specific request/response examples as the interaction with the CoinGecko API is abstracted within the application's repository layer.

## 5. Error Handling

The `ExceptionHandler` class centralizes the handling of API-related errors. The `enhanceException` method is responsible for providing more context to exceptions encountered during API interactions. Specific exception types handled include:

*   `ApiException`: A general base class for API-related errors.
*   `ConnectivityException`: Indicates a lack of internet connection.
*   `ApiTimeoutException`: Indicates that an API request exceeded its time limit.

## 6. Rate Limiting

Information regarding rate limiting is not explicitly detailed in the provided context.

## 7. SDK/Client Usage Examples

The application utilizes an internal `HttpClient` instance for network requests, as indicated by `HttpClient.instance` in `lib/repositories/base_repository.dart`. Specific usage examples for this client are not provided in the given context.

## 8. Testing Instructions

Testing instructions are not available in the provided context.