# flutter_code_with_gemini

![Flutter Code with Gemini App](assets/gif/flutter_code_with_gemini.gif)

This project leverages Google's Gemini Code Assist. Learn more about writing code with Gemini from the [official documentation](https://cloud.google.com/gemini/docs/codeassist/write-code-gemini).

A Flutter project demonstrating how to add MCP server and rules to Google's Gemini Code Assist to tailor its code generation and assistance within your development workflow.

## Table of Contents

- [Getting Started](#getting-started)
- [MCP Server](#mcp-server)
- [Rules](#rules)
- [Gemini's Flutter App Development Guidelines](gemini_flutter_rules.md)


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

[Back to Top](#flutter_code_with_gemini)

## MCP Server

To add a MAP server to the project you need to follow these steps:

1. Add folder **.gemini** in the main project structure.
2. Add file **settings.json**.
3. Add the MCP server settings to the settings.json
```
{
  "mcpServers": {
    "dart": {
      "command": "dart",
      "args": [
        "mcp-server"
      ]
    }
  }
}
```

## Rules

You can guide Gemini's behavior by providing persistent instructions or "rules" that it will consider for every request you make. This helps ensure consistency and adherence to your project's specific standards or your personal preferences.

Here's how to add custom rules

1.  **Navigate to**:  `C:\Users\[uasername]\.gemini`
2.  **Add:** In the directory `C:\Users\[uasername]\.gemini` add `GEMINI.md`
3.  **Add Your Rule(s):** In the `GEMINI.md` add the rules, or enter your instructions. You can add multiple rules, often one per line.

    *Example Rule:*
    ```
    Always generate unit tests when creating a new function.
    ```

After adding rules in the Rules settings, Gemini Code Assist considers the rule for every prompt or request you make.

To remove the rule, delete the content from the Gemini Code Assist: `GEMINI.md`


For detailed coding and project guidelines, please refer to the [Gemini Code Assist Rules](./gemini_code_assist_rules.txt). These are the style and structure I prefer for my project. Please amend as needed for your project.




[Back to Top](#flutter_code_with_gemini)
