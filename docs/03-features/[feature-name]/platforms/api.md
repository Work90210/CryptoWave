# CryptoWave API Documentation

This document provides comprehensive API documentation for the CryptoWave application.

## 1. API Overview

CryptoWave utilizes the CoinGecko API to fetch real-time cryptocurrency market data, including prices, trends, and detailed coin information. The application's network layer is designed to interact with this external API.

## 2. Authentication

Authentication is not explicitly handled within the provided code snippets. Interactions with the CoinGecko API are assumed to be unauthenticated, relying on the API's public access.

## 3. Endpoint/Function Reference

The primary interaction with external APIs is managed through the `ExceptionHandler` class, which is responsible for transforming base API exceptions into domain-specific exceptions with enhanced context.

### 3.1. `ExceptionHandler.enhanceException`

This static method takes an `Object` representing an error and a `String` context message. It checks if the error is an instance of `ApiException` and, if so, enhances the exception message based on the specific type of `ApiException`.

**Parameters:**

*   `error`: The exception object caught during an API call.
*   `contextMessage`: A string providing context about the operation being performed when the error occurred.

**Functionality:**

*   If `error` is a `ConnectivityException`, the `contextMessage` is prepended to "No internet connection."
*   If `error` is an `ApiTimeoutException`, the message is set to "Request timed out. Please try again."
*   The function handles other `ApiException` types, including `Rat` (though the full type is truncated in the provided context).

**Example Usage (Conceptual):**

```dart
try {
  // ... API call ...
} catch (e) {
  ApiException enhancedError = ExceptionHandler.enhanceException(e, 'Fetching coin data');
  // Handle enhancedError
}
```

## 4. Request/Response Examples

The provided code snippets do not include direct examples of API requests or responses. However, the application's architecture suggests that repositories like `CoinRepository` and `CoinDetailsRepository` are responsible for constructing these requests and parsing their responses.

## 5. Error Handling

The `ExceptionHandler` class centralizes the handling of API-related errors. It aims to provide more user-friendly and context-specific error messages by enhancing the original exceptions.

### 5.1. `ApiException`

This is the base class for API-related exceptions. Specific exceptions derived from it include:

*   `ConnectivityException`: Indicates a lack of internet connection.
*   `ApiTimeoutException`: Indicates that an API request exceeded its time limit.

The `enhanceException` method customizes the error messages for these specific scenarios.

## 6. Rate Limiting

Rate limiting information is not explicitly detailed in the provided code. Interactions with the CoinGecko API should adhere to their documented rate limits to prevent service disruptions.

## 7. SDK/Client Usage Examples

The application utilizes a custom `HttpClient` instance, as seen in `BaseRepository`. Specific usage examples for this client are not provided in the given context.

## 8. Testing Instructions

Testing instructions are not available in the provided code snippets. However, typical testing strategies for such an application would involve:

*   **Unit Tests:** For individual repository methods and utility functions like `ExceptionHandler`. Mocking network responses and dependencies is crucial here.
*   **Widget Tests:** To verify the UI components' behavior, including how they display data fetched via repositories and how they handle loading and error states.
*   **Integration Tests:** To test the flow of data from the UI through the Bloc pattern, repositories, and network layer.

When testing network interactions, it is essential to mock the `HttpClient` to control responses and simulate various network conditions and error scenarios.