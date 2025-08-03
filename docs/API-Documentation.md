# CryptoWave API Documentation

This document provides comprehensive API documentation for the CryptoWave application.

## 1. API Overview

CryptoWave leverages the CoinGecko API to provide real-time cryptocurrency market data, including prices, trends, and detailed coin information. The application's backend interacts with the CoinGecko API to fetch and process this data.

## 2. Authentication

This API does not require authentication. All data is publicly accessible through the CoinGecko API.

## 3. Endpoint/Function Reference

The primary interaction with external data sources is managed through repositories. The following repository is responsible for fetching cryptocurrency data:

### `CoinRepository`

This repository handles API calls related to general cryptocurrency market data.

*   **`fetchCoinMarketData`**: Retrieves market data for cryptocurrencies.
    *   **Parameters:**
        *   `vsCurrency` (String): The currency to compare against (e.g., 'usd'). Defaults to 'usd'.
        *   `order` (String): The parameter to order the results by (e.g., 'market_cap_desc'). Defaults to 'market_cap_desc'.
        *   `perPage` (int): The number of results to return per page. Defaults to 10.
        *   `page` (int): The page number for pagination. Defaults to 1.
    *   **Returns:** A `Future<NetworkResponseModel<CoinModel>>` containing the market data for cryptocurrencies.

### `CoinDetailsRepository`

This repository is responsible for fetching detailed information and historical data for individual cryptocurrencies.

*   **`fetchCoinChartData`**: Retrieves historical chart data for a specific coin.
    *   **Parameters:**
        *   `id` (String): The unique identifier of the cryptocurrency (e.g., 'bitcoin').
        *   `vsCurrency` (String): The currency to compare against (e.g., 'usd'). Defaults to 'usd'.
        *   `days` (String): The number of days for which to fetch data (e.g., '7'). Defaults to '7'.
    *   **Returns:** A `Future<NetworkResponseModel<CryptoChartDataModel>>` containing the historical chart data for the specified coin.

## 4. Request/Response Examples

### Fetching Coin Market Data

**Request:**

```dart
final coinRepository = CoinRepository();
final response = await coinRepository.fetchCoinMarketData(
  vsCurrency: 'usd',
  order: 'market_cap_desc',
  perPage: 20,
  page: 1,
);
```

**Example Response (Success):**

```json
{
  "data": [
    {
      "id": "bitcoin",
      "symbol": "BTC",
      "name": "Bitcoin",
      "image": "https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1547033579",
      "current_price": 60000.50,
      "market_cap": 1140000000000,
      "market_cap_rank": 1,
      "fully_diluted_valuation": null,
      "total_volume": 30000000000,
      "high_24h": 61000.75,
      "low_24h": 59500.25,
      "price_change_24h": 500.25,
      "price_change_percentage_24h": 0.84,
      "market_cap_change_24h": 10000000000,
      "market_cap_change_percentage_24h": 0.88,
      "circulating_supply": 19000000,
      "total_supply": 21000000,
      "sparkline_in_7d": {
        "price": [
          58000.00, 59000.00, 60500.00, 61200.00, 60800.00, 60300.00, 60000.50
        ]
      },
      "price_change_percentage_7d_in_currency": 2.50,
      "last_updated": "2023-10-27T10:00:00.000Z"
    }
    // ... more coin data
  ]
}
```

### Fetching Coin Chart Data

**Request:**

```dart
final coinDetailsRepository = CoinDetailsRepository();
final response = await coinDetailsRepository.fetchCoinChartData(
  id: 'bitcoin',
  vsCurrency: 'usd',
  days: '30',
);
```

**Example Response (Success):**

```json
{
  "prices": [
    [1698355200000, 59000.25],
    [1698441600000, 59500.75],
    // ... more data points
    [1698441600000, 60000.50]
  ],
  "market_caps": [
    [1698355200000, 1121000000000],
    [1698441600000, 1130500000000],
    // ... more data points
    [1698441600000, 1140000000000]
  ],
  "total_volumes": [
    [1698355200000, 28000000000],
    [1698441600000, 29500000000],
    // ... more data points
    [1698441600000, 30000000000]
  ]
}
```

## 5. Error Handling

The application utilizes a custom `ExceptionHandler` to manage API-related errors.

*   **`ExceptionHandler.enhanceException(Object error, String contextMessage)`**: This static method transforms a base `ApiException` into a more domain-specific exception with additional context about the operation being performed.

    *   **`ConnectivityException`**: Indicates a lack of internet connection. The enhanced message will include "No internet connection." followed by the `contextMessage`.
    *   **`ApiTimeoutException`**: Signifies that a request has timed out. The enhanced message will be "Request timed out. Please try again."
    *   **`RateLimitException`**: (Implied by the partial code snippet) This exception would likely handle cases where the API rate limits have been exceeded.

The `NetworkResponseModel<T>` is used to encapsulate the result of network operations, including potential errors.

## 6. Rate Limiting

The CoinGecko API has specific rate limits. While this documentation does not detail the exact limits, developers should be aware that excessive requests may lead to temporary blocking or errors. The `ExceptionHandler` is designed to catch and potentially manage `RateLimitException`s.

## 7. SDK/Client Usage Examples

The primary interaction with the API is through the repository pattern. The `HttpClient` class, as seen in `BaseRepository`, is responsible for making the actual HTTP requests.

```dart
// Example of HttpClient usage within BaseRepository (conceptual)
import 'package:cryptowave/network/http_client.dart';
import 'package:cryptowave/network/network_response.dart';

abstract class BaseRepository {
  final HttpClient _httpClient = HttpClient.instance;

  Future<NetworkResponseModel<T>> get<T>(String url, {Map<String, dynamic>? queryParameters}) async {
    try {
      final response = await _httpClient.get(url, queryParameters: queryParameters);
      // Process successful response
      return NetworkResponseModel<T>.fromJson(response.data);
    } catch (e) {
      // Handle exceptions
      throw ExceptionHandler.enhanceException(e, 'Failed to fetch data from $url');
    }
  }

  // Other HTTP methods like post, delete, etc. would follow a similar pattern.
}
```

## 8. Testing Instructions

To test the API interactions:

1.  **Ensure Dependencies are Met:** Verify that all necessary Flutter packages, including `http`, `dio`, and any state management solutions like `flutter_bloc`, are correctly added to `pubspec.yaml` and installed.
2.  **Mock API Responses:** For unit and integration testing, it is recommended to mock the responses from the CoinGecko API. This can be achieved using libraries like `mockito` or by creating mock HTTP clients that return predefined JSON data.
3.  **Test Repository Methods:** Write tests for the `CoinRepository` and `CoinDetailsRepository` to ensure they correctly parse API responses and handle potential errors.
    *   Test `fetchCoinMarketData` with various parameters and mock responses for success and failure scenarios.
    *   Test `fetchCoinChartData` with different coin IDs, currencies, and day ranges, simulating both successful data retrieval and error conditions.
4.  **Test Exception Handling:** Verify that the `ExceptionHandler` correctly identifies and transforms different API exceptions (e.g., `ConnectivityException`, `ApiTimeoutException`) into meaningful error messages.
5.  **Integration Testing:** Conduct integration tests that involve making actual network requests to the CoinGecko API (in a controlled test environment or with test keys if applicable) to validate the end-to-end data flow. Ensure that the application gracefully handles network issues and API errors.