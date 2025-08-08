# CryptoWave API Documentation

This document provides a comprehensive reference for the CryptoWave API.

## 1. API Overview

CryptoWave leverages the CoinGecko API to provide real-time cryptocurrency market data, price charts, and detailed coin information. The application's data fetching and management are handled through a robust repository pattern, ensuring efficient and organized access to this information.

## 2. Authentication

Authentication is not explicitly handled or managed by this application's codebase. It relies on the CoinGecko API, which may have its own authentication requirements not detailed here.

## 3. Endpoint/Function Reference

This section details the available functions for interacting with the cryptocurrency data.

### 3.1. `ExceptionHandler` Class

The `ExceptionHandler` class is a utility for consistently handling API exceptions across the application.

#### 3.1.1. `enhanceException(Object error, String contextMessage)`

This static method transforms a base `ApiException` into a domain-specific exception with enhanced context about the operation being performed.

*   **Parameters:**
    *   `error`: The original exception object.
    *   `contextMessage`: A string providing additional context about the operation.
*   **Returns:** An `ApiException` object with an enhanced error message.
*   **Behavior:**
    *   If the `error` is an instance of `ApiException`:
        *   If it's a `ConnectivityException`, the message is prepended with "No internet connection. ".
        *   If it's an `ApiTimeoutException`, the message is set to "Request timed out. Please try again.".
        *   The method continues to check for other `ApiException` subtypes.

### 3.2. `AppConstants` Class

This class contains application-wide constant values.

#### 3.2.1. `API_URL`

*   **Type:** `String`
*   **Value:** `'https://api.coingecko.com/api/v3/'`
*   **Description:** This constant defines the base URL for all CoinGecko API requests.

### 3.3. Repository Functions

The following functions are defined within repository classes to interact with the API.

#### 3.3.1. `BaseRepository.delete`

*   **Signature:** `Future<NetworkResponseModel<T>> delete<T>({required String url, Map<String, dynamic>? headers, Map<String, dynamic>? que})`
*   **Description:** This function performs a DELETE HTTP request.
*   **Parameters:**
    *   `url` (required): The endpoint URL for the DELETE request.
    *   `headers`: Optional map of headers to include in the request.
    *   `que`: Optional map for query parameters.

#### 3.3.2. `CoinDetailsRepository.fetchCoinChartData`

*   **Signature:** `Future<NetworkResponseModel<CryptoChartDataModel>> fetchCoinChartData({required String id, String vsCurrency = 'usd', int days = 7})`
*   **Description:** Fetches historical chart data for a specific cryptocurrency.
*   **Parameters:**
    *   `id` (required): The unique identifier for the cryptocurrency (e.g., 'bitcoin').
    *   `vsCurrency`: The currency against which to fetch the data. Defaults to 'usd'.
    *   `days`: The number of days for which to fetch historical data. Defaults to 7.

#### 3.3.3. `CoinRepository.fetchCoinMarketData`

*   **Signature:** `Future<NetworkResponseModel<CoinModel>> fetchCoinMarketData({String vsCurrency = 'usd', String order = 'market_cap_desc', int perPage = 10, int page = 1})`
*   **Description:** Fetches market data for cryptocurrencies.
*   **Parameters:**
    *   `vsCurrency`: The currency to compare against. Defaults to 'usd'.
    *   `order`: The parameter by which to order the results. Defaults to 'market\_cap\_desc' (market cap descending).
    *   `perPage`: The number of results to return per page. Defaults to 10.
    *   `page`: The page number for pagination. Defaults to 1.

## 4. Request/Response Examples

Examples for specific API calls are not provided in this documentation as the focus is on the application's internal structure and function signatures.

## 5. Error Handling

The `ExceptionHandler` class is utilized to manage and enhance API-related exceptions. Specific exception types like `ConnectivityException` and `ApiTimeoutException` are handled to provide user-friendly messages.

```dart
// Example of exception handling within a repository
try {
  // ... API call logic ...
} catch (e) {
  throw ExceptionHandler.enhanceException(e, 'Failed to fetch coin data');
}
```

## 6. Rate Limiting

Rate limiting information is not available within the provided codebase context. It is assumed that the underlying CoinGecko API manages its own rate limits.

## 7. SDK/Client Usage Examples

The application's architecture utilizes a `HttpClient` instance for making network requests. Repositories interact with this client to fetch data.

```dart
// Example of using HttpClient within a repository
final HttpClient _httpClient = HttpClient.instance;

Future<NetworkResponseModel<CoinModel>> fetchCoinMarketData(...) async {
  final response = await _httpClient.get(
    url: '${AppConstants.API_URL}coins/markets',
    queryParameters: {
      'vs_currency': vsCurrency,
      'order': order,
      'per_page': perPage,
      'page': page,
    },
  );
  // ... process response ...
}
```

## 8. Testing Instructions

Testing instructions are not provided within this documentation. For information on testing, refer to the project's testing framework and guidelines.