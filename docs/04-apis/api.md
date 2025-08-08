# CryptoWave API Documentation

This document provides comprehensive API documentation for the CryptoWave application.

## 1. API Overview

CryptoWave leverages the CoinGecko API to provide real-time cryptocurrency market data, including prices, trends, and detailed coin information. The application's backend interacts with the CoinGecko API to fetch and process this data.

## 2. Authentication

This API does not require authentication. All data is publicly accessible through the CoinGecko API.

## 3. Endpoint/Function Reference

The primary interaction with external data is handled through repositories that abstract API calls. The following repository is relevant for API interactions:

### `lib/repositories/coin_repository.dart`

This repository is responsible for fetching cryptocurrency market data.

#### `CoinRepository.fetchCoinMarketData`

Fetches market data for cryptocurrencies.

**Parameters:**

*   `vsCurrency` (String): The currency to compare against (e.g., 'usd'). Defaults to 'usd'.
*   `order` (String): The parameter to order the results by (e.g., 'market_cap_desc'). Defaults to 'market_cap_desc'.
*   `perPage` (int): The number of results to return per page. Defaults to 10.
*   `page` (int): The page number of the results to retrieve. Defaults to 1.

**Returns:**

A `Future<NetworkResponseModel<CoinModel>>` containing the market data for the requested cryptocurrencies.

#### `lib/repositories/coin_details_repository.dart`

This repository is responsible for fetching detailed information and historical data for individual cryptocurrencies.

##### `CoinDetailsRepository.fetchCoinChartData`

Fetches historical chart data for a specific coin.

**Parameters:**

*   `id` (String): The unique identifier of the cryptocurrency (e.g., 'bitcoin').
*   `vsCurrency` (String): The currency to compare against (e.g., 'usd'). Defaults to 'usd'.
*   `days` (int): The number of days for which to retrieve data. Defaults to 7.

**Returns:**

A `Future<NetworkResponseModel<CryptoChartDataModel>>` containing the historical chart data for the specified coin.

## 4. Request/Response Examples

### Fetching Coin Market Data

**Request:**

```dart
final coinRepository = CoinRepository();
final marketData = await coinRepository.fetchCoinMarketData(
  vsCurrency: 'usd',
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
      "symbol": "btc",
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
      "price_change_percentage_24h": 0.8375,
      "market_cap_change_24h": 10000000000,
      "market_cap_change_percentage_24h": 0.8812,
      "circulating_supply": 19000000,
      "total_supply": 21000000,
      "sparkline_in_72h": [ /* ... sparkline data ... */ ],
      "price_change_percentage_72h_in_currency": 1.50,
      "price_change_percentage_24h_in_currency": 0.8375,
      "price_change_percentage_30d_in_currency": 10.25,
      "price_change_percentage_60d_in_currency": 15.50,
      "price_change_percentage_200d_in_currency": 50.75,
      "price_change_percentage_1y_in_currency": 100.50,
      "ath": 69000.00,
      "ath_change_percentage": -13.04,
      "ath_date": "2021-11-10T14:15:01.123Z",
      "roi": null,
      "last_updated": "2023-10-27T10:30:00.000Z"
    }
    // ... more coin data
  ]
}
```

### Fetching Coin Chart Data

**Request:**

```dart
final coinDetailsRepository = CoinDetailsRepository();
final chartData = await coinDetailsRepository.fetchCoinChartData(
  id: 'bitcoin',
  days: 30,
);
```

**Example Response (Success):**

```json
{
  "prices": [
    [1678886400000, 22000.50],
    [1678972800000, 22500.75],
    // ... more data points
  ],
  "market_caps": [
    [1678886400000, 420000000000],
    [1678972800000, 430000000000],
    // ... more data points
  ],
  "total_volumes": [
    [1678886400000, 25000000000],
    [1678972800000, 26000000000],
    // ... more data points
  ]
}
```

## 5. Error Handling

The application utilizes a custom `ExceptionHandler` to manage API-related errors.

### `lib/network/exception_handler.dart`

This class provides a static method `enhanceException` to transform base API exceptions into more context-specific error messages.

```dart
class ExceptionHandler {
  static ApiException enhanceException(Object error, String contextMessage) {
    if (error is ApiException) {
      String enhancedMessage;
      if (error is ConnectivityException) {
        enhancedMessage = 'No internet connection. $contextMessage';
      } else if (error is ApiTimeoutException) {
        enhancedMessage = 'Request timed out. Please try again.';
      } else {
        enhancedMessage = 'An API error occurred: ${error.message}';
      }
      return ApiException(enhancedMessage);
    }
    // Handle other potential error types or rethrow
    return ApiException('An unexpected error occurred: ${error.toString()}');
  }
}
```

