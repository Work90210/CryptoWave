# CryptoWave: System Architecture Documentation

## 1. System Overview

CryptoWave is a Flutter application designed for real-time cryptocurrency price tracking and market data analysis. It leverages the CoinGecko API to provide users with up-to-date information on various cryptocurrencies, including price charts, historical data, and detailed coin metrics. The application employs the Bloc pattern for state management, ensuring a predictable and maintainable UI.

## 2. Architecture Patterns Used

The CryptoWave application adheres to a **Component-Based Architecture**. This pattern is evident in the modular structure of the UI, where distinct features and functionalities are encapsulated within reusable components. This approach promotes code reusability, maintainability, and testability.

## 3. Component Breakdown

The project is organized into the following key directories and files:

*   **`README.md`**: Provides a high-level overview of the project, its features, and the technology stack.
*   **`analysis_options.yaml`**: Configures the Dart analyzer for static code analysis, enforcing coding standards and identifying potential issues.
*   **`android/`**: Contains platform-specific configurations and code for Android.
    *   `app/src/debug/AndroidManifest.xml`: Android manifest for debug builds, including internet permissions.
    *   `app/src/main/AndroidManifest.xml`: Main Android manifest file, defining application attributes and activities.
    *   `app/src/main/kotlin/com/example/cryptowave/MainActivity.kt`: The primary activity for the Android application, extending FlutterActivity.
    *   `app/src/main/res/drawable-v21/launch_background.xml` and `launch_background.xml`: Defines the splash screen background for different API levels.
    *   `app/src/main/res/values-night/styles.xml` and `styles.xml`: Contains Android styling resources for light and dark modes.
    *   `gradle.properties`: Gradle properties for build configuration.
    *   `gradle/wrapper/gradle-wrapper.properties`: Specifies the Gradle distribution URL.
    *   `settings.gradle.kts`: Gradle settings file for project configuration.
*   **`assets/`**: Stores static assets for the application.
    *   `lottie/error.json`: Contains Lottie animation data for error states.
*   **`devtools_options.yaml`**: Configuration file for Dart and Flutter DevTools extensions.
*   **`ios/`**: Contains platform-specific configurations and code for iOS.
    *   `Runner/AppDelegate.swift`: The main AppDelegate for the iOS application.
    *   `Runner/Assets.xcassets/AppIcon.appiconset/Contents.json`: Defines app icon assets for various device resolutions.
    *   `Runner/Assets.xcassets/LaunchImage.imageset/Contents.json` and `README.md`: Defines launch screen assets and provides instructions for customization.
    *   `RunnerTests/RunnerTests.swift`: Contains unit tests for the iOS application.
*   **`lib/`**: Contains the core Dart code for the Flutter application.
    *   `constants.dart`: Defines application-wide constant values, including API URLs.
    *   `main.dart`: The entry point of the Flutter application, initializing services and running the MyApp widget.
    *   `models/coin/coin_model.dart`, `coin_model.freezed.dart`, `coin_model.g.dart`: Defines the data model for cryptocurrency information, utilizing Freezed and JsonSerializable for immutable data classes and JSON serialization.
    *   `models/coin_details/crypto_chart_data_model/`: Contains data models for cryptocurrency chart data, also using Freezed and Json Serializable.
    *   `network/exception_handler.dart`: Handles API exceptions and provides enhanced error messages.
    *   `network/http_client.dart`: Implements a custom HTTP client for making network requests, including timeout configurations.
    *   `network/network_response.dart` and `network_response.freezed.dart`: Defines network response models and error types using Freezed for robust error handling.
    *   `repositories/base_repository.dart`: An abstract base class for repositories, providing common HTTP client and logger instances.
    *   `repositories/coin_details_repository.dart`: Handles API calls related to coin details.
    *   `repositories/coin_repository.dart`: Manages API interactions for general coin data.
    *   `ui/coin_details/coin_details.dart`: Implements the UI for displaying detailed coin information, including charts.

## 4. Data Flow and Dependencies

The application follows a layered architecture:

*   **UI Layer**: Components like `CoinDetailsPage` and `HomePage` are responsible for rendering the user interface. They interact with the state management layer (Bloc).
*   **Bloc/State Management Layer**: Cubits (e.g., `CoinDetailsCubit`) manage the application's state and business logic, fetching data from repositories.
*   **Repository Layer**: Classes like `CoinRepository` and `CoinDetailsRepository` abstract data sources, interacting with the `HttpClient` to fetch data from the CoinGecko API. They also handle data transformation and error management.
*   **Network Layer**: `HttpClient` is responsible for making HTTP requests, and `ExceptionHandler` processes API errors.
*   **Data Models**: `CoinModel` and `CryptoChartDataModel` (and their associated `.freezed.dart` and `.g.dart` files) define the structure of data fetched from the API, leveraging Freezed for immutability and `json_serializable` for efficient JSON parsing.

**Key Relationships:**

