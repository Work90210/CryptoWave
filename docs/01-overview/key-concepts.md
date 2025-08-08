# Glossary of Terms and Concepts

This glossary defines the key terminology, concepts, and technical aspects relevant to the CryptoWave application. It serves as a foundational reference for understanding the project's domain and architecture.

## Table of Contents

1.  [Domain Terminology](#domain-terminology)
2.  [System Concepts](#system-concepts)
3.  [Technical Concepts](#technical-concepts)
4.  [Acronyms & Abbreviations](#acronyms--abbreviations)
5.  [Concept Relationships](#concept-relationships)

---

## 1. Domain Terminology

### Cryptocurrency

*   **Definition:** A digital or virtual currency that is secured by cryptography, which makes it nearly impossible to counterfeit or double-spend. Many cryptocurrencies are decentralized networks based on blockchain technology—a distributed ledger enforced by a disparate network of computers.
*   **Relevance:** The core subject matter of the CryptoWave application. The application tracks prices, market data, and trends for various cryptocurrencies.

### CoinGecko API

*   **Definition:** A widely used API that provides access to a vast amount of cryptocurrency market data, including prices, historical data, market capitalization, trading volumes, and more.
*   **Relevance:** The primary data source for the CryptoWave application. All cryptocurrency data displayed within the app is fetched from the CoinGecko API.

### Market Cap (Market Capitalization)

*   **Definition:** The total market value of a cryptocurrency's circulating supply. It is calculated by multiplying the current price of a cryptocurrency by its total circulating supply.
*   **Relevance:** A key metric used to rank cryptocurrencies by size and influence in the market. CryptoWave displays market cap for each listed cryptocurrency.

### Circulating Supply

*   **Definition:** The number of coins or tokens that are publicly available and circulating in the market and are in general circulation.
*   **Relevance:** Used in conjunction with the current price to calculate market capitalization.

### Trading Volume

*   **Definition:** The total amount of a specific cryptocurrency that has been traded during a given period, typically 24 hours.
*   **Relevance:** Indicates the liquidity and trading activity of a cryptocurrency. CryptoWave displays 24-hour trading volume.

### Price Chart

*   **Definition:** A graphical representation of the price of a cryptocurrency over a specific period. These charts typically show price movements, trends, and historical data.
*   **Relevance:** CryptoWave utilizes interactive price charts to visualize cryptocurrency performance.

### FL Chart

*   **Definition:** A powerful charting library for Flutter that enables the creation of highly customizable and interactive charts.
*   **Relevance:** The library used within CryptoWave to render cryptocurrency price charts.

---

## 2. System Concepts

### Coin Data Entity

*   **Description:** Represents a single cryptocurrency with its essential market data. This includes identifiers, names, logos, current prices, market capitalization, and trading volumes.
*   **Attributes:** `id`, `symbol`, `name`, `image`, `currentPrice`, `marketCap`, `marketCapRank`, `fullyDilutedValuation`, `totalVolume`, `high24h`, `low24h`.
*   **Relationships:** A `CoinModel` can be associated with `CryptoChartDataModel` for historical data.

### CryptoChartDataModel Entity

*   **Description:** Represents historical market data for a cryptocurrency, specifically focusing on price, market cap, and trading volume over time.
*   **Attributes:** `prices`, `marketCaps`, `totalVolumes`. Each of these is a list of `DataPointModel` objects.
*   **Relationships:** Associated with a specific `CoinModel` to provide its historical performance data.

### DataPointModel Entity

*   **Description:** Represents a single data point in a time series, typically containing a timestamp and a corresponding value.
*   **Attributes:** `timestamp` (represented as an integer, likely a Unix timestamp), `value` (a double representing the price, market cap, or volume).
*   **Relevance:** Used within `CryptoChartDataModel` to structure historical data for charting.

### API Integration Workflow

1.  **Data Fetching:** The application fetches cryptocurrency data from the CoinGecko API.
2.  **Data Parsing:** The raw API responses are parsed into structured Dart objects using models like `CoinModel` and `CryptoChartDataModel`.
3.  **State Management:** The fetched and parsed data is managed using the Bloc pattern for efficient UI updates and state handling.
4.  **UI Rendering:** The data is presented to the user through various UI components, including lists, detail screens, and charts.

### State Management (Bloc Pattern)

*   **Description:** The application employs the Bloc (Business Logic Component) pattern for state management. This pattern separates business logic from the UI, enabling predictable state changes and easier testing.
*   **Components:** Cubits and Blocs are used to manage the state of different parts of the application, such as the list of coins or the details of a specific coin.

---

## 3. Technical Concepts

### Flutter

*   **Description:** An open-source UI software development kit created by Google for building natively compiled applications for mobile, web, and desktop from a single codebase.
*   **Relevance:** The primary framework used for developing the CryptoWave application.

### Bloc Pattern (flutter\_bloc)

*   **Description:** A predictable state management library for Dart and Flutter, inspired by The Clean Architecture and the BLoC pattern. It promotes separation of concerns between UI and business logic.
*   **Relevance:** Used for managing the application's state, handling events, and emitting states that update the UI.

### Freezed

*   **Description:** A code generation library for Dart that helps create immutable classes, unions, and sealed classes. It simplifies the creation of data models and reduces boilerplate code.
*   **Relevance:** Used for defining data models like `CoinModel` and `CryptoChartDataModel` in an immutable and type-safe manner.

### JsonSerializable

*   **Description:** A Dart code generation library that automatically generates code for converting Dart objects to and from JSON.
*   **Relevance:** Used in conjunction with Freezed to enable easy serialization and deserialization of API responses into Dart objects.

### GetIt

*   **Description:** A simple service locator for Dart and Flutter. It allows for easy registration and retrieval of services and dependencies.
*   **Relevance:** Used for dependency injection, managing instances of services like `HttpClient` and `LoggerService`.

### HTTP Client (http package)

*   **Description:** A Dart package that provides a client for making HTTP requests. It is used for interacting with web services and APIs.
*   **Relevance:** The `HttpClient` class in the application utilizes this package to make requests to the CoinGecko API.

### Exception Handling

*   **Description:** A mechanism for identifying, responding to, and recovering from disruptive events in a system. In this context, it refers to handling errors that occur during network requests or API interactions.
*   **Relevance:** The `ExceptionHandler` class provides a structured way to manage and report API-related errors, such as network connectivity issues or timeouts.

### Network Response Model

*   **Description:** A standardized structure for representing the outcome of a network request, including success data, error types, and associated messages.
*   **Relevance:** The `NetworkResponseModel` class encapsulates the results of API calls, providing a consistent interface for handling responses across the application.

### Architecture Pattern (Clean Architecture principles)

*   **Description:** A software design philosophy that emphasizes separation of concerns, testability, and maintainability. It typically involves layers such as Presentation, Domain, and Data.
*   **Relevance:** The project structure and the use of repositories and Blocs suggest an adherence to Clean Architecture principles, promoting a well-organized and scalable codebase.

---

## 4. Acronyms & Abbreviations

*   **API:** Application Programming Interface
    *   **Definition:** A set of rules and protocols that allows different software applications to communicate with each other.
*   **UI:** User Interface
    *   **Definition:** The visual elements and interactive components through which a user interacts with a software application.
*   **JSON:** JavaScript Object Notation
    *   **Definition:** A lightweight data-interchange format that is easy for humans to read and write and easy for machines to parse and generate.
*   **HTTP:** Hypertext Transfer Protocol
    *   **Definition:** The foundation of data communication for the World Wide Web, defining how messages are formatted and transmitted.
*   **SSL:** Secure Sockets Layer (often used interchangeably with TLS - Transport Layer Security)
    *   **Definition:** Cryptographic protocols designed to provide communications security over a computer network.
*   **TLS:** Transport Layer Security
    *   **Definition:** A cryptographic protocol that provides communication security over a computer network. It is the successor to SSL.
*   **USD:** United States Dollar
    *   **Definition:** The official currency of the United States.
*   **AE:** Adobe After Effects
    *   **Definition:** A digital visual effects, motion graphics, and compositing application developed by Adobe Systems.
*   **ID:** Identifier
    *   **Definition:** A unique name or number assigned to a specific entity.
*   **URL:** Uniform Resource Locator
    *   **Definition:** A reference to a web resource that specifies its location on a computer network and a mechanism for retrieving it.

---

## 5. Concept Relationships

*   **CoinModel** and **CryptoChartDataModel:** A `CoinModel` represents the current state of a cryptocurrency, while `CryptoChartDataModel` provides its historical performance data. A `CoinModel` can be associated with a `CryptoChartDataModel` to display detailed historical trends.
*   **HttpClient** and **API\_URL:** The `HttpClient` class uses the `API_URL` constant from `AppConstants` to construct requests to the CoinGecko API.
*   **Bloc Pattern** and **UI Components:** Blocs manage the application's state, and UI widgets (like `HomePage` or `CoinDetailsPage`) subscribe to these states to update themselves accordingly.
*   **Freezed** and **JsonSerializable:** These libraries work together to generate immutable data models with JSON serialization capabilities, crucial for handling API responses.
*   **Repository Pattern:** Repositories (e.g., `CoinRepository`, `CoinDetailsRepository`) abstract data access logic, interacting with the `HttpClient` and providing data to the Blocs. This decouples the business logic from the data source.
*   **Dependency Injection (GetIt):** `GetIt` is used to manage instances of services like `HttpClient` and `LoggerService`, making them available throughout the application without tight coupling.