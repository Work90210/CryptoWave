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

*   `vsCurrency`: The currency to compare against (e.g., 'usd'). Defaults to 'usd'.
*   `order`: The parameter to order the results by (e.g., 'market_cap_desc'). Defaults to 'market_cap_desc'.
*   `perPage`: The number of results to return per page. Defaults to 10.
*   `page`: The page number for pagination. Defaults to 1.

**Returns:**

A `Future<NetworkResponseModel<CoinModel>>` containing the fetched coin market data.

### `lib/repositories/coin_details_repository.dart`

This repository is responsible for fetching detailed information and historical data for specific cryptocurrencies.

#### `CoinDetailsRepository.fetchCoinChartData`

This function retrieves historical chart data for a specific coin.

**Parameters:**

*   `id`: The unique identifier of the cryptocurrency (e.g., 'bitcoin').
*   `vsCurrency`: The currency to compare against (e.g., 'usd'). Defaults to 'usd'.
*   `days`: The number of days for which to fetch data. Defaults to 7.

**Returns:**

A `Future<NetworkResponseModel<CryptoChartDataModel>>` containing the historical chart data for the specified coin.

### `lib/network/exception_handler.dart`

This utility class provides methods for handling API exceptions.

#### `ExceptionHandler.enhanceException`

This static method transforms a base `ApiException` into a domain-specific exception with enhanced context.

**Parameters:**

*   `error`: The original exception object.
*   `contextMessage`: A string providing additional context about the operation being performed.

**Returns:**

An `ApiException` object with an enhanced error message.

## 4. Request/Response Examples

Specific request and response examples are not provided in this documentation as the interaction is abstracted by repository methods. The structure of the data returned by the CoinGecko API will dictate the format of the `NetworkResponseModel` objects.

## 5. Error Handling

The `ExceptionHandler` class is utilized to manage and enhance API-related exceptions. This includes:

*   **`ConnectivityException`**: Indicates a lack of internet connection. The error message is enhanced with the provided `contextMessage`.
*   **`ApiTimeoutException`**: Signifies that a request to the API timed out. The error message is standardized to "Request timed out. Please try again."
*   **`RateLimitException`**: (Implied by the partial code snippet) This exception likely handles cases where the API rate limits are exceeded.

The `enhanceException` method ensures that exceptions are presented with relevant context for debugging and user feedback.

## 6. Rate Limiting

Information regarding specific rate limiting policies of the CoinGecko API is not detailed within this documentation. Users should refer to the CoinGecko API documentation for details on usage limits.

## 7. SDK/Client Usage Examples

The application utilizes a `HttpClient` instance, accessed via `HttpClient.instance`, for making network requests. Repositories interact with this client to perform data fetching operations.

## 8. Testing Instructions

Testing instructions are not provided within this documentation. For information on how to test the application, please refer to the project's testing guidelines or relevant code comments.