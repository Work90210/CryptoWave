# CryptoWave API Documentation

## 1. API Overview

CryptoWave utilizes the CoinGecko API to provide real-time cryptocurrency market data, price charts, and detailed information about various cryptocurrencies. The application fetches this data to display real-time cryptocurrency prices, trends, and market data.

## 2. Authentication

Authentication is not explicitly handled or documented within the provided code snippets. The application directly interacts with the CoinGecko API, which typically does not require API keys for basic data retrieval.

## 3. Endpoint/Function Reference

The provided code context primarily focuses on the application's structure, constants, and exception handling. There are no direct API endpoints or functions exposed for external consumption within the given snippets.

However, the following classes and their potential methods are relevant to API interaction:

### `AppConstants`

This class defines application-wide constants, including the base URL for the CoinGecko API.

*   **`API_URL`**:
    *   **Type**: `static const String`
    *   **Description**: The base URL for the CoinGecko API.
    *   **Value**: `'https://api.coingecko.com/api/v3/'`

### `ExceptionHandler`

This utility class is responsible for handling API exceptions and providing more context.

*   **`enhanceException(Object error, String contextMessage)`**:
    *   **Description**: Transforms a base `ApiException` into a domain-specific exception with enhanced context about the operation being performed.
    *   **Parameters**:
        *   `error`: The original exception object.
        *   `contextMessage`: A string providing context about the operation.
    *   **Returns**: An `ApiException` with an enhanced message.
    *   **Specific Exception Handling**:
        *   `ConnectivityException`: Indicates no internet connection. The enhanced message will include the provided `contextMessage`.
        *   `ApiTimeoutException`: Indicates that a request timed out. The enhanced message will be "Request timed out. Please try again."
        *   `Rat` (likely `RateLimitException` or similar): Handles rate limiting errors.

### Repositories

The following repository classes are involved in data fetching, implying interaction with the CoinGecko API:

*   **`BaseRepository`**:
    *   **Description**: The base repository class that all other repositories extend. It provides common functionality for API calls.
    *   **Internal Members**:
        *   `_httpClient`: An instance of `HttpClient` used for network requests.
        *   `_logger`: An instance of `LoggerService` for logging repository operations.
    *   **Methods**:
        *   `delete<T>(...)`: Performs a DELETE request.

*   **`CoinRepository`**:
    *   **Description**: Handles API calls related to cryptocurrency coin data.
    *   **Methods**:
        *   `fetchCoinMarketData(...)`: Fetches coin market data.
            *   **Parameters**:
                *   `vsCurrency`: The currency to compare against (defaults to 'USD').
                *   `order`: The parameter to order by (defaults to market cap descending).
                *   `perPage`: Number of results per page (defaults to 10).
                *   `page`: The page number (defaults to 1).

*   **`CoinDetailsRepository`**:
    *   **Description**: Handles API calls related to specific cryptocurrency coin details.
    *   **Methods**:
        *   `fetchHistoricalChartData(...)`: Fetches historical chart data for a specific coin.
            *   **Parameters**:
                *   `id`: The coin ID (e.g., 'bitcoin').
                *   `vsCurrency`: The currency to compare against (defaults to 'USD').
                *   `days`: The number of days ago to fetch data up to (defaults to 7).

## 4. Request/Response Examples

Specific request and response examples are not provided in the current code context. However, based on the repository method signatures, typical requests would involve GET requests to the CoinGecko API with parameters like coin IDs, currencies, and date ranges. Responses would be JSON payloads containing cryptocurrency market data or chart data.

## 5. Error Handling

The `ExceptionHandler` class is central to error handling. It catches API-related exceptions and provides more user-friendly messages.

*   **Connectivity Issues**: If a `ConnectivityException` occurs, the error message will indicate a lack of internet connection, augmented by any specific context provided.
*   **Timeouts**: `ApiTimeoutException` results in a generic "Request timed out. Please try again." message.
*   **Rate Limiting**: The `ExceptionHandler` is prepared to handle rate limit errors, though the specific message for this scenario is not fully detailed in the snippet.

## 6. Rate Limiting

The presence of `Rat` (likely `RateLimitException`) in the `ExceptionHandler` suggests that rate limiting is a consideration. However, specific details regarding CoinGecko API rate limits or how the application handles them beyond basic exception catching are not present in the provided code.

## 7. SDK/Client Usage Examples

The provided code does not include direct examples of SDK or client usage. The application appears to manage HTTP requests internally, likely through a custom `HttpClient` implementation, rather than relying on an external SDK for API interaction.

## 8. Testing Instructions

Testing instructions are not provided within the code snippets. However, typical testing strategies for such an application would involve:

*   **Unit Tests**: For individual repository methods, mocking the `HttpClient` to simulate API responses (both success and error cases).
*   **Widget Tests**: To verify that UI components correctly display data fetched from repositories and handle loading/error states.
*   **Integration Tests**: To test the flow of data from the API through the repositories and into the UI.