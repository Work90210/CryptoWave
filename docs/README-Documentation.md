# CryptoWave

A Flutter application for tracking cryptocurrency prices, trends, and market data using the CoinGecko API.

## Project Overview

CryptoWave provides real-time cryptocurrency market data, price charts, and detailed information about various cryptocurrencies. The application leverages the CoinGecko API to deliver up-to-date financial information directly to users.

## Features

*   **Real-time Cryptocurrency Price Tracking**: Monitor the current prices of a wide range of cryptocurrencies.
*   **Detailed Coin Information**: Access comprehensive data for each cryptocurrency, including historical performance and market metrics.
*   **Interactive Price Charts**: Visualize price trends and historical data with interactive charts powered by FL Chart.
*   **Clean and Modern UI**: Experience a user-friendly interface designed for clarity and ease of use.

## Tech Stack

*   **Flutter**: The UI framework used for cross-platform application development.
*   **Bloc Pattern**: State management is handled using the `flutter_bloc` library for predictable state changes.
*   **CoinGecko API**: The primary data source for all cryptocurrency market information.
*   **Freezed**: Used for generating immutable data models, ensuring data integrity.
*   **GetIt**: A service locator for dependency injection.

## Quick Start

### Prerequisites

*   **Flutter SDK**: Ensure you have Flutter installed and configured. You can find installation instructions [here](https://docs.flutter.dev/get-started/install).
*   **Dart SDK**: Included with the Flutter SDK.
*   **IDE**: A code editor such as VS Code, Android Studio, or IntelliJ IDEA with Flutter and Dart plugins.

### Installation

1.  **Clone the repository**:
    ```bash
    git clone https://github.com/your-username/cryptowave.git
    cd cryptowave
    ```

2.  **Install dependencies**:
    ```bash
    flutter pub get
    ```

3.  **Obtain API Key (if applicable)**:
    *   While CryptoWave uses the CoinGecko API, which generally does not require an API key for basic usage, it's good practice to check the CoinGecko API documentation for any rate limits or specific usage policies.

4.  **Run the application**:
    ```bash
    flutter run
    ```

### Basic Usage

Upon launching the application, you will be presented with a list of cryptocurrencies. You can:

*   **View Prices**: Scroll through the list to see real-time prices and market data.
*   **Explore Details**: Tap on any cryptocurrency to view its detailed information, including historical price charts and market cap data.
*   **Search**: Utilize the search functionality to find specific cryptocurrencies.

## Navigation Guide

This project is structured to provide a clear and maintainable codebase. The primary navigation and structure are as follows:

*   **`lib/`**: Contains the core application logic and UI components.
    *   **`constants/`**: Stores application-wide constants.
    *   **`models/`**: Defines data structures for API responses and application state.
    *   **`network/`**: Handles all network requests and API interactions.
    *   **`repositories/`**: Implements data fetching logic, abstracting data sources.
    *   **`ui/`**: Contains all user interface components, organized by feature.
        *   **`home_page/`**: The main screen displaying a list of cryptocurrencies.
        *   **`coin_details/`**: The screen for displaying detailed information about a specific cryptocurrency.
    *   **`utils/`**: Houses utility functions and services, such as dependency injection.
*   **`android/`**: Contains Android-specific project files.
*   **`ios/`**: Contains iOS-specific project files.
*   **`assets/`**: Includes static assets like images and Lottie animations.

## Project Status

*   **Version**: 1.0.0
*   **Release Status**: Stable
*   **Development Roadmap**:
    *   Enhanced charting capabilities with more timeframes and indicators.
    *   User authentication for personalized watchlists.
    *   Integration with additional data sources for broader market coverage.
    *   Improved error handling and user feedback mechanisms.
*   **Contribution Guidelines**: Contributions are welcome! Please refer to the `CONTRIBUTING.md` file for guidelines on how to contribute.
*   **License**: This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.