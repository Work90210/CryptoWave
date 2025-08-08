# CryptoWave API Documentation

This document provides a comprehensive reference for the CryptoWave API, detailing its functionalities, endpoints, and error handling mechanisms.

## 1. API Overview

CryptoWave is a Flutter application that leverages the CoinGecko API to provide real-time cryptocurrency market data, price charts, and detailed coin information. The application's core functionality revolves around fetching and displaying this data to users.

## 2. Authentication

This API does not require authentication. All data is publicly accessible through the CoinGecko API.

## 3. Endpoint/Function Reference

The primary interaction with external data is handled through repositories that abstract API calls. The following repository is identified:

### `lib/repositories/coin_repository.dart`

This repository is responsible for fetching cryptocurrency market data.

#### `fetchCoinMarketData`

*   **Description:** Retrieves market data for cryptocurrencies.
*   **Parameters:**
    *   `vsCurrency` (String): The currency to compare against (e.g., 'usd'). Defaults to 'usd'.
    *   `order` (String): The parameter to order the results by (e.g., 'market_cap_desc'). Defaults to 'market\_cap\_desc'.
    *   `perPage` (int): The number of results to return per page. Defaults to 10.
    *   `page` (int): The page number for pagination. Defaults to 1.
*   **Returns:** A `Future` that resolves to a `NetworkResponseModel<CoinModel>`, containing the fetched coin market data.

### `lib/repositories/coin_details_repository.dart`

This repository is responsible for fetching detailed information and historical data for individual cryptocurrencies.

#### `fetchCoinChartData`

*   **Description:** Fetches historical chart data for a specific cryptocurrency.
*   **Parameters:**
    *   `id` (String): The unique identifier of the cryptocurrency (e.g., 'bitcoin').
    *   `vsCurrency` (String): The currency to compare against (e.g., 'usd'). Defaults to 'usd'.
    *   `days` (int): The number of days for which to fetch historical data. Defaults to 7.
*   **Returns:** A `Future` that resolves to a `NetworkResponseModel<CryptoChartDataModel>`, containing the historical chart data.

### `lib/network/exception_handler.dart`

This utility class provides methods for handling API exceptions.

#### `enhanceException`

*   **Description:** Transforms a base `ApiException` into a more domain-specific exception with additional context.
*   **Parameters:**
    *   `error` (Object): The original exception object.
    *   `contextMessage` (String): A message providing context about the operation being performed.
*   **Returns:** An `ApiException` with an enhanced error message. This method specifically handles:
    *   `ConnectivityException`: Indicates a lack of internet connection.
    *   `ApiTimeoutException`: Indicates that a request timed out.
    *   `RateLimitException` (implied by `Rat` in the provided snippet): Indicates that the API rate limit has been exceeded.

## 4. Request/Response Examples

Specific request and response examples are not provided in the current context. However, the structure of the data is defined by the models used in the repository return types (`CoinModel` and `CryptoChartDataModel`).

## 5. Error Handling

The `ExceptionHandler` class is utilized to manage and enhance API-related exceptions. It transforms generic API errors into more specific exceptions, providing clearer context to the caller. The following exception types are handled:

*   **`ConnectivityException`**: Raised when there is no internet connection. The error message will include the provided `contextMessage`.
*   **`ApiTimeoutException`**: Raised when an API request exceeds its allocated time. The error message indicates that the request timed out.
*   **`RateLimitException`**: Raised when the application exceeds the allowed number of requests to the CoinGecko API.

## 6. Rate Limiting

The CoinGecko API has rate limits. While this documentation does not specify the exact limits, the `ExceptionHandler` includes logic to identify and potentially handle `RateLimitException` errors. Developers should be mindful of these limits to ensure uninterrupted service.

## 7. SDK/Client Usage Examples

The application utilizes a custom `HttpClient` for network requests. The `BaseRepository` class provides a foundation for all repository implementations, abstracting the `HttpClient` instance and logger.

### Example Usage (Conceptual):

```dart
// Assuming CoinRepository is accessible and instantiated

// Fetching coin market data
try {
  final response = await coinRepository.fetchCoinMarketData(
    vsCurrency: 'usd',
    order: 'market_cap_desc',
    perPage: 20,
    page: 1,
  );
  // Process the response.data (CoinModel)
} on ApiException catch (e) {
  // Handle API errors, e.g., show a message to the user
  print('API Error: ${e.message}');
}

// Fetching coin chart data
try {
  final response = await coinDetailsRepository.fetchCoinChartData(
    id: 'bitcoin',
    vsCurrency: 'usd',
    days: 30,
  );
  // Process the response.data (CryptoChartDataModel)
} on ApiException catch (e) {
  // Handle API errors
  print('API Error: ${e.message}');
}
```

## 8. Testing Instructions

Testing instructions are not provided in the current context. However, typical testing strategies for such an application would involve:

*   **Unit Testing:** Testing individual repository methods and exception handling logic.
*   **Widget Testing:** Verifying the UI components that display the fetched data.
*   **Integration Testing:** Testing the flow of data from the API through repositories and to the UI.
*   **Mocking:** Utilizing mock HTTP clients and API responses to isolate components during testing.