*   `lib/main.dart` imports and uses `home.dart` and `service_locator.dart`.
*   `lib/models/coin/coin_model.dart` is used by `lib/repositories/coin_repository.dart`.
*   `lib/repositories/coin_repository.dart` imports and uses `lib/network/http_client.dart` and `lib/network/exception_handler.dart`.
*   `lib/ui/coin_details/coin_details.dart` imports and uses `lib/models/coin/coin_model.dart`, `lib/models/coin_details/crypto_chart_data_model/crypto_chart_data_model.dart`, and `lib/ui/coin_details/cubit/coin_details_cubit.dart`.

## 5. Design Decisions and Rationale

*   **Bloc Pattern for State Management**: The Bloc pattern is employed for state management, providing a clear separation of concerns between UI and business logic. This enhances predictability and testability.
*   **Freezed for Data Models**: Freezed is used for generating immutable data classes, ensuring data integrity and simplifying state management.
*   **JsonSerializable for API Data**: `json_serializable` is utilized for efficient and type-safe parsing of JSON responses from the CoinGecko API.
*   **Dependency Injection with GetIt**: `GetIt` is used for service location and dependency injection, facilitating the management of dependencies across the application.
*   **HTTP Client Abstraction**: A custom `HttpClient` abstracts network requests, allowing for centralized error handling and configuration.
*   **Exception Handling**: A dedicated `ExceptionHandler` class centralizes the management of API-related exceptions, providing consistent error reporting.

## 6. Scalability Considerations

The component-based architecture and clear separation of concerns facilitate scalability. New features or cryptocurrency data can be integrated by adding new models, repositories, and UI components that adhere to the established patterns. The use of Bloc ensures that state management remains manageable as the application grows.

## 7. Security Architecture

*   **API Key Management**: API keys, if required for CoinGecko, are managed via environment variables loaded by `flutter_dotenv`, preventing hardcoding sensitive information directly in the codebase.
*   **Data Protection**: While not explicitly detailed in the provided code, standard Flutter security practices should be followed for any sensitive user data. Network requests are made over HTTPS to ensure data in transit is encrypted.

## 8. Performance Considerations

*   **Efficient Data Handling**: The use of Freezed and `json_serializable` ensures efficient data modeling and parsing, minimizing overhead.
*   **State Management**: The Bloc pattern helps in managing UI state efficiently, preventing unnecessary widget rebuilds.
*   **Network Caching**: While not explicitly shown, implementing caching strategies for API responses (e.g., using `http_cache` or similar packages) would further enhance performance by reducing redundant network requests.
*   **Image Optimization**: For any image assets, using optimized image loading and caching mechanisms would be beneficial.

## 9. Deployment Architecture

The application is built using Flutter, allowing for cross-platform deployment to iOS and Android.

*   **Android**: The `android/` directory contains all necessary configurations for building an Android application, including `AndroidManifest.xml` and Gradle build scripts.
*   **iOS**: The `ios/` directory contains configurations for building an iOS application, including `AppDelegate.swift` and Xcode project settings.

## 10. Future Architecture Improvements

*   **Advanced Caching**: Implement a more sophisticated caching strategy for API data to improve performance and reduce reliance on constant network calls.
*   **Error Handling Granularity**: Further refine error handling to provide more specific user feedback for different API error scenarios.
*   **Testing Strategy**: Expand unit and widget testing coverage to ensure the robustness and reliability of the application.
*   **Theming and Styling**: Centralize theme and style definitions for a more consistent and maintainable UI.

## 11. Technology Stack Rationale

*   **Flutter**: Chosen for its cross-platform capabilities, enabling a single codebase for both iOS and Android, and its rich UI toolkit for creating beautiful and performant applications.
*   **Bloc Pattern (`flutter_bloc`)**: Selected for robust state management, promoting a clean separation of concerns, testability, and predictable state changes.
*   **CoinGecko API**: The primary data source for cryptocurrency market data, chosen for its comprehensive and reliable API.
*   **Freezed**: Used for generating immutable data classes, which are essential for predictable state management in Flutter applications and reduce boilerplate code.
*   **JsonSerializable**: Leveraged for efficient and type-safe JSON serialization and deserialization, crucial for handling API responses.
*   **GetIt**: Employed for dependency injection, simplifying the management of service and repository instances throughout the application.
*   **HTTP Package**: Used for making network requests to the CoinGecko API.
*   **Flutter Dotenv**: For managing environment variables, particularly API keys, securely.

## 12. Integration Points

*   **CoinGecko API**: The application integrates with the CoinGecko API (`https://api.coingecko.com/api/v3/`) to fetch cryptocurrency data, including prices, market capitalization, historical data, and charts. The `lib/constants.dart` file defines the base URL for these API interactions.
*   **External Libraries**: The project utilizes various Flutter packages for UI, state management, networking, and code generation, as indicated by the import statements and `pubspec.yaml` (though not provided in the context).