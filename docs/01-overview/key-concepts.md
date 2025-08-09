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

*   **Definition:** A digital or virtual currency that is secured by cryptography, which makes it nearly impossible to counterfeit or double-spend. Many cryptocurrencies are decentralized networks based on blockchain technology. [S7]

## 2. System Concepts

TODO: System Concepts section is not sufficiently detailed in the provided context.

## 3. Technical Concepts

### Architecture Patterns

*   **Component-Based Architecture:** A pattern where distinct features and functionalities are encapsulated within reusable components, promoting code reusability, maintainability, and testability. [S6]

### Technologies

*   **Flutter:** A UI toolkit for building beautiful, natively compiled applications for mobile, web, and desktop from a single codebase. [S6]
*   **Bloc Pattern:** A state management pattern used in Flutter applications to ensure a predictable and maintainable UI. [S6]
*   **CoinGecko API:** An API used by CryptoWave to provide real-time cryptocurrency market data, price charts, and detailed coin information. [S6, S11, S12, S18]
*   **FL Chart:** A charting library used for displaying interactive price charts. [S13]
*   **Markdown:** A lightweight markup language used for writing documentation content due to its simplicity, readability, and widespread support. [S5]

## 4. Acronyms & Abbreviations

TODO: Acronyms & Abbreviations section is not sufficiently detailed in the provided context.

## 5. Concept Relationships

*   The CryptoWave application utilizes the **CoinGecko API** to fetch real-time cryptocurrency market data. [S6, S11, S12, S18]
*   The application employs the **Bloc pattern** for state management. [S6]
*   **FL Chart** is used for displaying interactive price charts. [S13]

## SOURCES

- [S6] docs/02-architecture/system-architecture.md
- [S7] docs/01-overview/key-concepts.md
- [S11] docs/04-apis/sdk-libraries.md
- [S12] docs/04-apis/pagination.md
- [S13] docs/01-overview/changelog.md
- [S18] docs/04-apis/rest-api/endpoints/README.md