Common API exceptions that may be encountered include:

*   **`ConnectivityException`**: Indicates a lack of internet connection.
*   **`ApiTimeoutException`**: Signifies that a request to the API exceeded the allowed time limit.
*   **`RateLimitException`**: (Implied by the partial code snippet) Indicates that the API rate limit has been exceeded.

When an error occurs, the application typically displays a user-friendly message, often through UI components like `LoadFailed`.

## 6. Rate Limiting

The CoinGecko API enforces rate limits. While specific limits are not detailed here, developers should be mindful of these restrictions to avoid service disruptions. Implementations should include strategies for handling rate limit errors gracefully, such as exponential backoff or caching.

## 7. SDK/Client Usage Examples

The application utilizes a custom `HttpClient` for making network requests. This client is instantiated and used within the repository layer.

### `lib/network/http_client.dart` (Conceptual Usage)

```dart
// Example of how HttpClient might be used within a repository
class SomeRepository extends BaseRepository {
  Future<NetworkResponseModel<T>> getRequest<T>(String url) async {
    try {
      final response = await _httpClient.get(url); // Assuming _httpClient is an instance of HttpClient
      // Process response and return NetworkResponseModel
      return NetworkResponseModel<T>.fromJson(response.data);
    } catch (e) {
      throw ExceptionHandler.enhanceException(e, 'Failed to perform GET request');
    }
  }
}
```

The `BaseRepository` class provides a common `_httpClient` instance, ensuring consistent network request handling across all repositories.

## 8. Testing Instructions

Unit and integration tests are crucial for verifying the functionality of the API interaction layer.

### Unit Testing Repositories

Tests for repositories should mock the `HttpClient` to isolate the repository logic. This allows for controlled testing of data fetching and error handling.

**Example (Conceptual):**

```dart
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';
import 'package:cryptowave/repositories/coin_repository.dart';
import 'package:cryptowave/network/http_client.dart'; // Assuming HttpClient is defined here

// Mock HttpClient
class MockHttpClient extends Mock implements HttpClient {}

void main() {
  group('CoinRepository Tests', () {
    late CoinRepository coinRepository;
    late MockHttpClient mockHttpClient;

    setUp(() {
      mockHttpClient = MockHttpClient();
      // Inject the mock HttpClient into the repository or its dependencies
      // This setup depends on how HttpClient is managed (e.g., via GetIt)
      // For demonstration, assume direct instantiation or injection:
      // coinRepository = CoinRepository(httpClient: mockHttpClient);
    });

    test('fetchCoinMarketData returns data on success', () async {
      // Arrange: Mock the http client's get method to return a successful response
      when(mockHttpClient.get(any)).thenAnswer((_) async => http.Response(
        '''
        {
          "data": [
            {
              "id": "bitcoin",
              "symbol": "btc",
              "name": "Bitcoin",
              "current_price": 60000.50
              // ... other fields
            }
          ]
        }
        ''',
        200,
      ));

      // Act: Call the repository method
      final result = await coinRepository.fetchCoinMarketData();

      // Assert: Verify the result
      expect(result.data.length, 1);
      expect(result.data[0].name, 'Bitcoin');
    });

    test('fetchCoinMarketData throws ApiException on network error', () async {
      // Arrange: Mock the http client's get method to throw an exception
      when(mockHttpClient.get(any)).thenThrow(Exception('Network error'));

      // Act & Assert: Verify that an ApiException is thrown
      expect(
        () async => await coinRepository.fetchCoinMarketData(),
        throwsA(isA<ApiException>()),
      );
    });
  });
}
```

### Integration Testing

Integration tests should verify the end-to-end flow, including UI interactions and data retrieval from the actual CoinGecko API (or a controlled test environment). These tests ensure that all components work together correctly.

**Key areas to test:**

*   **Data Fetching:** Verify that data is correctly fetched and displayed for various cryptocurrencies.
*   **Chart Rendering:** Ensure that historical data is accurately visualized in the charts.
*   **Error States:** Test how the application handles network errors, timeouts, and API errors, ensuring appropriate user feedback.
*   **Navigation:** Confirm that navigation between different screens (e.g., from a list of coins to coin details) functions as expected.