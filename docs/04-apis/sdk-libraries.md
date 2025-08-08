# CryptoWave API Documentation

This document provides a comprehensive reference for the CryptoWave API, detailing its functionalities, endpoints, and error handling mechanisms.

## 1. API Overview

CryptoWave is a Flutter application that leverages the CoinGecko API to provide real-time cryptocurrency market data, price charts, and detailed coin information. The application's core functionality relies on fetching and processing data from the CoinGecko API.

## 2. Authentication

Authentication is not explicitly handled or documented within the provided code snippets. The application appears to interact with the CoinGecko API without requiring specific authentication credentials.

## 3. Endpoint/Function Reference

The provided code context primarily focuses on the application's structure, constants, and exception handling, rather than direct API endpoint definitions. However, the following classes and their implied functionalities are relevant to API interactions:

### 3.1. `AppConstants`

This class, located in `lib/constants.dart`, defines application-wide constants, including the base URL for the CoinGecko API.

```dart
// ignore_for_file: constant_identifier_names

/*
 * Created by Kyle Fuehri
 */

/// Contains application-wide constant values
class AppConstants {
  AppConstants._();

  // API related constants
  /// Base URL for the CoinGecko API
  static const String API_URL = 'https://api.coingecko.com/api/v3/';
}
```

### 3.2. `ExceptionHandler`

The `ExceptionHandler` class in `lib/network/exception_handler.dart` is responsible for managing and transforming API-related exceptions.

```dart
/*
 * Created by Kyle Fuehri
 */

import 'package:cryptowave/network/network_response.dart';

/// Utility class for handling API exceptions consistently across the application
class ExceptionHandler {
  /// Transforms a base ApiException to a domain-specific exception
  /// with more context about the operation being performed
  static ApiException enhanceException(Object error, String contextMessage) {
    if (error is ApiException) {
      // Create a new exception with the same type but enhanced message
      String enhancedMessage;

      if (error is ConnectivityException) {
        enhancedMessage = 'No internet connection. $contextMessage';
      } else if (error is ApiTimeoutException) {
        enhancedMessage = 'Request timed out. Please try again.';
      } else if (error is Rat
```

### 3.3. Repository Classes

The following repository classes are designed to interact with specific CoinGecko API functionalities:

*   **`BaseRepository`**: Provides common functionality for API calls, including a `_httpClient` instance and a logger. It defines a `delete` method.
    ```dart
    /*
     * Created by Kyle Fuehri
     */

    import 'package:cryptowave/network/exception_handler.dart' show ApiException, ExceptionHandler;
    import 'package:cryptowave/network/http_client.dart';
    import 'package:cryptowave/network/network_response.dart';
    import 'package:cryptowave/utils/logger_service.dart';

    /// Base repository class that all repositories should extend
    /// Provides common functionality for API calls
    abstract class BaseRepository {
      /// The HttpClient instance used for network requests
      final HttpClient _httpClient = HttpClient.instance;

      /// Logger for repository operations
      final _logger = LoggerService.instance;

      /// Perform a DELETE request
      Future<NetworkResponseModel<T>> delete<T>({
        required String url,
        Map<String, dynamic>? headers,
        Map<String, dynamic>? que
    ```
*   **`CoinDetailsRepository`**: Handles API calls related to specific cryptocurrency details, including fetching historical chart data.
    ```dart
    import 'package:cryptowave/models/coin_details/crypto_chart_data_model/crypto_chart_data_model.dart';
    import 'package:cryptowave/network/exception_handler.dart';
    import 'package:cryptowave/network/network_response.dart';
    import 'package:cryptowave/repositories/base_repository.dart';
    import 'package:cryptowave/utils/logger_service.dart';

    /// Repository for handling cryptocurrency coin related API calls
    class CoinDetailsRepository extends BaseRepository {
      /// Logger for repository operations
      final _logger = LoggerService.instance;

      /// Fetch historical chart data for a specific coin
      ///
      /// Parameters:
      /// - [id]: Coin ID (e.g., 'bitcoin')
      /// - [vsCurrency]: Currency to compare against (default is USD)
      /// - [days]: Data up to number of days ago (default is 7)
      /// - [inte
    ```
*   **`CoinRepository`**: Manages API calls for general cryptocurrency market data, such as fetching coin market data with parameters for currency, order, pagination, etc.
    ```dart
    import 'package:cryptowave/models/coin/coin_model.dart';
    import 'package:cryptowave/network/exception_handler.dart';
    import 'package:cryptowave/network/network_response.dart';
    import 'package:cryptowave/repositories/base_repository.dart';
    import 'package:cryptowave/utils/logger_service.dart';

    /// Repository for handling cryptocurrency coin related API calls
    class CoinRepository extends BaseRepository {
      /// Logger for repository operations
      final _logger = LoggerService.instance;

      /// Fetch coin market data
      ///
      /// Parameters:
      /// - [vsCurrency]: Currency to compare against (default is USD)
      /// - [order]: Order by which parameter (default is market cap descending)
      /// - [perPage]: Number of results per page (default is 10)
      /// - [page]: Page number (default is 1)
      /// - [
    ```

## 4. Request/Response Examples

Specific request and response examples are not detailed in the provided context. However, the application's architecture suggests that data fetched from the CoinGecko API will be processed and mapped into Dart models, likely utilizing the `Freezed` package for immutable data structures.

## 5. Error Handling

The `ExceptionHandler` class is central to managing API errors. It is designed to transform base API exceptions into more context-specific exceptions.

```dart
/*
 * Created by Kyle Fuehri
 */

import 'package:cryptowave/network/network_response.dart';

/// Utility class for handling API exceptions consistently across the application
class ExceptionHandler {
  /// Transforms a base ApiException to a domain-specific exception
  /// with more context about the operation being performed
  static ApiException enhanceException(Object error, String contextMessage) {
    if (error is ApiException) {
      // Create a new exception with the same type but enhanced message
      String enhancedMessage;

      if (error is ConnectivityException) {
        enhancedMessage = 'No internet connection. $contextMessage';
      } else if (error is ApiTimeoutException) {
        enhancedMessage = 'Request timed out. Please try again.';
      } else if (error is Rat
```

The `ExceptionHandler` can enhance exceptions such as `ConnectivityException` and `ApiTimeoutException` by providing more descriptive messages.

## 6. Rate Limiting

Information regarding rate limiting for the CoinGecko API is not explicitly present in the provided code snippets. Developers should consult the CoinGecko API documentation for details on rate limits and best practices.

## 7. SDK/Client Usage Examples

The application utilizes a custom `HttpClient` instance, likely for managing network requests. The repository classes demonstrate the pattern of using this client to perform operations like `delete` and fetching coin data.

The `main.dart` file shows the initialization process, including loading environment variables and setting up dependencies using a service locator (`setupDependencies()`).

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
  await dotenv.load();
  setupDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // ... UI setup
  }
}
```

## 8. Testing Instructions

Testing instructions are not provided within the scope of the given code snippets. For comprehensive testing strategies, refer to Flutter's official documentation on widget, unit, and integration testing.