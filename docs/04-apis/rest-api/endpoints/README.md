# CryptoWave API Documentation

This document provides comprehensive API documentation for the CryptoWave application.

## 1. API Overview

CryptoWave utilizes the CoinGecko API to fetch real-time cryptocurrency market data, including prices, trends, and detailed coin information. The application's data fetching and management are handled through dedicated repository classes.

## 2. Authentication

Authentication is not explicitly managed or documented within the provided code snippets. The application interacts directly with the CoinGecko API, which may have its own authentication requirements not detailed here.

## 3. Endpoint/Function Reference

The primary interaction with external data occurs through repository classes. The following repositories are identified:

### 3.1. `BaseRepository`

This abstract class serves as the foundation for all repository implementations, providing common functionality for API calls.

*   **`_httpClient`**: An instance of `HttpClient` used for making network requests.
*   **`_logger`**: An instance of `LoggerService` for logging repository operations.
*   **`delete<T>`**: A method to perform DELETE requests.
    *   **Parameters:**
        *   `url` (required): The URL for the DELETE request.
        *   `headers` (optional): A map of headers to include in the request.
        *   `que` (optional): Query parameters for the request.
    *   **Returns:** A `Future` containing a `NetworkResponseModel<T>`.

### 3.2. `CoinDetailsRepository`

This repository is responsible for handling API calls related to specific cryptocurrency details.

*   **`_logger`**: An instance of `LoggerService` for logging repository operations.
*   **`fetchHistoricalChartData`**: Fetches historical chart data for a specific coin.
    *   **Parameters:**
        *   `id` (required): The unique identifier for the cryptocurrency (e.g., 'bitcoin').
        *   `vsCurrency` (optional, default: 'usd'): The currency against which to compare the coin's price.
        *   `days` (optional, default: 7): The number of days for which to fetch historical data.
    *   **Returns:** A `Future` containing a `NetworkResponseModel<CryptoChartDataModel>`.

### 3.3. `CoinRepository`

This repository handles API calls for general cryptocurrency market data.

*   **`_logger`**: An instance of `LoggerService` for logging repository operations.
*   **`fetchCoinMarketData`**: Fetches market data for cryptocurrencies.
    *   **Parameters:**
        *   `vsCurrency` (optional, default: 'usd'): The currency to compare against.
        *   `order` (optional, default: 'market\_cap\_desc'): The parameter by which to order the results.
        *   `perPage` (optional, default: 10): The number of results to return per page.
        *   `page` (optional, default: 1): The page number for paginated results.
    *   **Returns:** A `Future` containing a `NetworkResponseModel<CoinModel>`.

### 3.4. `ExceptionHandler`

This utility class provides methods for handling API exceptions.

*   **`enhanceException`**: Transforms a base `ApiException` into a domain-specific exception with enhanced context.
    *   **Parameters:**
        *   `error`: The original error object.
        *   `contextMessage`: A string providing additional context about the operation.
    *   **Returns:** An `ApiException` with an enhanced message. This method specifically handles:
        *   `ConnectivityException`: Indicates no internet connection.
        *   `ApiTimeoutException`: Indicates that a request timed out.

## 4. Request/Response Examples

Specific request and response examples are not provided in the current context. However, the structure suggests that API calls will return data encapsulated within a `NetworkResponseModel<T>`, where `T` is the expected data model (e.g., `CoinModel`, `CryptoChartDataModel`).

## 5. Error Handling

The `ExceptionHandler` class is central to error management. It is designed to transform generic API exceptions into more informative, domain-specific exceptions.

*   **`ConnectivityException`**: Raised when there is no internet connection. The error message is augmented with the provided `contextMessage`.
*   **`ApiTimeoutException`**: Raised when an API request exceeds its time limit, indicating a need to retry.
*   Other `ApiException` types are handled by providing an enhanced message based on the original error.

## 6. Rate Limiting

Rate limiting information for the CoinGecko API is not detailed in the provided code. Users should consult the CoinGecko API documentation for any applicable rate limits.

## 7. SDK/Client Usage Examples

The application utilizes a custom `HttpClient` for network requests. The `BaseRepository` class abstracts the common logic for making these requests. Specific usage examples for SDKs or clients are not provided in this context.

## 8. Testing Instructions

Testing instructions are not provided within the scope of this documentation.