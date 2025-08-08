# CryptoWave

A Flutter application for tracking cryptocurrency prices, trends, and market data using the CoinGecko API.

## Project Overview

CryptoWave is a Flutter-based mobile application designed to provide users with real-time cryptocurrency market data. It offers comprehensive insights into cryptocurrency prices, market trends, and detailed coin information, all powered by the robust CoinGecko API. The application aims to be a user-friendly and informative tool for both novice and experienced cryptocurrency enthusiasts.

## Features

*   **Real-time Cryptocurrency Price Tracking**: Access up-to-the-minute prices for a wide range of cryptocurrencies.
*   **Detailed Coin Information**: View comprehensive data for each cryptocurrency, including historical performance and key metrics.
*   **Interactive Price Charts**: Visualize price trends and market data through engaging and interactive charts powered by FL Chart.
*   **Clean and Modern UI**: Experience a user-friendly interface designed for clarity and ease of navigation.

## Tech Stack

*   **Flutter**: The UI framework used for cross-platform application development.
*   **Bloc Pattern**: Implements the Bloc (Business Logic Component) pattern for state management, ensuring predictable state changes and maintainable code.
*   **CoinGecko API**: The primary data source for all cryptocurrency market data.
*   **Freezed**: Utilized for generating immutable data models, enhancing code safety and predictability.
*   **GetIt**: A service locator for dependency injection, facilitating easy access to services and repositories.

## Quick Start

### Prerequisites

*   **Flutter SDK**: Ensure you have the Flutter SDK installed. You can download it from [flutter.dev](https://flutter.dev/docs/get-started/install).
*   **Dart SDK**: Included with the Flutter SDK.
*   **IDE**: An IDE with Flutter and Dart support (e.g., Android Studio, VS Code).

### Installation

1.  **Clone the repository**:
    ```bash
    git clone <repository_url>
    cd CryptoWave
    ```

2.  **Install dependencies**:
    ```bash
    flutter pub get
    ```

3.  **Run the application**:
    ```bash
    flutter run
    ```

### Basic Usage

Upon launching the application, you will be presented with a list of cryptocurrencies. You can tap on any cryptocurrency to view its detailed information, including price charts and historical data.

### First-Time Setup

No specific first-time setup is required beyond installing the dependencies and running the application. The application fetches data directly from the CoinGecko API.

## Navigation Guide

This project is structured to be intuitive and easy to navigate.

*   **`lib/`**: Contains the core application code.
    *   **`constants.dart`**: Application-wide constant values, including API endpoints.
    *   **`main.dart`**: The entry point of the application, setting up the Flutter widget tree and routing.
    *   **`models/`**: Contains data models for cryptocurrencies and chart data, generated using `freezed` and `json_serializable`.
    *   **`network/`**: Handles network requests and responses, including exception management.
    *   **`repositories/`**: Implements data fetching logic from the CoinGecko API.
    *   **`ui/`**: Houses all the user interface components, organized by feature.
        *   **`home_page/`**: Displays the main list of cryptocurrencies.
        *   **`coin_details/`**: Contains the UI and logic for displaying detailed cryptocurrency information and charts.
        *   **`common/`**: Reusable UI components like loading indicators and error messages.
*   **`android/`**: Contains Android-specific project files.
*   **`ios/`**: Contains iOS-specific project files.

## Project Status

*   **Version**: 1.0.0
*   **Release Status**: Stable

### Development Roadmap

*   **Enhanced Charting**: Further customization and interactivity for price charts.
*   **Watchlist Feature**: Allow users to create and manage a personalized list of cryptocurrencies.
*   **News Integration**: Incorporate relevant cryptocurrency news from reliable sources.
*   **User Accounts**: Implement user authentication for personalized features.

### Contribution Guidelines

Contributions are welcome! Please refer to the `CONTRIBUTING.md` file for detailed guidelines on how to contribute to this project.

### License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.