import 'package:flutter/material.dart';

class RulesPage extends StatelessWidget {
  const RulesPage({super.key});

  // Helper to build rule items, now parsing for **bold** text
  Widget _buildRuleItem(BuildContext context, String text,
      {bool isSubItem = false}) {
    final List<InlineSpan> spans = [];
    // Use character class for literal asterisk to potentially avoid linter warning
    final RegExp exp =
        RegExp(r'[*]{2}(.*?)[*]{2}'); // Regex to find **bolded text**
    int currentIndex = 0;

    final TextStyle defaultStyleForSpans = TextStyle(
      fontSize: isSubItem ? 14 : 15,
      color: Colors.black, // Set text color to black for rule items
    );

    for (final match in exp.allMatches(text)) {
      // Add text before the bold part (if any)
      if (match.start > currentIndex) {
        spans.add(TextSpan(text: text.substring(currentIndex, match.start)));
      }
      // Add the bold part (content within **).
      // This TextSpan will inherit fontSize and color from defaultStyleForSpans,
      // and specifically override fontWeight.
      spans.add(TextSpan(
        text: match.group(1), // group(1) is the content *inside* **...**
        style: const TextStyle(fontWeight: FontWeight.bold),
      ));
      currentIndex = match.end;
    }

    // Add any remaining text after the last bold part
    if (currentIndex < text.length) {
      spans.add(TextSpan(text: text.substring(currentIndex)));
    }

    return Padding(
      padding: EdgeInsets.only(
        left: isSubItem ? 16.0 : 8.0,
        top: 4.0,
        bottom: 4.0,
      ),
      child: RichText(
        textAlign: TextAlign.left, // Ensure text aligns left
        text: TextSpan(
          style: defaultStyleForSpans, // Base style for all children
          children: spans,
        ),
      ),
    );
  }

  // Helper to build sub-points from a string with bullet points
  List<Widget> _buildSubPoints(BuildContext context, String textBlock) {
    return textBlock
        .split('\n')
        .where((line) => line.trim().isNotEmpty)
        .map((line) {
      final trimmedLine = line.trim();
      if (trimmedLine.startsWith('* ') || trimmedLine.startsWith('- ')) {
        return _buildRuleItem(context, trimmedLine.substring(2),
            isSubItem: true);
      }
      return _buildRuleItem(context, trimmedLine);
    }).toList();
  }

