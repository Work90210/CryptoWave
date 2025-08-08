# CryptoWave API Documentation

This document provides a comprehensive reference for the CryptoWave API, detailing its functionalities, endpoints, and error handling mechanisms.

## 1. API Overview

CryptoWave is a Flutter application that leverages the CoinGecko API to provide real-time cryptocurrency market data, price charts, and detailed coin information. The application's core functionality revolves around fetching and displaying this data to users.

## 2. Authentication

This API does not require authentication. All data is publicly accessible through the CoinGecko API.

## 3. Endpoint/Function Reference

The primary interaction with external data is managed through repositories that abstract API calls. The `ExceptionHandler` class is responsible for processing and standardizing API-related exceptions.

### 3.1. `ExceptionHandler`

The `ExceptionHandler` class provides utility methods for managing and enhancing API exceptions.

#### 3.1.1. `enhanceException(Object error, String contextMessage)`

This static method transforms a base `ApiException` into a more domain-specific exception with additional context about the operation being performed.

*   **Parameters:**
    *   `error`: The original exception object.
    *   `contextMessage`: A string providing context about the operation that led to the exception.

*   **Returns:** An `ApiException` object, potentially enhanced with more specific error messages.

*   **Behavior:**
    *   If the `error` is an instance of `ApiException`, it checks for specific subtypes:
        *   `ConnectivityException`: Enhances the message to indicate a lack of internet connection.
        *   `ApiTimeoutException`: Enhances the message to inform the user about a request timeout.
        *   `Rat` (likely a placeholder or incomplete exception type): The specific enhancement for this type is not fully detailed in the provided context.

## 4. Request/Response Examples

This documentation does not include specific request/response examples as the API interactions are handled internally by the application's repositories and are not directly exposed as external API endpoints.

## 5. Error Handling

The `ExceptionHandler` class is central to the application's error handling strategy for API interactions. It aims to provide more user-friendly and context-aware error messages by enhancing base API exceptions.

## 6. Rate Limiting

Information regarding rate limiting is not available in the provided context. As the application utilizes the CoinGecko API, any rate limiting would be dictated by CoinGecko's API policies.

## 7. SDK/Client Usage Examples

The provided code context does not include direct SDK or client usage examples for external consumption. The application's internal structure utilizes repositories to interact with the CoinGecko API.

## 8. Testing Instructions

Testing instructions are not provided in the current documentation scope.