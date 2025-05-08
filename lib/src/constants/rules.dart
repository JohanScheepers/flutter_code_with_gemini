/// Contains the rules extracted from gemini_flutter_rules.md
/// This data can be used by tools or other parts of an application
/// to understand and apply the defined Flutter development guidelines.
dynamic rules = [
  {
    'section_title': '''1. Project Setup & Structure''',
    'description':
        '''The foundation of any good app is a clean and understandable project structure.''',
    'rules': [
      {
        'text':
            '''**Standard Initialization**: I'll always start new projects using the official `flutter create <project_name>` command to ensure a standard setup.'''
      },
      {
        'text': '''**Directory Organization**:
    *   I'll primarily use the `lib` directory for Dart code.
    *   Within `lib`, directory organization will be done by layers (e.g., `lib/src/widgets/`, `lib/src/models/`, `lib/src/services/`).
    *   Assets will be placed in a top-level `assets` directory and declared in `pubspec.yaml`. Specific asset types will be organized into subdirectories: `assets/images/` for images, `assets/fonts/` for fonts, and other types in their respective named subdirectories (e.g., `assets/data/` for data files, `assets/rive/` for Rive animations).
    *   Tests will reside in the `test` directory.'''
      },
      {
        'text': '''**Naming Conventions**:
    *   File names will be in `snake_case.dart` (e.g., `user_profile_screen.dart`).
    *   Directories will also be in `snake_case`.
    *   Class names, enums, and typedefs will be in `UpperCamelCase`.
    *   Variables, methods, and parameters will be in `lowerCamelCase`.
    *   Constants will be in `lowerCamelCase` or `UPPER_SNAKE_CASE` if they are top-level or static consts.'''
      },
    ],
  },
  {
    'section_title': '''2. Coding Standards & Style''',
    'description': '''Consistent code is readable code!''',
    'rules': [
      {
        'text':
            '''**Effective Dart**: I will adhere to the guidelines outlined in Effective Dart.'''
      },
      {
        'text':
            '''**Linting**: I'll use `flutter analyze` and strive to eliminate all warnings and errors. I'll assume a standard set of linting rules (e.g., from the `lints` or `flutter_lints` package).'''
      },
      {
        'text':
            '''**Formatting**: All Dart code will be formatted using `dart format` to ensure consistent styling.'''
      },
      {
        'text': '''**Readability**:
    *   I'll use meaningful names for variables, functions, and classes.
    *   I'll prefer `const` for variables and constructors where possible to improve performance and indicate immutability.
    *   I'll avoid overly long lines of code (typically aiming for around 80-100 characters).
    *   Functions and classes will be kept concise and focused on a single responsibility.'''
      },
      {
        'text':
            '''**Type Safety**: I will leverage Dart's strong type system by specifying types for variables, parameters, and return values. I'll use `dynamic` sparingly and only when necessary.'''
      },
    ],
  },
  {
    'section_title': '''3. Widget Design & Composition''',
    'description':
        '''Flutter's UI is all about widgets, so I'll build them thoughtfully.''',
    'rules': [
      {
        'text':
            '''**Modularity**: I'll break down complex UIs into smaller, reusable widgets. Each widget will have a clear purpose.'''
      },
      {
        'text': '''**Stateless vs. Stateful**:
    *   I'll prefer `StatelessWidget` whenever a widget doesn't need to manage internal, mutable state.
    *   `StatefulWidget` will be used when a widget's appearance or behavior needs to change based on internal state or lifecycle events.'''
      },
      {
        'text':
            '''**`const` Constructors**: For widgets that can be constant, I will provide `const` constructors. This is crucial for performance optimizations.'''
      },
      {
        'text':
            '''**Separation of Concerns**: I'll strive to keep UI (widget) code separate from business logic.'''
      },
      {
        'text':
            '''**Responsive Design**: I'll consider how UIs should adapt to different screen sizes and orientations, using techniques like `MediaQuery`, `LayoutBuilder`, `FittedBox`, or responsive layout widgets. I will keep `MediaQuery` to the absolute minimum, and it will be kept as close to where it is needed in the widget tree.'''
      },
      {
        'text':
            '''**Build Method Purity**: Widget `build` methods should be pure and free of side effects. They should describe the UI based on the current state and props.'''
      },
      {
        'text':
            '''**User Preferences & Accessibility Settings**: I will strive to build UIs that respect and adapt to user-defined preferences (e.g., theme choices, font sizes) and accessibility settings configured on their device (e.g., screen reader compatibility, larger text).'''
      },
      {
        'text':
            '''**Widget Sourcing & Preferences**: Preference will be given to Flutter's built-in widgets. In cases where I need widgets from `pub.dev`, the frequency of updates and whether the package is well-maintained will be considered first. For charts, preference will be given to the nimble_charts package.'''
      },
    ],
  },
  {
    'section_title': '''4. Theming''',
    'description':
        '''A consistent visual appearance enhances the user experience.''',
    'rules': [
      {
        'text':
            '''**Centralized Theme**: Define app-wide themes (`ThemeData`) centrally in `MaterialApp`, including `ColorScheme` and `TextTheme`.'''
      },
      {
        'text':
            '''**Contextual Access**: Always access theme properties via `Theme.of(context)` (e.g., `Theme.of(context).colorScheme.primary`) instead of hardcoding values.'''
      },
      {
        'text': '''**Color Palette Strategy**:
    *   **Brand Alignment**: The color palette should align with the brand identity, using primary and secondary brand colors effectively.
    *   **Proactive Inquiry**: If a specific color palette or seed color is not provided by you, I will ask clarifying questions to help define it. This includes inquiring about primary/secondary brand colors, desired mood (e.g., vibrant, muted, professional), and any specific accessibility contrast requirements you might have.
    *   **ColorScheme Usage**: Utilize `ColorScheme.fromSeed` for generating harmonious light and dark color schemes from a single seed color. For more granular control, define `ColorScheme` properties explicitly.
    *   **Semantic Colors**: Consistently use semantic colors provided by `ColorScheme` (e.g., `primary`, `secondary`, `surface`, `background`, `error`, `onPrimary`, `onSecondary`, etc.) for UI elements and states.
    *   **Contrast & Harmony**: Employ color theory principles and tools (e.g., Adobe Color, Coolors) to ensure the palette is visually harmonious. Crucially, verify that color combinations provide sufficient contrast for readability and meet accessibility standards (e.g., WCAG AA or AAA levels).
    *   **Limited Palette**: Prefer a limited and well-defined color palette (e.g., 3-5 primary/accent colors plus neutrals) to maintain visual consistency and avoid overwhelming the user.'''
      },
      {
        'text': '''**Dark Mode & Theme Selection**:
    *   Implement dark mode support by providing both `theme` (for light mode) and `darkTheme` in `MaterialApp`.
    *   The app should allow users to select their preferred theme mode (e.g., Light, Dark, or System default) through a clear user interface element (like a toggle in settings).
    *   The user's theme preference should be persisted across app sessions (e.g., using `shared_preferences`).
    *   Manage the active `ThemeMode` and theme switching logic through a dedicated service or state management solution (e.g., a `ThemeManager` class using `ChangeNotifier`).'''
      },
      {
        'text':
            '''**Custom Extensions**: For app-specific styling that doesn't fit neatly into standard `ThemeData` properties (e.g., custom button styles, specific spacing values), use `ThemeExtension<T>` for better organization and type-safe access.'''
      },
      {
        'text':
            '''**Consistency**: Apply all theming elements (colors, typography, component styles, spacing) consistently across the entire application to create a cohesive user experience.'''
      },
      {
        'text':
            '''**Accessibility (Reiteration)**: Beyond color contrast, ensure that typography choices (font family, size, weight) are legible and that theme changes do not negatively impact other accessibility features.'''
      },
      {
        'text':
            '''**Do Not Use `Color.withOpacity()`**: `withOpacity` is deprecated and shouldn't be used. Use `.withValues()` to avoid precision loss.'''
      },
    ],
  },
  {
    'section_title': '''5. State Management''',
    'description':
        '''Managing state effectively is key to a robust Flutter app.''',
    'rules': [
      {
        'text': '''**Appropriate Solution**:
        *   Before implementing state management, I will ask: "Is this a simple or complex app? Option 1: Simple, Option 2: Complex."
    *   If you select **Option 1 (Simple)**: I will use `setState` for managing simple, local widget state.
    *   If you select **Option 2 (Complex)**: I will use Riverpod for more comprehensive state management needs.'''
      },
      {
        'text':
            '''**Clear State Flow**: The flow of data and state changes will be designed to be predictable and easy to trace.'''
      },
      {
        'text':
            '''**Scoped State**: I'll aim to keep state as localized as possible, providing it only to the widgets that need it.'''
      },
      {
        'text':
            '''**Immutability**: When using more advanced state management, I'll often favor immutable state objects to ensure predictability and simplify debugging.'''
      },
    ],
  },
  {
    'section_title': '''6. Asynchronous Operations & Error Handling''',
    'description':
        '''Handling operations that take time, and dealing with potential errors, is crucial.''',
    'rules': [
      {
        'text':
            '''**`async/await`**: I'll use `async` and `await` for clear and readable asynchronous code.'''
      },
      {
        'text':
            '''**Futures and Streams**: I'll use `FutureBuilder` and `StreamBuilder` appropriately to reactively build UI based on the state of asynchronous operations.'''
      },
      {
        'text':
            '''**Loading States**: I'll ensure UIs provide feedback during asynchronous operations (e.g., loading indicators).'''
      },
      {
        'text': '''**Error Handling**:
    *   I'll use `try-catch` blocks to handle potential exceptions in asynchronous code.
    *   I'll aim to display user-friendly error messages rather than crashing the app or showing raw error details.
    *   I'll check if a widget `mounted` before calling `setState` or accessing `context` in asynchronous callbacks to prevent errors.'''
      },
    ],
  },
  {
    'section_title': '''7. HTTP Calls & API Interaction''',
    'description':
        '''Interacting with external services and APIs is a common requirement.''',
    'rules': [
      {
        'text': '''**Dedicated Service Layer**:
    *   All HTTP calls and API interactions will be encapsulated within a dedicated service layer (e.g., `services/api_service.dart` or `services/github_service.dart`).
    *   UI widgets will not make HTTP calls directly but will interact with the service layer.'''
      },
      {
        'text': '''**`http` Package**:
    *   The `http` package (`package:http/http.dart`) will be the standard choice for making HTTP requests.'''
      },
      {
        'text': '''**Generic Request Handler**:
    *   Services should implement a generic, private helper method for common request types (e.g., `_getRequest(String endpoint)`, `_postRequest(String endpoint, Map<String, dynamic> body)`).
    *   This helper method will handle base URL concatenation, common headers, and basic response parsing/error checking.'''
      },
      {
        'text': '''**Specific API Methods**:
    *   For each distinct API endpoint or operation, the service will expose a public method (e.g., `Future<UserProfile> fetchUserProfile(String userId)`).
    *   These methods will call the generic request handler and perform any specific data transformation or error handling relevant to that endpoint.'''
      },
      {
        'text': '''**Error Handling (Service Layer)**:
    *   Services will robustly handle potential errors: check HTTP status codes and throw specific exceptions for non-successful responses (e.g., `ApiException('Failed to load data (Status code: \${response.statusCode})')`). Use `try-catch` blocks for network errors.
    *   Exceptions thrown by the service should be caught and handled gracefully in the calling layer (e.g., UI or state management).'''
      },
      {
        'text':
            '''**Constants for URLs**: Base URLs and frequently used API path segments should be defined as constants (e.g., in an `app_constants.dart` file or within the service) to avoid magic strings.'''
      },
      {
        'text':
            '''**Data Models**: JSON responses from APIs should be parsed into strongly-typed Dart model classes (with `fromJson` factory constructors) to ensure type safety.'''
      },
    ],
  },
  {
    'section_title': '''8. Navigation''',
    'description': '''Getting around the app should be intuitive.''',
    'rules': [
      {
        'text':
            '''**Named Routes**: I'll prefer using named routes (`Navigator.pushNamed`) for navigation, as it makes routing logic cleaner and more manageable, especially for larger apps.
    *   Example: `Navigator.pushNamed(context, '/profile');`'''
      },
      {
        'text':
            '''**Route Arguments**: I'll pass arguments to routes in a type-safe manner, often by defining argument classes.'''
      },
      {
        'text':
            '''**Routing Strategy & Packages**: Before implementing routing, I will prompt: "What routing to use? Option 1: `go_router`, Option 2: `Navigator.pushNamed`."
    *   If **Option 1 (`go_router`)** is selected, I will use the `go_router` package. This is particularly recommended for applications with complex navigation requirements (e.g., deep linking, nested routing).
    *   If **Option 2 (`Navigator.pushNamed`)** is selected, I will use named routes as described in point 1 ("Named Routes") above.'''
      },
    ],
  },
  {
    'section_title': '''9. Dependencies & Packages''',
    'description': '''I'll leverage the rich Flutter ecosystem responsibly.''',
    'rules': [
      {
        'text':
            '''**Judicious Use**: I'll only add packages from `pub.dev` when they provide significant value and are well-maintained.'''
      },
      {
        'text':
            '''**Version Pinning**: I'll specify dependency versions in `pubspec.yaml` carefully, often using caret syntax (e.g., `^1.2.3`) to allow compatible updates while ensuring stability.'''
      },
      {
        'text':
            '''**Up-to-Date**: I'll try to use recent, stable versions of packages.'''
      },
      {
        'text':
            '''**Cleanup**: I'll remind you or attempt to remove unused dependencies to keep the project lean.'''
      },
      {
        'text':
            '''**CLI Command for Adding Packages**: When I suggest adding a new package, I will also provide the corresponding `flutter pub add <package_name>` command for easy installation.'''
      },
    ],
  },
  {
    'section_title': '''10. Testing''',
    'description':
        '''To ensure quality and maintainability, testing is essential.''',
    'rules': [
      {
        'text': '''**Unit Tests**:
    *   **I will always aim to generate unit tests for new functions and methods, especially those containing business logic.**
    *   These tests will verify the correctness of individual functions, methods, or classes in isolation.
    *   I'll use the `test` package.'''
      },
      {
        'text': '''**Widget Tests**:
    *   I'll write widget tests to verify that widgets render correctly and respond to user interactions as expected.
    *   I'll use the `flutter_test` package.'''
      },
      {
        'text':
            '''**Integration Tests**: For more complex flows, I might suggest or provide integration tests.'''
      },
      {
        'text':
            '''**Test Coverage**: I'll aim for reasonable test coverage, focusing on critical paths and complex logic.'''
      },
      {
        'text':
            '''**Mocking**: I'll use mocking (e.g., with the `mockito` package) to isolate units under test from their dependencies.'''
      },
    ],
  },
  {
    'section_title': '''11. Performance''',
    'description': '''A smooth and responsive app is a joy to use.''',
    'rules': [
      {
        'text':
            '''**Widget Rebuilds**: I'll be mindful of minimizing unnecessary widget rebuilds. This includes:
    *   Using `const` widgets wherever possible.
    *   Breaking down large widgets.
    *   Properly using state management to update only necessary parts of the UI.'''
      },
      {
        'text':
            '''**`ListView.builder`**: For long lists, I'll always use `ListView.builder` (or similar constructors like `GridView.builder`) for performance.'''
      },
      {
        'text':
            '''**Lazy Loading**: I'll implement lazy loading for data and resources where appropriate.'''
      },
      {
        'text':
            '''**DevTools**: I'll encourage the use of Flutter DevTools for profiling and identifying performance bottlenecks.'''
      },
      {
        'text':
            '''**Avoid Expensive Operations in Build**: I'll avoid performing expensive computations or I/O operations directly within `build` methods.'''
      },
    ],
  },
  {
    'section_title': '''12. Code Documentation & Comments''',
    'description':
        '''Code should be understandable not just by machines, but by humans too!''',
    'rules': [
      {
        'text':
            '''**Dartdocs**: I'll write Dartdoc comments (`///`) for all public classes, methods, functions, and important properties. This helps in generating documentation and improves code understanding.
    *   Example:
        ```dart
        /// Fetches user data from the server.
        ///
        /// Throws a [NetworkException] if the request fails.
        Future<User> fetchUserData(String userId) async {
          // ... implementation ...
        }
        ```'''
      },
      {
        'text':
            r'''**Inline Comments**: I'll use inline comments (`//`) to explain complex, non-obvious, or tricky parts of the code.'''
      },
      {
        'text':
            r'''**Clarity over Quantity**: Comments will be used to clarify *why* something is done, not just *what* is done (if the code itself is clear).'''
      },
      {
        'text':
            r'''**Keep Updated**: I'll try to ensure comments and documentation are kept in sync with code changes.'''
      },
    ],
  },
  {
    'section_title': '''13. Security Considerations''',
    'description': '''Building secure apps is a top priority.''',
    'rules': [
      {
        'text':
            '''**Sensitive Data**: I will avoid hardcoding sensitive information (API keys, secrets) directly in the client-side code. I'll recommend using environment variables or secure storage solutions.'''
      },
      {
        'text':
            '''**Network Communication**: I'll default to using HTTPS for all network requests.'''
      },
      {
        'text':
            '''**Input Validation**: I'll implement input validation on both client-side and server-side (though I primarily generate client-side code).'''
      },
      {
        'text':
            '''**Dependency Security**: I'll be mindful of potential vulnerabilities in third-party packages.'''
      },
      {
        'text':
            '''**Local Storage**: When using local storage (e.g., `shared_preferences`, `flutter_secure_storage`), I'll consider the sensitivity of the data being stored.'''
      },
    ],
  },
  {
    'section_title': '''14. User Experience (UX) Focus''',
    'description':
        '''While I generate code, I'll keep the end-user experience in mind.''',
    'rules': [
      {
        'text':
            '''**Feedback**: I'll ensure the app provides appropriate feedback for user actions (e.g., taps, loading states, success/error messages).'''
      },
      {
        'text':
            '''**Accessibility (A11y)**: I'll try to use widgets and practices that support accessibility, such as providing semantic labels and ensuring sufficient contrast (though visual design is often iterative).'''
      },
      {
        'text':
            '''**Platform Conventions**: I'll aim to follow common UI/UX patterns for iOS and Android where appropriate, or create a consistent custom design.'''
      },
      {
        'text':
            '''**Intuitive Interfaces**: I'll strive to generate UIs that are intuitive and easy to navigate.'''
      },
    ],
  },
  {
    'section_title': '''15. Version Control Practices''',
    'description':
        '''Good version control hygiene is important for collaboration and project history. While I don't directly commit code, I'll generate it in a way that's conducive to good VCS practices.''',
    'rules': [
      {
        'text':
            '''**`.gitignore`**: I'll assume a standard Flutter `.gitignore` file is in use to exclude unnecessary files from version control.'''
      },
      {
        'text':
            '''**Logical Changes**: When I make changes or add features, I'll try to do so in logical, self-contained chunks that would correspond to good commit practices.'''
      },
    ],
  },
  {
    'section_title': '''16. Continuous Improvement''',
    'description': '''The Flutter ecosystem is always evolving, and so am I!''',
    'rules': [
      {
        'text':
            '''**Stay Updated**: I'll be continuously updated with the latest Flutter features, Dart language enhancements, and community best practices.'''
      },
      {
        'text':
            '''**Adaptability**: I'll be open to adapting these guidelines based on new information, specific project requirements, or your feedback.'''
      },
    ],
  },
  {
    'section_title': '''17. UI Constants & Theme Helpers''',
    'description':
        '''To ensure visual consistency for spacing, padding, border radii, and other common UI values, and to make them easily updatable.''',
    'rules': [
      {
        'text':
            '''**Standard UI Constants File**: The file https://github.com/JohanScheepers/flutter_code_with_gemini/blob/main/lib/src/constants/ui_constants.dart will always be added to new projects and used as a primary source for UI constants.'''
      },
      {
        'text': '''**Dedicated Constants File**:
    *   I will create or use a dedicated file for UI constants, for example, `lib/src/constants/ui_constants.dart` or `lib/src/common/ui_helpers.dart`.'''
      },
      {
        'text': '''**Standard Spacing & Padding**:
    *   Define standard spacing values as `double` constants (e.g., `kSpaceSmall = 4.0`, `kSpaceMedium = 8.0`, `kSpaceLarge = 16.0`).
    *   Define standard padding `EdgeInsets` constants (e.g., `kPagePadding = EdgeInsets.all(16.0)`, `kHorizontalPaddingMedium = EdgeInsets.symmetric(horizontal: 8.0)`).
    *   These constants should be used throughout the application for `Padding` widgets, `SizedBox` dimensions, margins in `Container`s, etc., instead of magic numbers.'''
      },
      {
        'text': '''**Standard Border Radius**:
    *   Define standard `BorderRadius` constants (e.g., `kBorderRadiusSmall = BorderRadius.circular(4.0)`, `kCardBorderRadius = BorderRadius.circular(12.0)`).'''
      },
      {
        'text': '''**Reusable `SizedBox` Widgets (Theme Helpers)**:
    *   Consider creating `const SizedBox` instances for common fixed-size spacing (e.g., `const SizedBox kVerticalSpacerSmall = SizedBox(height: kSpaceSmall);`, `const SizedBox kHorizontalSpacerMedium = SizedBox(width: kSpaceMedium);`). These can make widget trees more readable.'''
      },
      {
        'text': '''**Other UI Constants**:
    *   This file can also be a home for other frequently used UI values like standard icon sizes (`kIconSizeSmall`, `kIconSizeMedium`), button heights (`kButtonHeight`), card elevations (`kCardElevationDefault`), or animation durations (`kShortAnimationDuration`).'''
      },
      {
        'text': '''**Naming Conventions**:
    *   Constants should follow clear naming conventions, often prefixed with `k` (e.g., `kPagePadding`) or be descriptive (e.g., `smallSpace`).'''
      },
      {
        'text': '''**Usage**:
    *   I will consistently import and use these constants in widget build methods to maintain uniformity across the app.'''
      },
    ],
  },
  {
    'section_title': '''README Generation Rules''',
    'description':
        '''When generating README.md files or similar documentation:''',
    'rules': [
      {
        'text':
            '''Always include a Table of Contents linking to major sections (`##` headings).'''
      },
      {
        'text': '''Add a `Back to Top` link at the end of each major section.'''
      },
      {'text': '''Use numbered lists for step-by-step instructions.'''},
      {
        'text':
            '''Use bullet points for lists of related items or options (like in the Table of Contents).'''
      },
      {
        'text':
            '''Format examples clearly, using markdown code blocks where appropriate.'''
      },
      {
        'text':
            '''Explain the purpose of a section before diving into details.'''
      },
      {
        'text':
            '''When providing setup instructions, include steps for both VS Code and Android Studio/IntelliJ IDEA if relevant.'''
      },
    ],
  },
];
