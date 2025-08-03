# CryptoWave

A Flutter application for tracking cryptocurrency prices, trends, and market data using the CoinGecko API.

## Project Overview

CryptoWave is a Flutter-based mobile application designed to provide users with real-time cryptocurrency market data. It offers comprehensive insights into cryptocurrency prices, market trends, and detailed coin information, all powered by the robust CoinGecko API. The application aims to be a user-friendly and informative tool for both novice and experienced cryptocurrency enthusiasts.

## Features

*   **Real-time Price Tracking:** Access up-to-the-minute prices for a wide range of cryptocurrencies.
*   **Market Trends:** Monitor market capitalization, trading volume, and price changes over various timeframes.
*   **Detailed Coin Information:** Explore in-depth data for each cryptocurrency, including historical performance and key metrics.
*   **Interactive Price Charts:** Visualize price movements and trends with interactive charts powered by FL Chart.
*   **Clean and Modern UI:** Experience a user-friendly interface designed for clarity and ease of navigation.

## Tech Stack

*   **Flutter:** The UI framework for building cross-platform applications.
*   **Bloc Pattern:** State management architecture for predictable and maintainable application state.
*   **CoinGecko API:** The primary data source for all cryptocurrency market information.
*   **Freezed:** Code generation for immutable data models, ensuring data integrity.
*   **GetIt:** A service locator for dependency injection.

## Quick Start

### Prerequisites

*   **Flutter SDK:** Ensure you have Flutter installed and configured. Refer to the [official Flutter installation guide](https://docs.flutter.dev/get-started/install).
*   **Dart SDK:** Included with the Flutter SDK.
*   **IDE:** A code editor with Flutter and Dart support (e.g., VS Code, Android Studio).

### Installation

1.  **Clone the repository:**
    ```bash
    git clone <repository_url>
    cd cryptowave
    ```

2.  **Install dependencies:**
    ```bash
    flutter pub get
    ```

3.  **Obtain API Key (if required by CoinGecko):**
    While the CoinGecko API used in this project is generally accessible without an API key for basic usage, it's recommended to check their [API documentation](https://www.coingecko.com/en/api/documentation) for any rate limits or specific requirements.

4.  **Run the application:**
    ```bash
    flutter run
    ```

### Basic Usage

Upon launching the application, you will be presented with a list of cryptocurrencies. You can:

*   **View Prices:** Scroll through the list to see real-time prices and market data.
*   **Search for Coins:** Utilize the search bar to find specific cryptocurrencies.
*   **View Coin Details:** Tap on a cryptocurrency to navigate to its detailed view, which includes historical charts and more information.

### First-Time Setup

1.  **Environment Variables (Optional):** If the application utilizes environment variables (e.g., for API keys), ensure you have a `.env` file in the project root with the necessary configurations. For example:
    ```dotenv
    # .env
    COINGECKO_API_KEY=YOUR_API_KEY
    ```
    Then, ensure `flutter_dotenv` is correctly configured in `lib/main.dart` to load these variables.

## Navigation Guide

This project is structured to provide a clear and organized codebase.

*   **`lib/`:** Contains the core application logic and UI components.
    *   **`constants.dart`:** Application-wide constants, including API endpoints.
    *   **`main.dart`:** The entry point of the application.
    *   **`models/`:** Data models for API responses and application state.
        *   **`coin/`:** Models related to cryptocurrency data.
        *   **`coin_details/`:** Models for detailed coin information, including chart data.
    *   **`network/`:** Handles network requests and response management.
        *   **`exception_handler.dart`:** Manages API exceptions.
        *   **`http_client.dart`:** Provides an HTTP client for API interactions.
        *   **`network_response.dart`:** Defines network response structures and error types.
    *   **`repositories/`:** Data layer responsible for fetching and managing data.
        *   **`base_repository.dart`:** Abstract base class for repositories.
        *   **`coin_details_repository.dart`:** Handles fetching coin-specific data.
        *   **`coin_repository.dart`:** Manages general cryptocurrency data.
    *   **`ui/`:** Contains all user interface components.
        *   **`home_page/`:** The main screen displaying a list of cryptocurrencies.
        *   **`coin_details/`:** The screen displaying detailed information for a selected cryptocurrency.
        *   **`common/`:** Reusable UI widgets and components.

## Project Status

*   **Version:** 1.0.0
*   **Release Status:** Stable
*   **Development Roadmap:**
    *   Enhanced charting capabilities with more timeframes.
    *   User authentication and portfolio tracking.
    *   Push notifications for price alerts.
    *   Integration with additional data sources.
*   **Contribution Guidelines:** Contributions are welcome! Please refer to the `CONTRIBUTING.md` file for guidelines on how to contribute.
*   **License:** This project is licensed under the MIT License - see the `LICENSE` file for details.

---

This README provides a foundational understanding of the CryptoWave project. For more detailed information, please explore the project's directory structure and source code.