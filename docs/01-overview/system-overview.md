# CryptoWave: System Overview

CryptoWave is a Flutter-based application designed for real-time cryptocurrency price tracking, market data analysis, and trend visualization. It leverages the CoinGecko API to provide users with up-to-date information on a wide range of cryptocurrencies.

## 1. System Purpose

### Primary Functions and Capabilities:
*   **Real-time Price Tracking:** Displays current prices for a vast array of cryptocurrencies.
*   **Market Data Analysis:** Provides access to market capitalization, trading volume, and 24-hour price ranges.
*   **Historical Data Visualization:** Presents interactive price charts for cryptocurrencies, allowing users to analyze trends over various timeframes.
*   **Detailed Coin Information:** Offers comprehensive details about individual cryptocurrencies, including images and names.

### Problem Domain and Solutions Provided:
The cryptocurrency market is volatile and information-rich, making it challenging for individuals to stay informed. CryptoWave addresses this by consolidating essential market data and presenting it in an accessible, user-friendly interface. It simplifies the process of tracking investments and identifying market trends.

### Core Value Proposition:
CryptoWave delivers real-time, comprehensive cryptocurrency market data and insightful visualizations, empowering users to make informed decisions in the dynamic world of digital assets.

### Key Differentiators:
*   **Interactive Charts:** Utilizes FL Chart for dynamic and engaging price charts.
*   **Clean UI:** Employs a modern and intuitive user interface for a seamless user experience.
*   **Bloc Pattern:** Leverages the Bloc pattern for robust state management, ensuring predictable and maintainable application state.
*   **Immutable Models:** Employs Freezed for code generation of immutable data models, enhancing data integrity and predictability.

## 2. System Architecture

### High-Level Component Overview:
The application follows a layered architecture, separating concerns into distinct layers:

*   **Presentation Layer (UI):** Responsible for rendering the user interface and handling user interactions. This includes screens for displaying coin lists, coin details, and charts.
*   **Business Logic Layer (Bloc):** Manages the application's state and business logic using the `flutter_bloc` package. It orchestrates data flow between the UI and the data layer.
*   **Data Layer (Repositories):** Handles data retrieval and manipulation. This layer includes repositories for fetching cryptocurrency data from external APIs and managing local data if applicable.
*   **Network Layer:** Manages all network requests, including API calls to CoinGecko and error handling.
*   **Models:** Defines the data structures used throughout the application, with `freezed` and `json_serializable` used for efficient and type-safe data representation.
*   **Utilities:** Contains helper functions, service locators (e.g., `get_it`), and logging mechanisms.

### Data Flow and Processing Patterns:
The application primarily uses the Bloc pattern for state management. User interactions in the UI trigger events that are processed by Blocs. Blocs then interact with repositories to fetch or manipulate data. Repositories communicate with network services to retrieve data from the CoinGecko API. The processed data is then returned to the Blocs, which update the application state, leading to UI re-renders.

### Integration Points and Dependencies:
*   **CoinGecko API:** The primary external data source for cryptocurrency market data.
*   **Flutter:** The UI framework for building the cross-platform application.
*   **`flutter_bloc`:** For state management.
*   **`freezed`:** For generating immutable data models.
*   **`json_serializable`:** For efficient JSON serialization and deserialization.
*   **`http`:** For making network requests.
*   **`get_it`:** For service location and dependency injection.
*   **`fl_chart`:** For rendering interactive charts.
*   **`intl`:** For date and number formatting.
*   **`flutter_dotenv`:** For managing environment variables.

### Technology Stack Summary:
*   **Language:** Dart
*   **Framework:** Flutter
*   **State Management:** Bloc Pattern (`flutter_bloc`)
*   **Data Modeling:** Freezed, Json Serializable
*   **Networking:** `http` package
*   **Dependency Injection:** `get_it`
*   **Charting:** `fl_chart`
*   **API:** CoinGecko API

## 3. Core Features

### Main Feature Categories:
*   **Cryptocurrency Listing:** Displays a scrollable list of cryptocurrencies with their current prices and market cap ranks.
*   **Coin Details:** Provides in-depth information for each cryptocurrency, including historical price data visualized through charts.
*   **Interactive Charts:** Allows users to view price, market cap, and volume charts with interactive elements.
*   **Search and Filtering:** (Implied, though not explicitly detailed in provided context) Functionality to search for specific cryptocurrencies.

### Feature Interactions and Workflows:
1.  **App Launch:** The application initializes, sets up dependencies (e.g., service locator), and navigates to the home page.
2.  **Home Page:** Displays a list of cryptocurrencies. Each list item shows key information like name, symbol, image, and current price.
3.  **Coin Detail Navigation:** Tapping on a cryptocurrency in the list navigates the user to the Coin Details screen.
4.  **Coin Details Screen:** Fetches and displays detailed information about the selected cryptocurrency, including historical chart data. Users can switch between viewing price, market cap, and volume charts.
5.  **Data Fetching:** Repositories and Blocs manage the fetching of data from the CoinGecko API, handling loading states and errors.

### User-Facing Capabilities:
*   View real-time cryptocurrency prices.
*   Access detailed market data for each cryptocurrency.
*   Visualize historical price, market cap, and volume trends through interactive charts.
*   Navigate seamlessly between cryptocurrency listings and individual coin details.

### Administrative Functions:
No specific administrative functions are detailed in the provided context. The application is primarily user-focused for information retrieval.

## 4. System Scope

### What the System Handles:
*   Retrieval and display of cryptocurrency market data from the CoinGecko API.
*   Visualization of historical price, market cap, and volume data through charts.
*   User interface for browsing and selecting cryptocurrencies.

### Current Limitations and Boundaries:
*   **No User Accounts or Personalization:** The application does not support user accounts, watchlists, or personalized settings.
*   **Limited API Functionality:** While it uses the CoinGecko API, the specific endpoints and data points utilized are not fully detailed but are implied to cover market data and historical charts.
*   **No Trading or Transaction Capabilities:** The application is purely for informational purposes and does not facilitate any cryptocurrency trading or transactions.

### Future Expansion Plans:
While not explicitly stated, potential future expansions could include:
*   User accounts and personalized watchlists.
*   Alerts for price changes or significant market movements.
*   Integration with additional data sources or APIs.
*   More advanced charting tools and technical analysis indicators.
*   News feeds and sentiment analysis related to cryptocurrencies.

### Related Systems and Integrations:
*   **CoinGecko API:** The sole external integration identified for fetching cryptocurrency data.