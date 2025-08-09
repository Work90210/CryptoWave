## Quick Start Guide

This guide provides a streamlined process for setting up and running the system.

### 1. Prerequisites Check

*   **Required Software and Tools:**
    *   Flutter SDK
    *   Android SDK
*   **Environment Requirements:**
    *   Java Development Kit (JDK)
*   **Access Permissions:**
    *   Internet permission is required for the Flutter tool to communicate with the running application for features like hot reload and debugging. This is declared in `android/app/src/debug/AndroidManifest.xml` and `android/app/src/profile/AndroidManifest.xml`.
*   **Dependency Verification:**
    *   The project utilizes `very_good_analysis` for linting, configured in `analysis_options.yaml`.

### 2. Fast Installation

*   **Minimal Setup Commands:**
    *   Clone the repository.
    *   Navigate to the project directory.
    *   Run `flutter pub get` to fetch dependencies.
    *   Run `flutter run` to build and launch the application on an connected Android device or emulator.
*   **Quick Configuration Options:**
    *   The `android/gradle.properties` file contains JVM arguments for Gradle, such as `-Xmx8G` for maximum heap size.
*   **Default Settings:**
    *   The application uses AndroidX (`android.useAndroidX=true`) and enables Jetifier (`android.enableJetifier=true`), as specified in `android/gradle.properties`.
    *   The default launch theme for Android is defined in `android/app/src/main/res/values/styles.xml` and `android/app/src/main/res/values-night/styles.xml`. The `LaunchTheme` uses `@drawable/launch_background` for the window background.
*   **Verification Steps:**
    *   Observe the application launching on your device or emulator.

### 3. First Success

*   **Simple Working Example:**
    *   Upon successful launch, the application will display its main interface, which is designed to fetch and present real-time cryptocurrency data.
*   **Expected Output/Results:**
    *   The application should load and display cryptocurrency information without errors.
*   **Common Success Indicators:**
    *   The application starts without crashing.
    *   Data is visible on the screen.
*   **Basic Functionality Demonstration:**
    *   The core functionality involves fetching data from the CoinGecko API via `lib/repositories/coin_repository.dart` to display cryptocurrency market data.

### 4. Immediate Next Steps

*   **More Detailed Setup:**
    *   Refer to `docs/00-meta/doc-standards.md` for documentation standards.
    *   Consult `docs/00-meta/doc-maintenance.md` for maintenance guidelines.
    *   Review `docs/00-meta/doc-tools.md` for information on documentation tools.
    *   Understand version control for documentation in `docs/00-meta/doc-versioning.md`.
    *   Explore accessibility guidelines in `docs/00-meta/doc-accessibility.md`.
*   **Common Customization Options:**
    *   Customize the launch screen background by modifying `android/app/src/main/res/drawable/launch_background.xml` and `android/app/src/main/res/drawable-v21/launch_background.xml`.
*   **Troubleshooting Quick Fixes:**
    *   Ensure all prerequisites are met.
    *   Clean the build cache with `flutter clean` and then run `flutter run` again.
*   **Links to Full Documentation:**
    *   API Documentation: `docs/04-apis/sdk-libraries.md`, `docs/04-apis/rest-api/request-examples.md`, `docs/04-apis/rest-api/status-codes.md`, `docs/04-apis/versioning.md`.
    *   Key Concepts: `docs/01-overview/key-concepts.md`.
    *   Stakeholders: `docs/01-overview/stakeholders.md`.

### 5. Common Issues

*   **Typical Setup Problems:**
    *   Missing or incorrectly configured SDKs (Flutter, Android).
    *   Network issues preventing dependency downloads.
*   **Quick Resolution Steps:**
    *   Verify SDK installations and environment variables.
    *   Check internet connectivity and proxy settings.
*   **When to Seek Help:**
    *   If persistent issues arise after checking common problems, consult project maintainers or relevant community forums.
*   **Alternative Approaches:**
    *   TODO: Provide alternative approaches for common issues if documented.

## SOURCES

*   [S1] android/gradle.properties
*   [S3] android/app/src/main/res/values-night/styles.xml
*   [S4] docs/00-meta/doc-standards.md
*   [S5] docs/00-meta/doc-maintenance.md
*   [S6] android/app/src/main/res/drawable/launch_background.xml
*   [S7] android/app/src/main/res/drawable-v21/launch_background.xml
*   [S8] android/app/src/main/res/values/styles.xml
*   [S9] analysis_options.yaml
*   [S10] docs/00-meta/doc-accessibility.md
*   [S11] android/app/src/debug/AndroidManifest.xml
*   [S12] android/app/src/profile/AndroidManifest.xml
*   [S14] docs/04-apis/sdk-libraries.md
*   [S15] docs/01-overview/key-concepts.md
*   [S16] docs/00-meta/doc-tools.md
*   [S17] docs/00-meta/doc-versioning.md
*   [S18] docs/04-apis/rest-api/request-examples.md
*   [S19] docs/04-apis/rest-api/status-codes.md
*   [S20] docs/04-apis/versioning.md