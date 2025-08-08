# CryptoWave

A Flutter application for tracking cryptocurrency prices, trends, and market data using the CoinGecko API.

## Project Overview

CryptoWave provides real-time cryptocurrency market data, price charts, and detailed information about various cryptocurrencies. The application leverages the CoinGecko API to deliver up-to-date financial information directly to users.

## Features

*   **Real-time Cryptocurrency Price Tracking**: Monitor the current prices of a wide range of cryptocurrencies.
*   **Detailed Coin Information**: Access comprehensive data for each cryptocurrency, including historical performance and market metrics.
*   **Interactive Price Charts**: Visualize price trends and market data through intuitive and interactive charts powered by FL Chart.
*   **Clean and Modern UI**: Experience a user-friendly interface designed for clarity and ease of navigation.

## Tech Stack

*   **Flutter**: The UI framework used for cross-platform application development.
*   **Bloc Pattern**: State management is handled using the `flutter_bloc` library for predictable state changes.
*   **CoinGecko API**: The primary data source for all cryptocurrency market information.
*   **Freezed**: Used for generating immutable data models, ensuring data integrity.
*   **GetIt**: A service locator for dependency injection.

## Quick Start

### Prerequisites

*   **Flutter SDK**: Ensure you have Flutter installed and configured. You can find installation instructions on the [official Flutter website](https://flutter.dev/docs/get-started/install).
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

3.  **Obtain API Key (Optional but Recommended)**:
    While the application functions without an API key for basic usage, obtaining a CoinGecko API key can provide access to higher rate limits and additional features. Sign up on the [CoinGecko API website](https://www.coingecko.com/en/api/documentation) to get your key.
    *   Create a `.env` file in the root of the project.
    *   Add your API key to the `.env` file:
        ```
        COINGECKO_API_KEY=YOUR_API_KEY_HERE
        ```

### Basic Usage

1.  **Run the application**:
    ```bash
    flutter run
    ```

    This command will build and launch the application on your connected device or emulator.

### First-Time Setup

Upon first launch, the application will fetch cryptocurrency data from the CoinGecko API. Ensure you have an active internet connection. The application will display a list of cryptocurrencies with their current prices and market data.

## Navigation Guide

### Documentation Structure

This README serves as the primary entry point for understanding the CryptoWave project. For more detailed information on specific components or functionalities, please refer to the following:

*   **`lib/constants.dart`**: Contains application-wide constant values, including API endpoints.
*   **`lib/models/`**: Houses the data models used for parsing API responses, generated with `freezed` and `json_serializable`.
*   **`lib/network/`**: Contains classes responsible for network requests and error handling.
*   **`lib/repositories/`**: Implements data fetching logic, abstracting API interactions.
*   **`lib/ui/`**: Contains all the UI components and screens of the application.

### Getting Help and Support

For any issues or questions, please refer to the project's GitHub repository. You can also find support through community forums and developer channels related to Flutter and cryptocurrency data APIs.

## Project Status

*   **Version**: 1.0.0
*   **Release Status**: Stable
*   **Development Roadmap**: Future updates may include enhanced charting capabilities, portfolio tracking features, and real-time price alerts.
*   **Contribution Guidelines**: Contributions are welcome. Please refer to the `CONTRIBUTING.md` file in the repository for guidelines on how to contribute.
*   **License**: This project is licensed under the MIT License - see the `LICENSE` file for details.