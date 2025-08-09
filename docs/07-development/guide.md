# CryptoWave Developer Guide

This guide provides comprehensive information for developers contributing to the CryptoWave project. It covers environment setup, project structure, development workflows, coding standards, testing, debugging, deployment, troubleshooting, and contribution guidelines.

## 1. Development Environment Setup

To develop CryptoWave, you will need the following tools and dependencies installed on your system.

### 1.1. Prerequisites

*   **Java Development Kit (JDK):** CryptoWave utilizes Kotlin, which requires a compatible JDK.
    *   **Recommendation:** JDK 17 or later.
    *   **Installation:** Download from [Oracle JDK](https://www.oracle.com/java/technologies/downloads/) or use a package manager like Homebrew (`brew install openjdk@17`).
    *   **Verification:** Open your terminal and run `java -version`.

*   **Android Studio:** The primary IDE for Android development.
    *   **Installation:** Download from the [official Android Developers website](https://developer.android.com/studio).
    *   **SDK Components:** Ensure you have the necessary Android SDK platforms and build tools installed via the SDK Manager in Android Studio.

*   **Xcode (for iOS development):** Required for building and running the iOS version of the application.
    *   **Installation:** Download from the [Mac App Store](https://apps.apple.com/us/app/xcode/id497799835?mt=12).
    *   **Command Line Tools:** Install Xcode command-line tools by running `xcode-select --install` in your terminal after installing Xcode.

*   **Flutter SDK:** CryptoWave is built using Flutter.
    *   **Installation:** Follow the official Flutter installation guide for your operating system: [https://docs.flutter.dev/get-started/install](https://docs.flutter.dev/get-started/install)
    *   **Verification:** Run `flutter doctor` in your terminal to check for any missing dependencies.

*   **Git:** Version control system.
    *   **Installation:** Download from [git-scm.com](https://git-scm.com/downloads).
    *   **Verification:** Run `git --version` in your terminal.

*   **IDE Plugins:**
    *   **Android Studio/IntelliJ IDEA:**
        *   Flutter and Dart plugins.
        *   Kotlin plugin.
    *   **VS Code:**
        *   Flutter extension.
        *   Dart extension.

### 1.2. Project Setup

1.  **Clone the Repository:**
    ```bash
    git clone https://github.com/Work90210/CryptoWave.git
    cd CryptoWave
    ```

2.  **Install Dependencies:**
    Navigate to the root of the cloned repository and run:
    ```bash
    flutter pub get
    ```
    This command fetches all the Dart and Flutter dependencies specified in `pubspec.yaml`.

3.  **Configure Environment Variables (if any):**
    *   Check for a `.env.example` file in the root directory. If present, copy it to `.env` and populate it with the necessary API keys and credentials.
    *   ```bash
        cp .env.example .env
        # Edit .env with your credentials
        ```
    *   **Note:** Sensitive credentials should not be committed to the repository.

4.  **Run the Application:**
    *   **Android:**
        ```bash
        flutter run -d android
        ```
    *   **iOS:**
        ```bash
        flutter run -d ios
        ```
    *   Ensure you have an Android emulator running or a physical device connected and authorized for debugging. For iOS, ensure a connected iPhone or iPad is authorized.

## 2. Project Structure Explanation

CryptoWave employs a modular, feature-based architecture. This structure promotes maintainability, scalability, and separation of concerns.

```
CryptoWave/
├── android/              # Native Android project files
├── ios/                  # Native iOS project files
├── lib/                  # Flutter project source code
│   ├── core/             # Core functionalities, utilities, and base classes
│   │   ├── constants/    # Application-wide constants
│   │   ├── errors/       # Custom error classes and handling
│   │   ├── network/      # Network layer implementation (e.g., Dio, http)
│   │   ├── utils/        # General utility functions
│   │   └── widgets/      # Reusable UI components not specific to a feature
│   ├── features/         # Feature modules
│   │   ├── auth/         # Authentication feature
│   │   │   ├── data/     # Data layer (repositories, data sources)
│   │   │   ├── domain/   # Domain layer (entities, use cases, abstract repos)
│   │   │   └── presentation/ # UI layer (screens, widgets, view models)
│   │   ├── home/         # Home screen feature
│   │   │   ├── data/
│   │   │   ├── domain/
│   │   │   └── presentation/
│   │   └── ...           # Other features (e.g., portfolio, trading, settings)
│   ├── generated/        # Auto-generated files (e.g., localization, code generation)
│   ├── main.dart         # Application entry point
│   ├── routes/           # Routing configuration
│   │   └── app_router.dart
│   ├── shared/           # Shared resources and configurations
│   │   ├── theme/        # Application theme definitions
│   │   └── localization/ # Localization setup
│   └── pubspec.yaml      # Project dependencies and metadata
├── test/                 # Unit and widget tests
├── .env.example          # Example environment variables
├── .gitignore            # Git ignore file
├── analysis_options.yaml # Dart analysis options
├── pubspec.yaml          # Project dependencies and metadata
└── README.md             # Project README
```

*   **`android/` & `ios/`:** Contain the native project files for each platform. These are managed by Flutter but can be accessed for platform-specific configurations.
*   **`lib/`:** The main directory for Flutter application code.
    *   **`core/`:** Houses cross-cutting concerns like networking, utilities, error handling, and base UI components.
    *   **`features/`:** Each subdirectory here represents a distinct feature of the application (e.g., authentication, user profile, trading). This modularity is key to the project's structure.
        *   **`data/`:** Contains data sources (e.g., API clients, local storage) and repository implementations.
        *   **`domain/`:** Holds the core business logic, including entities, use cases, and abstract repository interfaces. This layer is platform-agnostic.
        *   **`presentation/`:** Implements the UI layer, including screens, widgets, state management (e.g., Provider, BLoC), and view models.
    *   **`generated/`:** Stores files generated by build tools or code generation processes.
    *   **`main.dart`:** The application's entry point, where the Flutter widget tree is initialized.
    *   **`routes/`:** Defines the application's navigation structure.
    *   **`shared/`:** Contains shared resources like theming, localization configurations, and common assets.
*   **`test/`:** Contains unit, widget, and integration tests.
*   **`analysis_options.yaml`:** Configures static analysis for Dart code, enforcing coding standards.
*   **`.env.example`:** Provides a template for environment-specific configurations.

## 3. Development Workflow

A typical development workflow involves fetching the latest changes, implementing new features or fixing bugs, testing, and submitting changes for review.

1.  **Update Local Repository:**
    *   Ensure your local branch is up-to-date with the main development branch (e.g., `develop` or `main`).
    *   ```bash
        git checkout develop # Or your main development branch
        git pull origin develop
        ```

2.  **Create a New Feature/Bugfix Branch:**
    *   Create a new branch for your work, following the naming convention `feature/<feature-name>` or `fix/<bug-description>`.
    *   ```bash
        git checkout -b feature/add-new-coin-listing
        ```

3.  **Implement Changes:**
    *   Develop the feature or fix the bug according to the project's architecture and coding standards.
    *   Write unit and widget tests for your changes.

4.  **Test Locally:**
    *   Run the application on emulators or physical devices to verify your changes.
    *   Execute tests:
        *   Unit tests: `flutter test test/unit/`
        *   Widget tests: `flutter test test/widget/`
        *   All tests: `flutter test`

5.  **Commit Changes:**
    *   Stage your changes:
        ```bash
        git add .
        ```
    *   Commit with a clear and concise message following conventional commits.
        ```bash
        git commit -m "feat: Add CoinListingCard widget for displaying coin data"
        ```

6.  **Push Changes:**
    *   Push your branch to the remote repository.
    *   ```bash
        git push origin feature/add-new-coin-listing
        ```

7.  **Create a Pull Request (PR):**
    *   Navigate to the project's repository on GitHub.
    *   Create a new Pull Request from your feature branch to the main development branch (e.g., `develop`).
    *   Provide a clear description of your changes, including the problem solved, the solution implemented, and any relevant context. Link to related issues.

8.  **Code Review:**
    *   Team members will review your PR. Address any feedback or requested changes.

9.  **Merge:**
    *   Once the PR is approved and all checks pass, it will be merged into the target branch.

## 4. Coding Standards and Conventions

Adhering to consistent coding standards ensures code readability, maintainability, and collaboration.

### 4.1. Dart & Flutter Style Guide

*   Follow the official [Effective Dart](https://dart.dev/guides/language/effective-dart) and [Flutter Style Guide](https://flutter.dev/docs/development/tools/formatting).
*   Use `dart format` to automatically format your code. This is often integrated into IDEs.
    ```bash
    dart format .
    ```

### 4.2. Naming Conventions

*   **Classes:** `PascalCase` (e.g., `CoinListingCard`, `AuthRepository`).
*   **Functions/Methods:** `lowerCamelCase` (e.g., `fetchCoinData`, `buildListItem`).
*   **Variables:** `lowerCamelCase` (e.g., `coinPrice`, `isLoading`).
*   **Constants:** `SCREAMING_SNAKE_CASE` (e.g., `API_KEY`, `MAX_RETRIES`).
*   **Enums:** `PascalCase` for the enum type, `PascalCase` for enum values (e.g., `enum Status { Loading, Success, Error }`).
*   **File Names:** `snake_case.dart` (e.g., `coin_listing_card.dart`, `auth_repository.dart`).
*   **Feature Directories:** `snake_case` (e.g., `auth`, `home`).

### 4.3. File Structure within Features

As outlined in Section 2, each feature follows a `data`, `domain`, `presentation` structure.

### 4.4. State Management

*   CryptoWave utilizes [Provider](https://pub.dev/packages/provider) for state management.
*   Organize state management logic within the `presentation` layer of each feature.
*   Use `ChangeNotifier` for simple state management and consider BLoC/Cubit for more complex scenarios if adopted.

### 4.5. Error Handling

*   Implement custom error classes in `lib/core/errors/`.
*   Use `try-catch` blocks for handling exceptions, especially in asynchronous operations.
*   Return `Either<Failure, Success>` (using `dartz` package) for repository methods to clearly indicate success or failure.

### 4.6. Asynchronous Operations

*   Use `async`/`await` for all asynchronous operations.
*   Handle loading and error states appropriately in the UI.

### 4.7. Code Analysis

*   The `analysis_options.yaml` file enforces linting rules. Run `dart analyze` to check for potential issues.
    ```bash
    dart analyze
    ```

## 5. Testing Strategy

A robust testing strategy ensures the reliability and correctness of the application. CryptoWave employs a multi-layered testing approach.

### 5.1. Unit Tests

*   **Purpose:** Test individual functions, methods, or classes in isolation.
*   **Location:** `test/unit/`
*   **Framework:** `package:test`
*   **Mocking:** Use `mockito` for mocking dependencies.
*   **Focus:** Business logic, utility functions, data transformations.

### 5.2. Widget Tests

*   **Purpose:** Test individual Flutter widgets in isolation.
*   **Location:** `test/widget/`
*   **Framework:** `flutter_test`
*   **Focus:** Widget rendering, user interaction, state changes within a widget.

### 5.3. Integration Tests

*   **Purpose:** Test the interaction between multiple components or features, simulating real user flows.
*   **Location:** `integration_test/`
*   **Framework:** `integration_test` package.
*   **Focus:** End-to-end testing of user journeys, ensuring components work together correctly.

### 5.4. Writing Tests

*   **Arrange, Act, Assert (AAA):** Structure your tests using this pattern.
*   **Descriptive Names:** Use clear test names that explain what is being tested.
*   **Mock Dependencies:** Mock external services, repositories, and other dependencies to ensure tests are isolated and fast.
*   **Coverage:** Aim for high test coverage, especially for critical business logic.

**Example Unit Test (Conceptual):**

```dart
// lib/features/auth/domain/usecases/login_usecase_test.dart
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:crypto_wave/features/auth/domain/repositories/auth_repository.dart';
import 'package:crypto_wave/features/auth/domain/usecases/login_usecase.dart';
import 'package:crypto_wave/core/errors/failures.dart';

class MockAuthRepository extends Mock implements AuthRepository {}

void main() {
  late LoginUseCase useCase;
  late MockAuthRepository mockAuthRepository;

  setUp(() {
    mockAuthRepository = MockAuthRepository();
    useCase = LoginUseCase(mockAuthRepository);
  });

  final tEmail = 'test@example.com';
  final tPassword = 'password123';
  final tUser = User(id: '1', email: tEmail); // Assuming User entity exists

  test('should call login on the repository', () async {
    // Arrange
    when(mockAuthRepository.login(any, any))
        .thenAnswer((_) async => Right(tUser));

    // Act
    final result = await useCase(LoginParams(email: tEmail, password: tPassword));

    // Assert
    expect(result, Right(tUser));
    verify(mockAuthRepository.login(tEmail, tPassword)).called(1);
    verifyNoMoreInteractions(mockAuthRepository);
  });

  test('should return server failure when repository fails', () async {
    // Arrange
    when(mockAuthRepository.login(any, any))
        .thenAnswer((_) async => Left(ServerFailure('Server Error')));

    // Act
    final result = await useCase(LoginParams(email: tEmail, password: tPassword));

    // Assert
    expect(result, Left(ServerFailure('Server Error')));
    verify(mockAuthRepository.login(tEmail, tPassword)).called(1);
    verifyNoMoreInteractions(mockAuthRepository);
  });
}
```

## 6. Debugging Guide

Effective debugging is crucial for identifying and resolving issues quickly.

### 6.1. Using `flutter run`

*   Run your application from the terminal using `flutter run`. This provides detailed console output, including logs, errors, and warnings.
*   Use `print()` statements judiciously to inspect variable values and execution flow.

### 6.2. Android Studio / IntelliJ IDEA Debugger

*   **Breakpoints:** Set breakpoints in your Kotlin or Dart code by clicking in the gutter next to the line numbers.
*   **Step Through Code:** Use the debugger controls (Step Over, Step Into, Step Out) to execute code line by line.
*   **Variable Inspection:** Inspect the values of variables, objects, and expressions in the "Variables" pane.
*   **Evaluate Expressions:** Use the "Evaluate Expression" feature to test code snippets in the current context.
*   **Logcat (Android):** Use the Logcat window in Android Studio to view system logs, including messages from `android.util.Log` or `print()` statements.
*   **Console Output (iOS):** View logs from iOS devices or simulators in the Debug Console.

### 6.3. VS Code Debugger

*   Similar to Android Studio, VS Code offers robust debugging capabilities for Flutter and Dart.
*   Ensure you have the Flutter and Dart extensions installed.
*   Use the "Run and Debug" view to set breakpoints, step through code, and inspect variables.

### 6.4. Flutter DevTools

*   **Access:** Open DevTools by running `flutter pub global activate devtools` and then `devtools` in your terminal, or by clicking the "Open DevTools" link in the `flutter run` output.
*   **Features:**
    *   **Inspector:** Inspect the widget tree, view widget properties, and debug layout issues.
    *   **Performance:** Profile your application's performance, identify bottlenecks, and analyze frame rendering.
    *   **Logging:** View application logs and events.
    *   **Network:** Inspect network requests and responses.
    *   **Memory:** Analyze memory usage and detect leaks.

### 6.5. Common Debugging Scenarios

*   **UI Glitches:** Use the Inspector tab in DevTools to examine the widget tree and identify layout or rendering issues. Check for incorrect constraints, alignment, or sizing.
*   **State Management Issues:** Use `print` statements or the debugger to trace state changes and ensure your `ChangeNotifier` or BLoC is updating correctly.
*   **Network Errors:** Inspect network requests in DevTools or use `print` statements to log API responses and error messages. Verify API endpoints, headers, and request bodies.
*   **Platform-Specific Bugs:** Use platform-specific debugging tools (Logcat for Android, Console for iOS) and conditional logic in your code to isolate issues.

## 7. Deployment Process

The deployment process ensures that the application is built, tested, and released to the respective app stores.

### 7.1. Building Release Versions

*   **Android:**
    ```bash
    flutter build apk --release
    # or for app bundles:
    flutter build appbundle --release
    ```
    The output will be in the `build/app/outputs/flutter-apk/` or `build/app/outputs/bundle/release/` directory.

*   **iOS:**
    ```bash
    flutter build ipa --release
    ```
    This command prepares the `.ipa` file for distribution. You will typically use Xcode to archive and distribute the app.

### 7.2. App Store Submission

*   **Android (Google Play Store):**
    1.  Create a new release in the Google Play Console.
    2.  Upload the generated App Bundle (`.aab`) file.
    3.  Provide release notes, screenshots, and other required metadata.
    4.  Submit for review.

*   **iOS (App Store):**
    1.  Open the `ios/Runner.xcworkspace` file in Xcode.
    2.  Configure signing and capabilities (e.g., Bundle Identifier, Provisioning Profiles).
    3.  Select "Product" > "Archive".
    4.  In the Organizer window, select the archive and click "Distribute App".
    5.  Follow the prompts to upload to App Store Connect.
    6.  In App Store Connect, create a new version, add release notes, screenshots, and submit for review.

### 7.3. CI/CD Integration

*   The project may integrate with CI/CD pipelines (e.g., GitHub Actions, Codemagic, Bitrise) for automated building, testing, and deployment.
*   Refer to the CI/CD configuration files (e.g., `.github/workflows/`) for specific details on the automated deployment process.

## 8. Troubleshooting Common Issues

This section addresses frequently encountered problems and their solutions.

### 8.1. Dependency Issues (`flutter pub get` fails)

*   **Problem:** `flutter pub get` fails with errors related to missing packages or version conflicts.
*   **Solution:**
    1.  Ensure your Flutter SDK is up-to-date: `flutter upgrade`.
    2.  Clean the build cache: `flutter clean`.
    3.  Delete the `pubspec.lock` file and run `flutter pub get` again.
    4.  Check for version conflicts in `pubspec.yaml`.

### 8.2. Build Errors (Android/iOS)

*   **Problem:** Build fails with native compilation errors.
*   **Solution:**
    *   **Android:**
        *   Run `flutter doctor -v` to check for missing SDK components or environment issues.
        *   Clean the project: `flutter clean`.
        *   Invalidate caches and restart Android Studio.
        *   Check `android/build.gradle` and `android/app/build.gradle` for correct SDK versions and dependencies.
    *   **iOS:**
        *   Run `flutter doctor -v`.
        *   Clean the project: `flutter clean`.
        *   In Xcode, go to "Product" > "Clean Build Folder".
        *   Ensure your CocoaPods are up-to-date: `cd ios && pod install && cd ..`.
        *   Check signing and provisioning profiles in Xcode.

### 8.3. Hot Reload/Restart Issues

*   **Problem:** Hot Reload or Hot Restart stops working or behaves unexpectedly.
*   **Solution:**
    1.  Try a full restart of the application (`flutter run` again).
    2.  Run `flutter clean` and then `flutter pub get`.
    3.  Ensure your code changes are syntactically correct.

### 8.4. Network Connectivity Problems

*   **Problem:** Application cannot connect to APIs or fetch data.
*   **Solution:**
    1.  Verify device/emulator network connection.
    2.  Check API endpoints and credentials in `.env` file.
    3.  Use DevTools Network tab to inspect requests.
    4.  Ensure necessary permissions (e.g., `INTERNET`) are declared in native manifests (`AndroidManifest.xml`, `Info.plist`).

### 8.5. State Management Not Updating

*   **Problem:** UI does not reflect changes in the application state.
*   **Solution:**
    1.  Ensure `notifyListeners()` is called after state changes in `ChangeNotifier`.
    2.  Verify that widgets are correctly listening to the state provider (e.g., using `context.watch<MyNotifier>()`).
    3.  Check for potential issues with immutable state updates if using a more complex state management solution.

## 9. Contributing Guidelines

We welcome contributions to CryptoWave! Please follow these guidelines to ensure a smooth contribution process.

### 9.1. How to Contribute

1.  **Fork the Repository:** Fork the official CryptoWave repository to your GitHub account.
2.  **Clone Your Fork:** Clone your forked repository to your local machine.
    ```bash
    git clone https://github.com/<your-username>/CryptoWave.git
    cd CryptoWave
    ```
3.  **Set Upstream Remote:** Add the original repository as an upstream remote.
    ```bash
    git remote add upstream https://github.com/Work90210/CryptoWave.git
    ```
4.  **Keep Your Fork Synced:** Regularly pull changes from the upstream repository.
    ```bash
    git checkout main # Or develop
    git pull upstream main # Or develop
    git push origin main # Or develop
    ```
5.  **Create a Feature Branch:** Create a new branch for your contribution as described in Section 3.
6.  **Make Changes:** Implement your feature or fix.
7.  **Test Your Changes:** Ensure all tests pass and write new tests if necessary.
8.  **Commit Your Changes:** Use conventional commits for your commit messages.
9.  **Push to Your Fork:** Push your branch to your fork on GitHub.
10. **Create a Pull Request:** Open a Pull Request from your fork's branch to the `develop` branch of the main CryptoWave repository.

### 9.2. Code of Conduct

*   Please adhere to the [Contributor Covenant Code of Conduct](https://www.contributor-covenant.org/).

### 9.3. Reporting Bugs

*   If you find a bug, please check if it has already been reported.
*   If not, open a new issue on the GitHub repository with a clear title, detailed description, steps to reproduce, expected behavior, and actual behavior. Include relevant logs or screenshots.

### 9.4. Suggesting Features

*   For feature requests, open a new issue describing the proposed feature and its benefits.

## 10. Code Review Process

All code contributions must go through a code review process before being merged.

### 10.1. Pull Request Requirements

*   **Clear Description:** Provide a comprehensive description of the changes, including the problem solved, the solution, and any relevant context. Link to related issues.
*   **Tests:** Ensure that all relevant tests are written and passing.
*   **Code Formatting:** Code must be formatted according to the project's standards (`dart format`).
*   **Linting:** Code must pass all linting checks (`dart analyze`).
*   **No Breaking Changes:** Avoid introducing breaking changes without prior discussion and agreement.

### 10.2. Reviewer Responsibilities

*   Reviewers should provide constructive feedback in a timely manner.
*   Focus on code quality, correctness, adherence to standards, and potential performance or security implications.
*   Approve or request changes on the Pull Request.

### 10.3. Author Responsibilities

*   Address reviewer feedback promptly and politely.
*   Push updated code to the same branch.
*   Respond to comments and questions.

### 10.4. Merging

*   Once a Pull Request has been approved by at least one maintainer and all automated checks pass, it can be merged into the `develop` branch.
*   The PR author or a designated maintainer can perform the merge.