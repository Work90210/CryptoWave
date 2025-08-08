# CryptoWave API Documentation

This document provides comprehensive API documentation for the CryptoWave application.

## 1. API Overview

CryptoWave utilizes the CoinGecko API to fetch real-time cryptocurrency market data, including prices, trends, and detailed coin information.

## 2. Authentication

Authentication is not explicitly handled or documented within the provided code snippets.

## 3. Endpoint/Function Reference

The following functions are identified as relevant to API interactions:

### `ExceptionHandler.enhanceException`

This static method within the `ExceptionHandler` class is responsible for transforming base API exceptions into domain-specific exceptions with enhanced context.

**Parameters:**

*   `error`: The original exception object.
*   `contextMessage`: A string providing additional context about the operation being performed.

**Behavior:**

The function checks the type of the `error` object. If it is an `ApiException`, it creates a new `ApiException` with a more descriptive message based on the specific exception type (e.g., `ConnectivityException`, `ApiTimeoutException`) and the provided `contextMessage`.

**Example Usage:**

```dart
try {
  // ... API call ...
} catch (e) {
  final enhancedError = ExceptionHandler.enhanceException(e, 'Failed to fetch coin data');
  // Handle enhancedError
}
```

## 4. Request/Response Examples

The provided code snippets do not contain explicit examples of API requests or responses. However, the `CoinRepository` and `CoinDetailsRepository` classes indicate interactions with an API, likely for fetching coin market data and historical chart data respectively.

## 5. Error Handling

The `ExceptionHandler` class is dedicated to managing API exceptions. It provides a mechanism to create more informative exceptions by adding context to the original error.

The following exception types are handled:

*   `ApiException`: A base class for API-related errors.
*   `ConnectivityException`: Indicates a lack of internet connection.
*   `ApiTimeoutException`: Signifies that a request has timed out.

The `enhanceException` method augments these exceptions with user-friendly messages.

## 6. Rate Limiting

Rate limiting information is not available in the provided code snippets.

## 7. SDK/Client Usage Examples

The code utilizes a `HttpClient` instance, suggesting an underlying HTTP client is used for making API calls. Specific examples of SDK or client usage are not detailed in the provided context.

## 8. Testing Instructions

Testing instructions are not provided within the scope of this documentation.