# CryptoWave Quick Start Guide

This guide will help you get CryptoWave up and running in approximately 5 minutes.

## 1. Prerequisites Check

Before you begin, ensure you have the following:

*   **Flutter SDK:** The Flutter framework is required for building the application.
*   **Dart:** Included with the Flutter SDK.
*   **IDE:** An Integrated Development Environment such as Android Studio or VS Code with Flutter and Dart plugins.
*   **Internet Connection:** Required for fetching cryptocurrency data from the CoinGecko API and for dependency management.

**Dependency Verification:**

The project utilizes `package:very_good_analysis` for linting, as indicated in `analysis_options.yaml` [S2].

## 2. Fast Installation

1.  **Clone the Repository:**
    ```bash
    git clone <repository_url>
    cd cryptowave
    ```
2.  **Install Dependencies:**
    ```bash
    flutter pub get
    ```
3.  **Run the Application:**
    ```bash
    flutter run
    ```

**Default Settings:**

The application is configured to use the CoinGecko API for data retrieval. No additional configuration is required for initial setup.

**Verification:**

Upon successful execution, the application will launch on your connected device or emulator.

## 3. First Success

Once the application is running, you should see the main dashboard displaying cryptocurrency prices and trends.

**Expected Output:**

*   A list of cryptocurrencies with their current prices.
*   Interactive charts displaying price history.

**Common Success Indicators:**

*   The application launches without errors.
*   Real-time price data is displayed.

**Basic Functionality Demonstration:**

Navigate through the application to view different cryptocurrency details and price charts.

## 4. Immediate Next Steps

*   **Detailed Setup:** For more in-depth setup instructions, refer to the main `README.md` file [S1].
*   **Customization:** Explore customization options for the UI and data fetching.
*   **Troubleshooting:** If you encounter issues, consult the "Common Issues" section below or the project's documentation.
*   **Full Documentation:** Access comprehensive documentation at `docs/` [S16, S17, S18, S19, S20, S21, S22, S23].

## 5. Common Issues

*   **Dependency Errors:** Ensure you have run `flutter pub get` after cloning the repository.
*   **Flutter SDK Path:** Verify that your Flutter SDK path is correctly configured in your environment variables.

**Quick Resolution:**

*   Clean the Flutter build: `flutter clean` followed by `flutter pub get`.
*   Ensure your Flutter SDK is up to date: `flutter upgrade`.

**When to Seek Help:**

If persistent issues arise, refer to the project's issue tracker or community forums.

---

## SOURCES

- [S1] README.md
- [S2] analysis_options.yaml
- [S16] docs/00-meta/doc-accessibility.md
- [S17] docs/00-meta/doc-maintenance.md
- [S18] docs/00-meta/doc-metrics.md
- [S19] docs/00-meta/doc-review-process.md
- [S20] docs/00-meta/doc-standards.md
- [S21] docs/00-meta/doc-templates.md
- [S22] docs/00-meta/doc-tools.md
- [S23] docs/00-meta/doc-versioning.md