# CryptoWave API Documentation

This document provides a comprehensive reference for the CryptoWave API, detailing its functionalities, endpoints, and error handling mechanisms.

## 1. API Overview

CryptoWave is a Flutter application that leverages the CoinGecko API to provide real-time cryptocurrency market data, price charts, and detailed coin information. The application's core functionality revolves around fetching and displaying this data to users.

## 2. Authentication

This API does not require authentication. All data is publicly accessible through the CoinGecko API.

## 3. Endpoint/Function Reference

The primary interaction with external data is managed through repositories that abstract API calls. The following repository is identified:

### `lib/repositories/coin_repository.dart`

This repository is responsible for fetching cryptocurrency market data.

#### `CoinRepository.fetchCoinMarketData`

This function retrieves market data for cryptocurrencies.

**Parameters:**

*   `vsCurrency` (String): The currency to compare against (e.g., 'usd'). Defaults to 'usd'.
*   `order` (String): The parameter to order the results by (e.g., 'market_cap_desc'). Defaults to 'market_cap_desc'.
*   `perPage` (int): The number of results to return per page. Defaults to 10.
*   `page` (int): The page number for pagination. Defaults to 1.

**Returns:**

*   A `Future<NetworkResponseModel<CoinModel>>` containing the fetched coin market data.

#### `CoinRepository.fetchCoinDetails`

This function retrieves detailed information for a specific cryptocurrency.

**Parameters:**

*   `id` (String): The unique identifier of the cryptocurrency (e.g., 'bitcoin').
*   `vsCurrency` (String): The currency to compare against (e.g., 'usd'). Defaults to 'usd'.
*   `days` (int): The number of days for which historical data should be fetched. Defaults to 7.

**Returns:**

*   A `Future<NetworkResponseModel<CryptoChartDataModel>>` containing the detailed coin data and chart information.

### `lib/network/exception_handler.dart`

This utility class provides methods for handling API exceptions.

#### `ExceptionHandler.enhanceException`

This static method transforms a base `ApiException` into a more domain-specific exception with additional context.

**Parameters:**

*   `error` (Object): The original exception object.
*   `contextMessage` (String): A message providing context about the operation being performed.

**Returns:**

*   An `ApiException` object with an enhanced error message.

**Supported Exception Types:**

*   `ConnectivityException`: Indicates a lack of internet connection.
*   `ApiTimeoutException`: Indicates that a request timed out.
*   `RateLimitException`: Indicates that the API rate limit has been exceeded.

## 4. Request/Response Examples

Specific request and response examples are not provided in the current context. However, the structure of the data is implied by the repository method return types (`CoinModel`, `CryptoChartDataModel`).

## 5. Error Handling

The `ExceptionHandler` class is utilized to manage and enhance API-related exceptions. It transforms generic API errors into more specific exceptions, such as `ConnectivityException` or `ApiTimeoutException`, providing clearer context for error handling within the application.

## 6. Rate Limiting

Information regarding rate limiting is not explicitly detailed in the provided context. However, the presence of `RateLimitException` in the `ExceptionHandler` suggests that rate limiting is a consideration for the underlying CoinGecko API.

## 7. SDK/Client Usage Examples

The application utilizes a custom `HttpClient` instance for making network requests. The `BaseRepository` class provides common methods for performing HTTP operations, such as `delete`, which are then extended by specific repositories like `CoinRepository` and `CoinDetailsRepository`.

## 8. Testing Instructions

Testing instructions are not provided in the current context.