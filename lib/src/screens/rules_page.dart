import 'package:flutter/material.dart';
import '../constants/rules.dart' as app_rules; // Import your rules data

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
      // Use the theme's default body text color
      color: Theme.of(context).textTheme.bodyMedium?.color,
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

  @override
  Widget build(BuildContext context) {
    // Cast the dynamic rules to a more specific type for easier handling
    final List<Map<String, dynamic>> allRulesData =
        List<Map<String, dynamic>>.from(app_rules.rules);

    // Separate README rules from other app rules
    final List<Map<String, dynamic>> appDevelopmentRulesData = allRulesData
        .where((ruleSection) =>
            ruleSection['section_title'] != 'README Generation Rules')
        .toList();

    final Map<String, dynamic> readmeRulesData = allRulesData.firstWhere(
      (ruleSection) =>
          ruleSection['section_title'] == 'README Generation Rules',
      orElse: () => <String, dynamic>{}, // Return an empty map if not found
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'App & README Rules', // AppBar title will use AppBarTheme
        ),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: <Widget>[
          Text(
            'Flutter App Development Guidelines',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 16.0),
          // Generate Cards for app development rules
          ...appDevelopmentRulesData.expand((section) {
            final String title = section['section_title'] as String;
            final String description =
                section['description'] as String? ?? ''; // Get description
            final List<Map<String, dynamic>> rulesList =
                List<Map<String, dynamic>>.from(section['rules'] as List);
            final String content =
                rulesList.map((rule) => rule['text'] as String).join('\n');

            // Wrap each rule set in a Card
            return [
              Card(
                margin: const EdgeInsets.only(bottom: 16.0),
                elevation: 2.0, // Adjust elevation as needed
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onSurface,
                          fontWeight: FontWeight.bold,
                          fontSize: 18, // A bit larger for section titles
                        ),
                      ),
                      if (description.isNotEmpty) ...[
                        const SizedBox(height: 4.0),
                        Text(
                          description,
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
                      const SizedBox(height: 8.0), // Space before rule points
                      ..._buildSubPoints(context, content),
                    ],
                  ),
                ),
              ),
            ];
          }).toList(),

          // Handle README rules section
          if (readmeRulesData.isNotEmpty) ...[
            Builder(builder: (context) {
              // Use Builder to access context for theme
              final String readmeTitle =
                  readmeRulesData['section_title'] as String? ?? 'README Rules';
              final String readmeDescription =
                  readmeRulesData['description'] as String? ?? '';
              final rulesList = readmeRulesData['rules'] as List?;
              String readmeContent = '';
              if (rulesList != null && rulesList.isNotEmpty) {
                readmeContent = List<Map<String, dynamic>>.from(rulesList)
                    .map((rule) => rule['text'] as String)
                    .join('\n');
              }

              return Card(
                margin: const EdgeInsets.only(bottom: 16.0),
                elevation: 2.0,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        readmeTitle,
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      if (readmeDescription.isNotEmpty) ...[
                        const SizedBox(height: 4.0),
                        Text(
                          readmeDescription,
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
                      const SizedBox(height: 8.0),
                      if (readmeContent.isNotEmpty)
                        ..._buildSubPoints(context, readmeContent),
                    ],
                  ),
                ),
              );
            })
          ],
        ],
      ),
    );
  }
}
