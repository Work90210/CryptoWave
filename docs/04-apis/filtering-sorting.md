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

##### `CoinDetailsRepository.fetchCoinDetails`

Fetches detailed information for a specific coin.

**Parameters:**

*   `id` (String): The unique identifier of the coin (e.g., 'bitcoin').
*   `vsCurrency` (String): The currency to compare against (e.g., 'usd'). Defaults to 'usd'.
*   `days` (int): The number of days for which to fetch historical data. Defaults to 7.

**Returns:**

A `Future<NetworkResponseModel<CryptoChartDataModel>>` containing the detailed and historical data for the specified coin.

## 4. Request/Response Examples

### Fetching Coin Market Data

**Request:**

```dart
final coinRepository = CoinRepository();
final marketData = await coinRepository.fetchCoinMarketData(
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
      "price_change_percentage_24h": 0.84,
      "market_cap_change_24h": 10000000000,
      "market_cap_change_percentage_24h": 0.88,
      "circulating_supply": 19000000,
      "total_supply": 21000000,
      "sparkline_in_7d": {
        "price": [60000.50, 60200.75, 60500.00, 60300.25, 60100.50, 60400.75, 60600.00]
      },
      "price_change_percentage_7d_in_currency": 2.50,
      "price_change_percentage_14d_in_currency": 5.00,
      "price_change_percentage_30d_in_currency": 10.00,
      "price_change_percentage_60d_in_currency": 15.00,
      "price_change_percentage_200d_in_currency": 50.00,
      "price_change_percentage_1y_in_currency": 100.00,
      "ath": 69000.00,
      "ath_change_percentage": -13.04,
      "ath_date": "2021-11-10T14:24:11.000Z",
      "roi": null,
      "last_updated": "2023-10-27T10:30:00.000Z"
    }
    // ... more coin data
  ]
}
```

### Fetching Coin Details and Chart Data

**Request:**

```dart
final coinDetailsRepository = CoinDetailsRepository();
final coinDetails = await coinDetailsRepository.fetchCoinDetails(
  id: 'ethereum',
  vsCurrency: 'usd',
  days: 30,
);
```

**Example Response (Success):**

```json
{
  "prices": [
    [1678886400000, 1500.25],
    [1678972800000, 1520.50],
    // ... more price data
  ],
  "market_caps": [
    [1678886400000, 180000000000],
    [1678972800000, 182000000000],
    // ... more market cap data
  ],
  "total_volumes": [
    [1678886400000, 10000000000],
    [1678972800000, 10200000000],
    // ... more volume data
  ]
}
```

## 5. Error Handling

The application utilizes a custom `ExceptionHandler` to manage API-related errors.

### `lib/network/exception_handler.dart`

This class provides a static method `enhanceException` to transform base API exceptions into more context-specific error messages.

**Example Exception Types:**

*   `ApiException`: Base class for API-related errors.
*   `ConnectivityException`: Indicates a lack of internet connection.
*   `ApiTimeoutException`: Indicates that a request timed out.

The `enhanceException` method takes an `Object error` and a `String contextMessage` to provide a more informative error message.

**Example Usage within a Repository:**

```dart
try {
  // ... API call logic ...
} catch (e) {
  throw ExceptionHandler.enhanceException(e, 'Failed to fetch coin data');
}
```

## 6. Rate Limiting

Information regarding rate limiting is not explicitly detailed in the provided context. However, it is standard practice to adhere to the rate limits imposed by the CoinGecko API to ensure uninterrupted service. Consult the official CoinGecko API documentation for current rate limit policies.

## 7. SDK/Client Usage Examples

The application's data fetching logic is encapsulated within repositories. The `HttpClient` class, likely a custom implementation or a wrapper around a standard HTTP client library, is used for making network requests.

### Example: Using `HttpClient` (Conceptual)

```dart
// Assuming HttpClient is a singleton or accessible via a service locator
final httpClient = HttpClient.instance;

Future<NetworkResponseModel<T>> get<T>(String url, {Map<String, dynamic>? queryParameters}) async {
  try {
    final response = await httpClient.get(url, queryParameters: queryParameters);
    // Process response and return NetworkResponseModel<T>
    // Handle potential exceptions here
  } catch (e) {
    // Enhance and re-throw exception
    throw ExceptionHandler.enhanceException(e, 'GET request to $url failed');
  }
}
```

## 8. Testing Instructions

Testing of API interactions typically involves mocking the `HttpClient` or the repository layer to simulate network responses and error conditions.

### Unit Testing Repositories

When unit testing repositories like `CoinRepository` or `CoinDetailsRepository`, mock the `HttpClient` to return predefined responses or errors. This allows for isolated testing of the repository's logic without making actual network calls.

**Example (Conceptual using Mocktail):**

```dart
import 'package:mocktail/mocktail.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:cryptowave/network/http_client.dart';
import 'package:cryptowave/repositories/coin_repository.dart';

class MockHttpClient extends Mock implements HttpClient {}

void main() {
  late MockHttpClient mockHttpClient;
  late CoinRepository coinRepository;

  setUp(() {
    mockHttpClient = MockHttpClient();
    coinRepository = CoinRepository(); // Assuming it uses HttpClient internally
  });

  test('fetchCoinMarketData returns data on success', () async {
    // Arrange
    final mockResponse = {'data': [...]}; // Example successful response
    when(() => mockHttpClient.get('/coins/markets', any)).thenAnswer((_) async => mockResponse);

    // Act
    final result = await coinRepository.fetchCoinMarketData();

    // Assert
    expect(result.data, isNotNull);
    // Add more assertions to verify the data structure and content
  });

  test('fetchCoinMarketData throws exception on network error', () async {
    // Arrange
    when(() => mockHttpClient.get('/coins/markets', any)).thenThrow(ApiException('Network error'));

    // Act & Assert
    expect(() => coinRepository.fetchCoinMarketData(), throwsA(isA<ApiException>()));
  });
}
```