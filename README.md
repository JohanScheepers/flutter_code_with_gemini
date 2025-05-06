# flutter_code_with_gemini

A Flutter project demonstrating how to add custom context or rules to Google's Gemini Code Assist to tailor its code generation and assistance within your development workflow.

## Getting Started

To use this project effectively or apply these concepts, you first need to install Gemini Code Assist in your IDE.

1.  **Open your IDE:** This will likely be Visual Studio Code (VS Code) or Android Studio/IntelliJ IDEA.
2.  **Navigate to Extensions/Plugins:**
    *   **VS Code:** Click the Extensions icon in the Activity Bar (usually on the left, looks like square blocks) or press `Ctrl+Shift+X` (`Cmd+Shift+X` on macOS).
    *   **Android Studio/IntelliJ:** Go to `File` > `Settings` (or `Android Studio` > `Preferences` on macOS), then select `Plugins`. Make sure you're on the `Marketplace` tab.
3.  **Search for Gemini:** Type `Gemini Code Assist` or `Google Gemini` in the search bar.
4.  **Install:** Find the official extension/plugin by Google and click "Install".
5.  **Reload/Restart (if needed):** Your IDE might prompt you to reload or restart.
6.  **Sign In:** After installation, follow the prompts to sign in with your Google account to activate Gemini Code Assist.

Once installed and activated, Gemini is ready to help!

## Rules

You can guide Gemini's behavior by providing persistent instructions or "rules" that it will consider for every request you make. This helps ensure consistency and adherence to your project's specific standards or your personal preferences.

Here's how to add custom rules (steps shown for VS Code, may vary slightly in other IDEs):

1.  **Open the Gemini Quick Pick:** While in a code file, press `Ctrl+I` (Windows/Linux) or `Cmd+I` (macOS).
2.  **Access Settings:** In the menu that appears, search for and select `Preferences: Open Settings (UI)`.
3.  **Find the Rules Setting:** In the Settings UI search bar, enter `Gemini Code Assist: Rules` (or similar, depending on the exact extension naming).
4.  **Add Your Rule(s):** In the text input field provided for the rules, enter your instructions. You can add multiple rules, often one per line.

    *Example Rule:*
    ```
    Always generate unit tests when creating a new function.
    ```

After adding rules in the Rules settings, Gemini Code Assist considers the rule for every prompt or request you make.

To remove the rule, delete the content from the Rules text field.