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
final response = await coinRepository.fetchCoinMarketData(
  vsCurrency: 'usd',
  perPage: 50,
  page: 1,
);
```

**Successful Response (Conceptual):**

```json
{
  "data": [
    {
      "id": "bitcoin",
      "symbol": "btc",
      "name": "Bitcoin",
      "image": "https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1547033579",
      "current_price": 60000.50,
      "market_cap": 1200000000000,
      "price_change_percentage_24h": 2.5
    },
    {
      "id": "ethereum",
      "symbol": "eth",
      "name": "Ethereum",
      "image": "https://assets.coingecko.com/coins/images/279/large/ethereum.png?1595348590",
      "current_price": 4000.75,
      "market_cap": 480000000000,
      "price_change_percentage_24h": 1.8
    }
    // ... more coins
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
  days: 30,
);
```

**Successful Response (Conceptual):**

```json
{
  "prices": [
    [1678886400000, 60000.50],
    [1678972800000, 60500.75],
    // ... more data points
  ],
  "market_caps": [
    [1678886400000, 1200000000000],
    [1678972800000, 1210000000000],
    // ... more data points
  ],
  "total_volumes": [
    [1678886400000, 50000000000],
    [1678972800000, 51000000000],
    // ... more data points
  ]
}
```

## 5. Error Handling

The application utilizes a custom exception handling mechanism to manage API-related errors. The `ExceptionHandler` class in `lib/network/exception_handler.dart` is responsible for transforming base API exceptions into more context-specific ones.

Common exceptions include:

*   `ConnectivityException`: Indicates a lack of internet connection.
*   `ApiTimeoutException`: Signals that a request to the API timed out.
*   `RateLimitException`: Occurs when the API rate limits are exceeded.

The `enhanceException` method within `ExceptionHandler` provides a way to add context to these exceptions based on the operation being performed.

## 6. Rate Limiting

The CoinGecko API enforces rate limits. While this documentation does not specify the exact limits, developers should be mindful of them to avoid service disruptions. Implementations should include strategies for handling rate limiting, such as exponential backoff or caching, to ensure stable operation.

## 7. SDK/Client Usage Examples

The application's data fetching logic is encapsulated within repository classes. These classes abstract the underlying HTTP client and data parsing, providing a clean interface for data retrieval.

### Example: Fetching Top 10 Cryptocurrencies by Market Cap

```dart
import 'package:cryptowave/repositories/coin_repository.dart';
import 'package:cryptowave/network/network_response.dart'; // Assuming NetworkResponseModel is defined here

Future<void> displayTopCryptocurrencies() async {
  final coinRepository = CoinRepository();
  try {
    final NetworkResponseModel<CoinModel> response = await coinRepository.fetchCoinMarketData(
      vsCurrency: 'usd',
      order: 'market_cap_desc',
      perPage: 10,
      page: 1,
    );

    if (response.data != null) {
      print('Top 10 Cryptocurrencies:');
      for (var coin in response.data!) {
        print('- ${coin.name} (${coin.symbol}): \$${coin.currentPrice}');
      }
    } else {
      print('Failed to fetch coin data.');
    }
  } catch (e) {
    print('An error occurred: $e');
  }
}
```

## 8. Testing Instructions

To test the API interactions:

1.  **Ensure Dependencies:** Verify that all necessary Flutter and Dart dependencies are installed.
2.  **Network Connectivity:** Ensure the device or emulator has a stable internet connection.
3.  **Mocking (for unit/widget tests):** For unit and widget testing, mock the `HttpClient` and repository methods to isolate the logic being tested. This allows for controlled testing of data fetching and error handling without making actual network requests.
4.  **Integration Testing:** For integration tests, ensure the application can successfully connect to the CoinGecko API endpoints. Use tools like `http_client_testing` or similar packages to intercept and assert network requests and responses.

**Example of mocking a repository call (conceptual):**

```dart
// Assuming you are using a mocking framework like Mockito

// Mock the CoinRepository
final mockCoinRepository = MockCoinRepository();

// Stub the fetchCoinMarketData method to return a mock response
when(mockCoinRepository.fetchCoinMarketData(
  vsCurrency: 'usd',
  perPage: 10,
  page: 1,
)).thenAnswer((_) async => NetworkResponseModel<CoinModel>(
  data: [
    CoinModel(id: 'bitcoin', symbol: 'btc', name: 'Bitcoin', imageUrl: '', currentPrice: 60000.50, priceChangePercentage24h: 2.5),
    // ... other mock coins
  ],
  error: null,
));

// Use the mocked repository in your widget/bloc test
// ...
```