# CryptoWave API Documentation

## 1. API Overview

CryptoWave utilizes the CoinGecko API to provide real-time cryptocurrency market data, price charts, and detailed information about various cryptocurrencies. The application fetches this data to display real-time cryptocurrency prices, trends, and market data.

## 2. Authentication

Authentication is not explicitly handled or documented within the provided code snippets. The application directly interacts with the CoinGecko API, which typically does not require API keys for basic data retrieval.

## 3. Endpoint/Function Reference

The provided code context primarily focuses on the application's structure, constants, and exception handling. There are no direct API endpoint definitions or exported functions that are exposed for external use within the provided snippets.

However, the following classes and their potential methods are relevant to API interaction:

### 3.1. `AppConstants`

This class defines application-wide constants, including the base URL for the CoinGecko API.

| Constant      | Value                                | Description                 |
|---------------|--------------------------------------|-----------------------------|
| `API_URL`     | `https://api.coingecko.com/api/v3/` | Base URL for the CoinGecko API |

### 3.2. `ExceptionHandler`

This utility class is responsible for handling API exceptions consistently across the application.

| Method             | Description                                                                                             |
|--------------------|---------------------------------------------------------------------------------------------------------|
| `enhanceException` | Transforms a base `ApiException` into a domain-specific exception with more context about the operation. |

The `enhanceException` method handles specific `ApiException` types:

*   **`ConnectivityException`**: Indicates a lack of internet connection.
*   **`ApiTimeoutException`**: Indicates that a request has timed out.
*   **`Rat`**: (Likely refers to Rate Limit Exception, though the snippet is truncated) Indicates an issue related to API rate limits.

### 3.3. Repositories

The following repository classes are responsible for interacting with the CoinGecko API:

*   **`BaseRepository`**: Provides common functionality for API calls, including an `HttpClient` instance and a logger. It defines a `delete` method, suggesting support for DELETE HTTP requests.
*   **`CoinRepository`**: Handles cryptocurrency coin-related API calls. It includes a `fetchCoinMarketData` method with parameters for `vsCurrency`, `order`, `perPage`, and `page`.
*   **`CoinDetailsRepository`**: Manages API calls for specific cryptocurrency coin details. It includes a `fetchHistoricalChartData` method that accepts `id`, `vsCurrency`, and `days` as parameters.

## 4. Request/Response Examples

Specific request and response examples are not provided in the given code snippets. However, based on the repository method signatures, typical requests would involve GET requests to the CoinGecko API endpoints, with parameters like those listed above. Responses would be JSON objects containing cryptocurrency data.

## 5. Error Handling

The `ExceptionHandler` class is central to error handling. It aims to provide more context to API exceptions. The following exceptions are explicitly mentioned:

*   **`ConnectivityException`**: Raised when there is no internet connection. The error message is enhanced with a context message.
*   **`ApiTimeoutException`**: Raised when an API request times out. The error message indicates to try again.
*   **`Rat` Exception**: Likely indicates an API rate limit has been exceeded.

## 6. Rate Limiting

The presence of a potential `Rat` exception in `ExceptionHandler` suggests that the application may encounter or handle API rate limiting issues. However, specific details on how rate limiting is managed or enforced are not present in the provided code.

## 7. SDK/Client Usage Examples

The code indicates the use of a custom `HttpClient` instance within `BaseRepository`. The `main.dart` file shows the initialization of dependencies using `setupDependencies()`, which likely configures services including the HTTP client.

```dart
// Example of potential HttpClient usage within a repository (conceptual)
// final HttpClient _httpClient = HttpClient.instance;
//
// Future<NetworkResponseModel<T>> fetchData(...) async {
//   try {
//     final response = await _httpClient.get(url: 'some_endpoint');
//     return NetworkResponseModel<T>.fromJson(response);
//   } catch (e) {
//     throw ExceptionHandler.enhanceException(e, 'Failed to fetch data');
//   }
// }
```

## 8. Testing Instructions

Testing instructions are not provided within the given code snippets. However, typical testing strategies for such an application would involve:

*   **Unit Testing**: Testing individual repository methods and utility functions in isolation.
*   **Widget Testing**: Verifying the UI components and their interactions, potentially mocking API responses.
*   **Integration Testing**: Testing the flow of data from the API through the repositories and into the UI.

The use of the Bloc pattern suggests that state management and business logic can be tested effectively using bloc testing utilities.