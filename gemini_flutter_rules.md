# Gemini Flutter Development Rules

This document outlines the rules and best practices I, as a Gemini-powered AI, will adhere to when generating Flutter application code and related documentation.

## Table of Contents
* [1. Project Setup & Structure](#1-project-setup--structure)
* [2. Coding Standards & Style](#2-coding-standards--style)
* [3. Widget Design & Composition](#3-widget-design--composition)
* [4. Theming](#4-theming)
* [5. State Management](#5-state-management)
* [6. Asynchronous Operations & Error Handling](#6-asynchronous-operations--error-handling)
* [7. HTTP Calls & API Interaction](#7-http-calls--api-interaction)
* [8. Navigation](#8-navigation)
* [9. Dependencies & Packages](#9-dependencies--packages)
* [10. Testing](#10-testing)
* [11. Performance](#11-performance)
* [12. Code Documentation & Comments](#12-code-documentation--comments)
* [13. Security Considerations](#13-security-considerations)
* [14. User Experience (UX) Focus](#14-user-experience-ux-focus)
* [15. Version Control Practices](#15-version-control-practices)
* [16. Continuous Improvement](#16-continuous-improvement)
* [17. UI Constants & Theme Helpers](#17-ui-constants--theme-helpers)
* [README Generation Rules](#readme-generation-rules)

## 1. Project Setup & Structure

Use Flutter 3.29.0

1.1 Standard Initialization: Always start new projects using the official `flutter create <project_name>`

1.2 Directory Organization:
    *  Always `lib` directory for Dart code.
    *   Within `lib`, directory organization will be done by layers (e.g., `lib/src/widgets/`, `lib/src/models/`, `lib/src/services/`).
    *   Assets will be placed in a top-level `assets` directory and declared in `pubspec.yaml`. Specific asset types will be organized into subdirectories: `assets/images/` for images, `assets/fonts/` for fonts, and other types in their respective named subdirectories (e.g., `assets/data/` for data files, `assets/rive/` for Rive animations).
    *   Tests will reside in the `test` directory.

1.3 Naming Conventions:
    *   File names will be in `snake_case.dart` (e.g., `user_profile_screen.dart`).
    *   Directories will also be in `snake_case`.
    *   Class names, enums, and typedefs will be in `UpperCamelCase`.
    *   Variables, methods, and parameters will be in `lowerCamelCase`.
    *   Constants will be in `lowerCamelCase` or `UPPER_SNAKE_CASE` if they are top-level or static consts.

[Back to Top](#table-of-contents)

## 2. Coding Standards & Style

Effective Dart: I will adhere to the guidelines outlined in Effective Dart.

2.1 Linting: I'll use `flutter analyze` and strive to eliminate all warnings and errors. I'll assume a standard set of linting rules (e.g., from the `lints` or `flutter_lints` package).

2.2 Formatting: All Dart code will be formatted using `dart format` to ensure consistent styling.

2.3 Readability:
    *   I'll use meaningful names for variables, functions, and classes.
    *   I'll prefer `const` for variables and constructors where possible to improve performance and indicate immutability.
    *   I'll avoid overly long lines of code (typically aiming for around 80-100 characters).
    *   Functions and classes will be kept concise and focused on a single responsibility.

2.4 Type Safety: I will leverage Dart's strong type system by specifying types for variables, parameters, and return values. I'll use `dynamic` sparingly and only when necessary.

[Back to Top](#table-of-contents)

## 3. Widget Design & Composition

3.1 Modularity: I'll break down complex UIs into smaller, reusable widgets. Each widget will have a clear purpose.

3.2 Stateless vs. Stateful:
    *   I'll prefer `StatelessWidget` whenever a widget doesn't need to manage internal, mutable state.
    *   `StatefulWidget` will be used when a widget's appearance or behavior needs to change based on internal state or lifecycle events.

3.3 `const` Constructors: For widgets that can be constant, I will provide `const` constructors. This is crucial.

3.4 Separation of Concerns**: I'll strive to keep UI (widget) code separate from business logic.

3.5 Responsive Design: I'll consider how UIs should adapt to different screen sizes and orientations, using techniques like `MediaQuery`, `LayoutBuilder`, `FittedBox`, or responsive layout widgets. I will keep `MediaQuery` to the absolute minimum, and it will be kept as close to where it is needed in the widget tree.

3.5 Build Method Purity: Widget `build` methods should be pure and free of side effects. They should describe the UI based on the current state and props.

3.6 User Preferences & Accessibility Settings: I will strive to build UIs that respect and adapt to user-defined preferences (e.g., theme choices, font sizes) and accessibility settings configured on their device (e.g., screen reader compatibility, larger text).

3.7 Widget Sourcing & Preferences: Preference will be given to Flutter's built-in widgets. In cases where I need widgets from `pub.dev`, the frequency of updates and whether the package is well-maintained will be considered first. For charts, preference will be given to the nimble_charts package.

[Back to Top](#table-of-contents)

## 4. Theming

A consistent visual appearance enhances the user experience.

4.1 Centralized Theme: Define app-wide themes (`ThemeData`) centrally in `MaterialApp`, including `ColorScheme` and `TextTheme`.

4.2 Contextual Access: Always access theme properties via `Theme.of(context)` (e.g., `Theme.of(context).colorScheme.primary`) instead of hardcoding values.

4.3 Color Palette Strategy:
    *   **Brand Alignment**: The color palette should align with the brand identity, using primary and secondary brand colors effectively.
    *   **Proactive Inquiry**: If a specific color palette or seed color is not provided by you, I will ask clarifying questions to help define it. This includes inquiring about primary/secondary brand colors, desired mood (e.g., vibrant, muted, professional), and any specific accessibility contrast requirements you might have.
    *   **ColorScheme Usage**: Utilize `ColorScheme.fromSeed` for generating harmonious light and dark color schemes from a single seed color. For more granular control, define `ColorScheme` properties explicitly.
    *   **Semantic Colors**: Consistently use semantic colors provided by `ColorScheme` (e.g., `primary`, `secondary`, `surface`, `background`, `error`, `onPrimary`, `onSecondary`, etc.) for UI elements and states.
    *   **Contrast & Harmony**: Employ color theory principles and tools (e.g., Adobe Color, Colors) to ensure the palette is visually harmonious. Crucially, verify that color combinations provide sufficient contrast for readability and meet accessibility standards (e.g., WCAG AA or AAA levels).
    *   **Limited Palette**: Prefer a limited and well-defined color palette (e.g., 3-5 primary/accent colors plus neutrals) to maintain visual consistency and avoid overwhelming the user.

4.4 Dark Mode & Theme Selection:
    *   Implement dark mode support by providing both `theme` (for light mode) and `darkTheme` in `MaterialApp`.
    *   The app should allow users to select their preferred theme mode (e.g., Light, Dark, or System default) through a clear user interface element (like a toggle in settings).
    *   The user's theme preference should be persisted across app sessions (e.g., using `shared_preferences`).
    *   Manage the active `ThemeMode` and theme switching logic through a dedicated service or state management solution (e.g., a `ThemeManager` class using `ChangeNotifier`).

4.5 Custom Extensions: For app-specific styling that doesn't fit neatly into standard `ThemeData` properties (e.g., custom button styles, specific spacing values), use `ThemeExtension<T>` for better organization and type-safe access.

4.6 Consistency: Apply all theming elements (colors, typography, component styles, spacing) consistently across the entire application to create a cohesive user experience.

4.7 Accessibility (Reiteration): Beyond color contrast, ensure that typography choices (font family, size, weight) are legible and that theme changes do not negatively impact other accessibility features.

4.8 `Color.withOpacity()` is Deprecated: As of Flutter 3.19, `Color.withOpacity()` is deprecated due to potential precision issues and the availability of clearer alternatives. Prefer using `existingColor.withAlpha((newOpacity * 255).round())` to modify an existing color's opacity, or `Color.alphaBlend(foregroundColor, backgroundColor)` for blending. If creating a new color with specific RGBA values (conceptually similar to setting all ".withValues()"), use `Color.fromARGB(alpha, red, green, blue)` or `Color.fromRGBO(red, green, blue, newOpacity)` for precise control.

[Back to Top](#table-of-contents)

## 5. State Management

Managing state effectively is key to a robust Flutter app, I will always use Riverpod.

5.1 Clear State Flow: The flow of data and state changes will be designed to be predictable and easy to trace.

5.2 Scoped State: I'll aim to keep state as localized as possible, providing it only to the widgets that need it.

5.3 Immutability: When using more advanced state management, I'll often favor immutable state objects to ensure predictability and simplify debugging.

[Back to Top](#table-of-contents)

## 6. Asynchronous Operations & Error Handling

Handling operations that take time, and dealing with potential errors, is crucial.

6.1 `async/await`: I'll use `async` and `await` for clear and readable asynchronous code.

6.2 Futures and Streams: I'll use `FutureBuilder` and `StreamBuilder` appropriately to reactively build UI based on the state of asynchronous operations.

6.3 Loading States: I'll ensure UIs provide feedback during asynchronous operations (e.g., loading indicators).

6.4 Error Handling:
    *   I'll use `try-catch` blocks to handle potential exceptions in asynchronous code.
    *   I'll aim to display user-friendly error messages rather than crashing the app or showing raw error details.
    *   I'll check if a widget `mounted` before calling `setState` or accessing `context` in asynchronous callbacks to prevent errors.

[Back to Top](#table-of-contents)

## 7. HTTP Calls & API Interaction

Interacting with external services and APIs is a common requirement.

7.1 Dedicated Service Layer:
    *   All HTTP calls and API interactions will be encapsulated within a dedicated service layer (e.g., `services/api_service.dart` or `services/github_service.dart`).
    *   UI widgets will not make HTTP calls directly but will interact with the service layer.

7.2 `http` Package:
    *   The `http` package (`package:http/http.dart`) will be the standard choice for making HTTP requests.

7.3 Generic Request Handler:
    *   Services should implement a generic, private helper method for common request types (e.g., `_getRequest(String endpoint)`, `_postRequest(String endpoint, Map<String, dynamic> body)`).
    *   This helper method will handle base URL concatenation, common headers, and basic response parsing/error checking.

7.4 Specific API Methods:
    *   For each distinct API endpoint or operation, the service will expose a public method (e.g., `Future<UserProfile> fetchUserProfile(String userId)`).
    *   These methods will call the generic request handler and perform any specific data transformation or error handling relevant to that endpoint.

7.5 Error Handling (Service Layer):
    *   Services will robustly handle potential errors: check HTTP status codes and throw specific exceptions for non-successful responses (e.g., `ApiException('Failed to load data (Status code: \${response.statusCode})')`). Use `try-catch` blocks for network errors.
    *   Exceptions thrown by the service should be caught and handled gracefully in the calling layer (e.g., UI or state management).

7.6 Constants for URLs: Base URLs and frequently used API path segments should be defined as constants (e.g., in an `app_constants.dart` file or within the service) to avoid magic strings.

7.6 Data Models: JSON responses from APIs should be parsed into strongly-typed Dart model classes (with `fromJson` factory constructors) to ensure type safety.

[Back to Top](#table-of-contents)

## 8. Navigation

Getting around the app should be intuitive.

8.1 Routing Strategy & Package: 'import 'package:go_router/go_router.dart';'
    *   Navigation will be performed using `go_router`'s context-based methods like `context.go('/path')`, `context.push('/path')`, or `context.goNamed('routeName')`.
    *   All routes will be defined within the `GoRouter` configuration.

8.2 Route Arguments: I'll pass arguments to routes in a type-safe manner using `go_router`'s mechanisms, often by defining argument classes passed via the `extra` parameter or through path/query parameters.
    *   Example (using `extra`): `context.go('/user_details', extra: UserDetailsArgs(userId: '123'));`
    *   Example (using path parameters defined in `GoRoute`): `context.go('/users/123');`

[Back to Top](#table-of-contents)

## 9. Dependencies & Packages

I'll leverage the rich Flutter ecosystem responsibly.

9.1 Judicious Use: I'll only add packages from `pub.dev` when they provide significant value and are well-maintained.

9.2 Version Pinning: I'll specify dependency versions in `pubspec.yaml` carefully, often using caret syntax (e.g., `^1.2.3`) to allow compatible updates while ensuring stability.

9.3 Up-to-Date: I'll try to use recent, stable versions of packages.

9.4 Cleanup: I'll remind you or attempt to remove unused dependencies to keep the project lean.

9.5 CLI Command for Adding Packages: When I suggest adding a new package, I will also provide the corresponding `flutter pub add <package_name>` command for easy installation.

[Back to Top](#table-of-contents)

## 10. Testing

10.2 Widget Tests:
    *   I'll write widget tests to verify that widgets render correctly and respond to user interactions as expected.
    *   I'll use the `flutter_test` package.

10.3 Integration Tests: For more complex flows, I might suggest or provide integration tests.

10.4 Test Coverage: I'll aim for reasonable test coverage, focusing on critical paths and complex logic.

10.5 Mocking: I'll use mocking (e.g., with the `mockito` package) to isolate units under test from their dependencies.

[Back to Top](#table-of-contents)

## 11. Performance

A smooth and responsive app is a joy to use.

11.1 Widget Rebuilds: I'll be mindful of minimizing unnecessary widget rebuilds. This includes:
    *   Using `const` widgets wherever possible.
    *   Breaking down large widgets.
    *   Properly using state management to update only necessary parts of the UI.

11.2 `ListView.builder`: For long lists, I'll always use `ListView.builder` (or similar constructors like `GridView.builder`) for performance.

11.3 Lazy Loading: I'll implement lazy loading for data and resources where appropriate.

11.4 DevTools: I'll encourage the use of Flutter DevTools for profiling and identifying performance bottlenecks.

11.5 Avoid Expensive Operations in Build: I'll avoid performing expensive computations or I/O operations directly within `build` methods.

[Back to Top](#table-of-contents)

## 12. Code Documentation & Comments

Code should be understandable not just by machines, but by humans too!

12.1 Dartdocs: I'll write Dartdocs comments (`///`) for all public classes, methods, functions, and important properties. This helps in generating documentation and improves code understanding.
    *   Example:
        ```dart
        /// Fetches user data from the server.
        ///
        /// Throws a [NetworkException] if the request fails.
        Future<User> fetchUserData(String userId) async {
          // ... implementation ...
        }
        ```

12.2 Inline Comments: I'll use inline comments (`//`) to explain complex, non-obvious, or tricky parts of the code.

12.3 Clarity over Quantity: Comments will be used to clarify *why* something is done, not just *what* is done (if the code itself is clear).

12.4 Keep Updated: I'll try to ensure comments and documentation are kept in sync with code changes.

[Back to Top](#table-of-contents)

## 13. Security Considerations

Building secure apps is a top priority.

13.1 Sensitive Data: I will avoid hardcoding sensitive information (API keys, secrets) directly in the client-side code. I'll recommend using environment variables or secure storage solutions.

13.2 Network Communication: I'll default to using HTTPS for all network requests.

13.3 Input Validation: I'll implement input validation on both client-side and server-side (though I primarily generate client-side code).

13.4 Dependency Security: I'll be mindful of potential vulnerabilities in third-party packages.

13.5 Local Storage: When using local storage (e.g., `shared_preferences`, `flutter_secure_storage`), I'll consider the sensitivity of the data being stored.

[Back to Top](#table-of-contents)

## 14. User Experience (UX) Focus

While I generate code, I'll keep the end-user experience in mind.

14.1 Feedback: I'll ensure the app provides appropriate feedback for user actions (e.g., taps, loading states, success/error messages).

14.2 Accessibility (A11y): I'll try to use widgets and practices that support accessibility, such as providing semantic labels and ensuring sufficient contrast (though visual design is often iterative).

14.3 Platform Conventions: I'll aim to follow common UI/UX patterns for iOS and Android where appropriate, or create a consistent custom design.

14.4 Intuitive Interfaces: I'll strive to generate UIs that are intuitive and easy to navigate.

[Back to Top](#table-of-contents)

## 15. Version Control Practices

Good version control hygiene is important for collaboration and project history. While I don't directly commit code, I'll generate it in a way that's conducive to good VCS practices.

15.1 `.gitignore`: I'll assume a standard Flutter `.gitignore` file is in use to exclude unnecessary files from version control.

15.2 Logical Changes: When I make changes or add features, I'll try to do so in logical, self-contained chunks that would correspond to good commit practices.

[Back to Top](#table-of-contents)

## 16. Continuous Improvement

The Flutter ecosystem is always evolving, and so am I!

16.1 Stay Updated: I'll be continuously updated with the latest Flutter features, Dart language enhancements, and community best practices.

16.2 Adaptability: I'll be open to adapting these guidelines based on new information, specific project requirements, or your feedback.

[Back to Top](#table-of-contents)

## 17. UI Constants & Theme Helpers

To ensure visual consistency for spacing, padding, border radii, and other common UI values, and to make them easily updatable.

17.1 Standard UI Constants File: The file lib/src/constants/ui_constants.dart will always be added to new projects and used as a primary source for UI constants.

17.2 Dedicated Constants File:
    *   I will create or use a dedicated file for UI constants, for example, `lib/src/constants/ui_constants.dart` or `lib/src/common/ui_helpers.dart`.

17.3 Standard Spacing & Padding:
    *   Define standard spacing values as `double` constants (e.g., `kSpaceSmall = 4.0`, `kSpaceMedium = 8.0`, `kSpaceLarge = 16.0`).
    *   Define standard padding `EdgeInsets` constants (e.g., `kPagePadding = EdgeInsets.all(16.0)`, `kHorizontalPaddingMedium = EdgeInsets.symmetric(horizontal: 8.0)`).
    *   These constants should be used throughout the application for `Padding` widgets, `SizedBox` dimensions, margins in `Container`s, etc., instead of magic numbers.

17.4 Standard Border Radius:
    *   Define standard `BorderRadius` constants (e.g., `kBorderRadiusSmall = BorderRadius.circular(4.0)`, `kCardBorderRadius = BorderRadius.circular(12.0)`).

17.5 Reusable `SizedBox` Widgets (Theme Helpers):
    *   Consider creating `const SizedBox` instances for common fixed-size spacing (e.g., `const SizedBox kVerticalSpacerSmall = SizedBox(height: kSpaceSmall);`, `const SizedBox kHorizontalSpacerMedium = SizedBox(width: kSpaceMedium);`). These can make widget trees more readable.

17.6 Other UI Constants:
    *   This file can also be a home for other frequently used UI values like standard icon sizes (`kIconSizeSmall`, `kIconSizeMedium`), button heights (`kButtonHeight`), card elevations (`kCardElevationDefault`), or animation durations (`kShortAnimationDuration`).

17.7 Naming Conventions:
    *   Constants should follow clear naming conventions, often prefixed with `k` (e.g., `kPagePadding`) or be descriptive (e.g., `smallSpace`).

17.8 Usage:
    *   I will consistently import and use these constants in widget build methods to maintain uniformity across the app.

[Back to Top](#table-of-contents)

## README Generation Rules

When generating README.md files or similar documentation:

Always include a Table of Contents linking to major sections (`##` headings).

Add a `[Back to Top](#table-of-contents)` link at the end of each major section.

Use numbered lists for step-by-step instructions.

Use bullet points for lists of related items or options (like in the Table of Contents).

Format examples clearly, using markdown code blocks where appropriate.

Explain the purpose of a section before diving into details.

When providing setup instructions, include steps for both VS Code and Android Studio/IntelliJ IDEA if relevant.

[[Back to Top](#table-of-contents)](#table-of-contents)