  // New reusable widget for ExpansionTiles
  Widget _buildRuleExpansionTile(
      BuildContext context, String title, String content) {
    return ExpansionTile(
      title: Text(title,
          style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold)), // Title to black and bold
      expandedCrossAxisAlignment: CrossAxisAlignment.start,
      children: _buildSubPoints(context, content),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'App & README Rules',
          style: TextStyle(color: Colors.black), // AppBar title to black
        ),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: <Widget>[
          Text(
            'Flutter App Development Guidelines',
            style: Theme.of(context)
                .textTheme
                .headlineSmall
                ?.copyWith(color: Colors.black), // Section title to black
          ),
          const SizedBox(height: 16.0),
          _buildRuleExpansionTile(context, '1. Project Setup & Structure', '''
              1.  **Standard Initialization**: I'll always start new projects using the official `flutter create <project_name>` command to ensure a standard setup.
              2.  **Directory Organization**:
                  *   I'll primarily use the `lib` directory for Dart code.
                  *   Within `lib`, directory organization will be done by layers (e.g., `lib/src/widgets/`, `lib/src/models/`, `lib/src/services/`).
                  *   Assets will be placed in a top-level `assets` directory and declared in `pubspec.yaml`. Specific asset types will be organized into subdirectories: `assets/images/` for images, `assets/fonts/` for fonts, and other types in their respective named subdirectories (e.g., `assets/data/` for data files, `assets/rive/` for Rive animations).
                  *   Tests will reside in the `test` directory.
              3.  **Naming Conventions**:
                  *   File names will be in `snake_case.dart` (e.g., `user_profile_screen.dart`).
                  *   Directories will also be in `snake_case`.
                  *   Class names, enums, and typedefs will be in `UpperCamelCase`.
                  *   Variables, methods, and parameters will be in `lowerCamelCase`.
                  *   Constants will be in `lowerCamelCase` or `UPPER_SNAKE_CASE` if they are top-level or static consts.
              4.  **Debug Banner**:
                  *   The debug banner (`debugShowCheckedModeBanner`) will typically be set to `false` in the `MaterialApp` widget for a cleaner appearance during development and for production builds.
            '''),
          _buildRuleExpansionTile(context, '2. Coding Standards & Style', '''
              1.  **Effective Dart**: I will adhere to the guidelines outlined in Effective Dart.
              2.  **Linting**: I'll use `flutter analyze` and strive to eliminate all warnings and errors. I'll assume a standard set of linting rules (e.g., from the `lints` or `flutter_lints` package).
              3.  **Formatting**: All Dart code will be formatted using `dart format` to ensure consistent styling.
              4.  **Readability**:
                  *   I'll use meaningful names for variables, functions, and classes.
                  *   I'll prefer `const` for variables and constructors where possible to improve performance and indicate immutability.
                  *   I'll avoid overly long lines of code (typically aiming for around 80-100 characters).
                  *   Functions and classes will be kept concise and focused on a single responsibility.
              5.  **Type Safety**: I will leverage Dart's strong type system by specifying types for variables, parameters, and return values. I'll use `dynamic` sparingly and only when necessary.
            '''),
          _buildRuleExpansionTile(context, '3. Widget Design & Composition', '''
              1.  **Modularity**: I'll break down complex UIs into smaller, reusable widgets. Each widget will have a clear purpose.
              2.  **Stateless vs. Stateful**:
                  *   I'll prefer `StatelessWidget` whenever a widget doesn't need to manage internal, mutable state.
                  *   `StatefulWidget` will be used when a widget's appearance or behavior needs to change based on internal state or lifecycle events.
              3.  **`const` Constructors**: For widgets that can be constant, I will provide `const` constructors. This is crucial for performance optimizations.
              4.  **Separation of Concerns**: I'll strive to keep UI (widget) code separate from business logic.
              5.  **Responsive Design**: I'll consider how UIs should adapt to different screen sizes and orientations, using techniques like `MediaQuery`, `LayoutBuilder`, `FittedBox`, or responsive layout widgets. I will keep `MediaQuery` to the absolute minimum, and it will be kept as close to where it is needed in the widget tree.
              6.  **Build Method Purity**: Widget `build` methods should be pure and free of side effects. They should describe the UI based on the current state and props.
              7.  **User Preferences & Accessibility Settings**: I will strive to build UIs that respect and adapt to user-defined preferences (e.g., theme choices, font sizes) and accessibility settings configured on their device (e.g., screen reader compatibility, larger text).
              8.  **Widget Sourcing & Preferences**: Preference will be given to Flutter's built-in widgets. In cases where I need widgets from `pub.dev`, the frequency of updates and whether the package is well-maintained will be considered first. For charts, preference will be given to the nimble_charts package.
            '''),
          _buildRuleExpansionTile(context, '4. Theming', '''
              1.  **Centralized Theme**: Define app-wide themes (`ThemeData`) centrally in `MaterialApp`, including `ColorScheme` and `TextTheme`.
              2.  **Contextual Access**: Always access theme properties via `Theme.of(context)` (e.g., `Theme.of(context).colorScheme.primary`) instead of hardcoding values.
              3.  **Color Palette Strategy**:
                  *   **Brand Alignment**: The color palette should align with the brand identity, using primary and secondary brand colors effectively.
                  *   **Proactive Inquiry**: If a specific color palette or seed color is not provided by you, I will ask clarifying questions to help define it. This includes inquiring about primary/secondary brand colors, desired mood (e.g., vibrant, muted, professional), and any specific accessibility contrast requirements you might have.
                  *   **ColorScheme Usage**: Utilize `ColorScheme.fromSeed` for generating harmonious light and dark color schemes from a single seed color. For more granular control, define `ColorScheme` properties explicitly.
                  *   **Semantic Colors**: Consistently use semantic colors provided by `ColorScheme` (e.g., `primary`, `secondary`, `surface`, `background`, `error`, `onPrimary`, `onSecondary`, etc.) for UI elements and states.
                  *   **Contrast & Harmony**: Employ color theory principles and tools (e.g., Adobe Color, Coolors) to ensure the palette is visually harmonious. Crucially, verify that color combinations provide sufficient contrast for readability and meet accessibility standards (e.g., WCAG AA or AAA levels).
                  *   **Limited Palette**: Prefer a limited and well-defined color palette (e.g., 3-5 primary/accent colors plus neutrals) to maintain visual consistency and avoid overwhelming the user.
              4.  **Dark Mode & Theme Selection**:
                  *   Implement dark mode support by providing both `theme` (for light mode) and `darkTheme` in `MaterialApp`.
                  *   The app should allow users to select their preferred theme mode (e.g., Light, Dark, or System default) through a clear user interface element (like a toggle in settings).
                  *   The user's theme preference should be persisted across app sessions (e.g., using `shared_preferences`).
                  *   Manage the active `ThemeMode` and theme switching logic through a dedicated service or state management solution (e.g., a `ThemeManager` class using `ChangeNotifier`).
              5.  **Custom Extensions**: For app-specific styling that doesn't fit neatly into standard `ThemeData` properties (e.g., custom button styles, specific spacing values), use `ThemeExtension<T>` for better organization and type-safe access.
              6.  **Consistency**: Apply all theming elements (colors, typography, component styles, spacing) consistently across the entire application to create a cohesive user experience.
              7.  **Accessibility (Reiteration)**: Beyond color contrast, ensure that typography choices (font family, size, weight) are legible and that theme changes do not negatively impact other accessibility features.
            '''),
          _buildRuleExpansionTile(context, '5. State Management', '''
              1.  **Appropriate Solution**:
                  *   Before implementing state management, I will ask: "Is this a simple or complex app? Option 1: Simple, Option 2: Complex."
                  *   If you select **Option 1 (Simple)**: I will use `setState` for managing simple, local widget state.
                  *   If you select **Option 2 (Complex)**: I will use Riverpod for more comprehensive state management needs.
              2.  **Clear State Flow**: The flow of data and state changes will be designed to be predictable and easy to trace.
              3.  **Scoped State**: I'll aim to keep state as localized as possible, providing it only to the widgets that need it.
              4.  **Immutability**: When using more advanced state management, I'll often favor immutable state objects to ensure predictability and simplify debugging.
            '''),
          _buildRuleExpansionTile(
              context, '6. Asynchronous Operations & Error Handling', '''
              1.  **`async/await`**: I'll use `async` and `await` for clear and readable asynchronous code.
              2.  **Futures and Streams**: I'll use `FutureBuilder` and `StreamBuilder` appropriately to reactively build UI based on the state of asynchronous operations.
              3.  **Loading States**: I'll ensure UIs provide feedback during asynchronous operations (e.g., loading indicators).
              4.  **Error Handling**:
                  *   I'll use `try-catch` blocks to handle potential exceptions in asynchronous code.
                  *   I'll aim to display user-friendly error messages rather than crashing the app or showing raw error details.
                  *   I'll check if a widget `mounted` before calling `setState` or accessing `context` in asynchronous callbacks to prevent errors.
            '''),
          _buildRuleExpansionTile(context, '7. Navigation', '''
              1.  **Named Routes**: I'll prefer using named routes (`Navigator.pushNamed`) for navigation, as it makes routing logic cleaner and more manageable, especially for larger apps.
                  *   Example: `Navigator.pushNamed(context, '/profile');`
              2.  **Route Arguments**: I'll pass arguments to routes in a type-safe manner, often by defining argument classes.
              3.  **Routing Strategy & Packages**: Before implementing routing, I will prompt: "What routing to use? Option 1: `go_router`, Option 2: `Navigator.pushNamed`."
                  *   If **Option 1 (`go_router`)** is selected, I will use the `go_router` package. This is particularly recommended for applications with complex navigation requirements (e.g., deep linking, nested routing).
                  *   If **Option 2 (`Navigator.pushNamed`)** is selected, I will use named routes as described in point 1 ("Named Routes") above.
            '''),
          _buildRuleExpansionTile(context, '8. Dependencies & Packages', '''
              1.  **Judicious Use**: I'll only add packages from `pub.dev` when they provide significant value and are well-maintained.
              2.  **Version Pinning**: I'll specify dependency versions in `pubspec.yaml` carefully, often using caret syntax (e.g., `^1.2.3`) to allow compatible updates while ensuring stability.
              3.  **Up-to-Date**: I'll try to use recent, stable versions of packages.
              4.  **Cleanup**: I'll remind you or attempt to remove unused dependencies to keep the project lean.
            '''),
          _buildRuleExpansionTile(context, '9. Testing', '''
              1.  **Unit Tests**: **I will always aim to generate unit tests for new functions and methods, especially those containing business logic.**
                  *   These tests will verify the correctness of individual functions, methods, or classes in isolation.
                  *   I'll use the `test` package.
              2.  **Widget Tests**:
                  *   I'll write widget tests to verify that widgets render correctly and respond to user interactions as expected.
                  *   I'll use the `flutter_test` package.
              3.  **Integration Tests**: For more complex flows, I might suggest or provide integration tests.
              4.  **Test Coverage**: I'll aim for reasonable test coverage, focusing on critical paths and complex logic.
              5.  **Mocking**: I'll use mocking (e.g., with the `mockito` package) to isolate units under test from their dependencies.
            '''),
          _buildRuleExpansionTile(context, '10. Performance', '''
              1.  **Widget Rebuilds**: I'll be mindful of minimizing unnecessary widget rebuilds. This includes:
                  *   Using `const` widgets wherever possible.
                  *   Breaking down large widgets.
                  *   Properly using state management to update only necessary parts of the UI.
              2.  **`ListView.builder`**: For long lists, I'll always use `ListView.builder` (or similar constructors like `GridView.builder`) for performance.
              3.  **Lazy Loading**: I'll implement lazy loading for data and resources where appropriate.
              4.  **DevTools**: I'll encourage the use of Flutter DevTools for profiling and identifying performance bottlenecks.
              5.  **Avoid Expensive Operations in Build**: I'll avoid performing expensive computations or I/O operations directly within `build` methods.
            '''),
          _buildRuleExpansionTile(
              context, '11. Code Documentation & Comments', '''
              1.  **Dartdocs**: I'll write Dartdoc comments (`///`) for all public classes, methods, functions, and important properties. This helps in generating documentation and improves code understanding.
              2.  **Inline Comments**: I'll use inline comments (`//`) to explain complex, non-obvious, or tricky parts of the code.
              3.  **Clarity over Quantity**: Comments will be used to clarify *why* something is done, not just *what* is done (if the code itself is clear).
              4.  **Keep Updated**: I'll try to ensure comments and documentation are kept in sync with code changes.
            '''),
          _buildRuleExpansionTile(context, '12. Security Considerations', '''
              1.  **Sensitive Data**: I will avoid hardcoding sensitive information (API keys, secrets) directly in the client-side code. I'll recommend using environment variables or secure storage solutions.
              2.  **Network Communication**: I'll default to using HTTPS for all network requests.
              3.  **Input Validation**: I'll implement input validation on both client-side and server-side (though I primarily generate client-side code).
              4.  **Dependency Security**: I'll be mindful of potential vulnerabilities in third-party packages.
              5.  **Local Storage**: When using local storage (e.g., `shared_preferences`, `flutter_secure_storage`), I'll consider the sensitivity of the data being stored.
            '''),
          _buildRuleExpansionTile(context, '13. User Experience (UX) Focus', '''
              1.  **Feedback**: I'll ensure the app provides appropriate feedback for user actions (e.g., taps, loading states, success/error messages).
              2.  **Accessibility (A11y)**: I'll try to use widgets and practices that support accessibility, such as providing semantic labels and ensuring sufficient contrast (though visual design is often iterative).
              3.  **Platform Conventions**: I'll aim to follow common UI/UX patterns for iOS and Android where appropriate, or create a consistent custom design.
              4.  **Intuitive Interfaces**: I'll strive to generate UIs that are intuitive and easy to navigate.
            '''),
          _buildRuleExpansionTile(context, '14. Version Control Practices', '''
              1.  **`.gitignore`**: I'll assume a standard Flutter `.gitignore` file is in use to exclude unnecessary files from version control.
              2.  **Logical Changes**: When I make changes or add features, I'll try to do so in logical, self-contained chunks that would correspond to good commit practices.
            '''),
          _buildRuleExpansionTile(context, '15. Continuous Improvement', '''
              1.  **Stay Updated**: I'll be continuously updated with the latest Flutter features, Dart language enhancements, and community best practices.
              2.  **Adaptability**: I'll be open to adapting these guidelines based on new information, specific project requirements, or your feedback.
            '''),
          const SizedBox(height: 16.0),
          Text(
            'README Generation Rules',
            style: Theme.of(context)
                .textTheme
                .headlineSmall
                ?.copyWith(color: Colors.black), // Section title to black
          ),
          const SizedBox(height: 8.0),
          ..._buildSubPoints(context, '''
            1.  Always include a Table of Contents linking to major sections (`##` headings).
            2.  Add a `Back to Top` link at the end of each major section.
            3.  Use numbered lists for step-by-step instructions.
            4.  Use bullet points for lists of related items or options (like in the Table of Contents).
            5.  Format examples clearly, using markdown code blocks where appropriate.
            6.  Explain the purpose of a section before diving into details.
            7.  When providing setup instructions, include steps for both VS Code and Android Studio/IntelliJ IDEA if relevant.
          '''),
        ],
      ),
    );
  }
}
