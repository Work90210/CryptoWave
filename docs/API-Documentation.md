# CryptoWave API Documentation

This document provides a comprehensive reference for the CryptoWave API, detailing its functionalities, endpoints, and error handling mechanisms.

## 1. API Overview

CryptoWave is a Flutter application that leverages the CoinGecko API to provide real-time cryptocurrency market data, price charts, and detailed coin information. The application's core functionality relies on fetching and processing data from the CoinGecko API.

## 2. Authentication

Authentication is not explicitly handled or documented within the provided code snippets. The application appears to interact with the CoinGecko API without requiring specific authentication credentials.

## 3. Endpoint/Function Reference

The provided code context primarily focuses on the application's structure, constants, and exception handling, rather than direct API endpoint definitions. However, the following classes and their associated functionalities are relevant to API interactions:

### 3.1. `AppConstants`

This class, located in `lib/constants.dart`, defines application-wide constants, including the base URL for the CoinGecko API.

| Constant      | Value                                | Description                 |
|---------------|--------------------------------------|-----------------------------|
| `API_URL`     | `https://api.coingecko.com/api/v3/` | Base URL for the CoinGecko API |

### 3.2. `ExceptionHandler`

This utility class, found in `lib/network/exception_handler.dart`, is responsible for handling API exceptions and providing more context.

| Method             | Description                                                                                              |
|--------------------|----------------------------------------------------------------------------------------------------------|
| `enhanceException` | Transforms a base `ApiException` into a domain-specific exception with enhanced contextual information. |

The `enhanceException` method handles specific API exceptions:

*   **`ConnectivityException`**: Indicates a lack of internet connection.
*   **`ApiTimeoutException`**: Signals that a request has timed out.
*   **`Rat`**: (Likely refers to Rate Limit Exception, though the snippet is truncated) Indicates that an API rate limit has been exceeded.

### 3.3. Repositories

The following repository classes are responsible for interacting with the CoinGecko API to fetch specific data:

*   **`BaseRepository`**: Provides common functionality for API calls, including a `_httpClient` instance and a logger. It defines a `delete` method for performing DELETE requests.
*   **`CoinDetailsRepository`**: Handles API calls related to cryptocurrency coin details, including fetching historical chart data.
*   **`CoinRepository`**: Manages API calls for general cryptocurrency market data, such as fetching coin market data with parameters for currency, order, pagination, etc.

## 4. Request/Response Examples

Specific request and response examples for API endpoints are not detailed in the provided code snippets. However, based on the repository method signatures, typical requests would involve:

*   **Fetching Coin Market Data (`CoinRepository`)**:
    *   **Parameters**: `vsCurrency`, `order`, `perPage`, `page`.
    *   **Example Request (Conceptual)**:
        ```
        GET /coins/markets?vs_currency=usd&order=market_cap_desc&per_page=10&page=1
        ```
*   **Fetching Coin Details (`CoinDetailsRepository`)**:
    *   **Parameters**: `id`, `vsCurrency`, `days`.
    *   **Example Request (Conceptual)**:
        ```
        GET /coins/{id}?vs_currency={vs_currency}&days={days}
        ```

## 5. Error Handling

The `ExceptionHandler` class centralizes the handling of API-related errors. It enhances base exceptions with more specific context:

*   **Connectivity Issues**: `ConnectivityException` is caught and can be enhanced with a message indicating a lack of internet connection.
*   **Timeouts**: `ApiTimeoutException` is handled, providing a message to retry the request.
*   **Rate Limiting**: A `Rat` exception (likely `RateLimitException`) is handled, suggesting a retry mechanism.

## 6. Rate Limiting

The provided code context indicates the potential for handling rate limit exceptions (`Rat` exception in `ExceptionHandler`). This suggests that the application is designed to be mindful of API rate limits imposed by CoinGecko. Specific implementation details for managing rate limits, such as exponential backoff or request queuing, are not visible in the provided snippets.

## 7. SDK/Client Usage Examples

The application utilizes a custom `HttpClient` instance, likely for managing network requests. The repositories (`BaseRepository`, `CoinDetailsRepository`, `CoinRepository`) abstract the direct usage of this client, providing methods for specific API interactions.

The `main.dart` file shows the initialization process:

```dart
import 'package:cryptowave/routes.dart';
import 'package:cryptowave/ui/home_page/home.dart';
import 'package:cryptowave/utils/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:navigation_history_observer/navigation_history_observer.dart';

final RouteObserver<PageRoute<dynamic>> routeObserver = RouteObserver<PageRoute<dynamic>>();
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(); // Loads environment variables, potentially including API keys if needed.
  setupDependencies(); // Initializes service dependencies.
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // ... application UI setup
  }
}
```

The `setupDependencies()` function, called during application startup, is responsible for initializing services, including potentially the `HttpClient` and repositories.

## 8. Testing Instructions

Testing instructions are not provided within the given code context. However, typical testing strategies for such an application would involve:

*   **Unit Tests**: For individual repository methods to verify correct API request construction and response parsing. Mocking the `HttpClient` would be crucial here.
*   **Widget Tests**: To ensure UI components correctly display data fetched from repositories and handle loading/error states.
*   **Integration Tests**: To test the flow of data from the UI through the Bloc/Cubit layer to the repositories and back, simulating real API interactions.