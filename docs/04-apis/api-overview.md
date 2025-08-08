# CryptoWave API Documentation

This document provides a comprehensive reference for the CryptoWave API, detailing its functionalities, endpoints, and error handling mechanisms.

## 1. API Overview

CryptoWave is a Flutter application that leverages the CoinGecko API to provide real-time cryptocurrency market data, price charts, and detailed coin information. The application's core functionality relies on fetching and processing data from the CoinGecko API.

## 2. Authentication

This API does not require authentication. All data is publicly accessible through the CoinGecko API.

## 3. Endpoint/Function Reference

The primary interaction with external data is managed through repositories that abstract API calls. The `lib/repositories` directory contains specific repository classes for different data domains.

### 3.1. `CoinRepository`

The `CoinRepository` class is responsible for fetching cryptocurrency market data.

*   **`fetchCoinMarketData`**: Retrieves market data for cryptocurrencies.
    *   **Parameters:**
        *   `vsCurrency` (String): The currency to compare against (e.g., 'usd'). Defaults to 'usd'.
        *   `order` (String): The parameter to order the results by (e.g., 'market_cap_desc'). Defaults to 'market\_cap\_desc'.
        *   `perPage` (int): The number of results to return per page. Defaults to 10.
        *   `page` (int): The page number for pagination. Defaults to 1.

### 3.2. `CoinDetailsRepository`

The `CoinDetailsRepository` class is responsible for fetching detailed information and historical data for specific cryptocurrencies.

*   **`fetchCoinDetails`**: Retrieves detailed information for a specific coin.
    *   **Parameters:**
        *   `id` (String): The unique identifier of the cryptocurrency (e.g., 'bitcoin').
        *   `vsCurrency` (String): The currency to compare against (e.g., 'usd'). Defaults to 'usd'.
        *   `days` (int): The number of days for which to fetch historical data. Defaults to 7.

## 4. Request/Response Examples

*(Note: Specific request/response examples are not provided in the context. However, the structure implies standard JSON responses typical of RESTful APIs.)*

## 5. Error Handling

The `ExceptionHandler` class in `lib/network/exception_handler.dart` is utilized for consistent API exception handling.

*   **`enhanceException(Object error, String contextMessage)`**: This static method transforms base API exceptions into more context-specific exceptions.
    *   **`ApiException`**: A general API exception.
    *   **`ConnectivityException`**: Raised when there is no internet connection. The message will include the provided `contextMessage`.
    *   **`ApiTimeoutException`**: Raised when an API request times out. The message indicates that the user should try again.

## 6. Rate Limiting

*(Note: Information regarding rate limiting for the CoinGecko API is not explicitly detailed in the provided context. Developers should refer to the CoinGecko API documentation for any applicable rate limits.)*

## 7. SDK/Client Usage Examples

The application utilizes a `HttpClient` instance for making network requests. Repositories abstract the usage of this client.

```dart
// Example of how a repository might use the HttpClient
import 'package:cryptowave/network/http_client.dart';
import 'package:cryptowave/network/network_response.dart';

class ExampleRepository extends BaseRepository {
  final HttpClient _httpClient = HttpClient.instance;

  Future<NetworkResponseModel<List<CoinModel>>> getCoins() async {
    // Assuming a GET request to fetch coins
    final response = await _httpClient.get(
      url: '${AppConstants.API_URL}coins/markets',
      queryParameters: {
        'vs_currency': 'usd',
        'order': 'market_cap_desc',
        'per_page': 10,
        'page': 1,
      },
    );
    // Process response and return NetworkResponseModel<List<CoinModel>>
    // ...
    throw UnimplementedError(); // Placeholder
  }
}
```

## 8. Testing Instructions

*(Note: Specific testing instructions are not provided in the context. However, standard Flutter testing practices would apply, including unit tests for repositories and widget tests for UI components.)*