import 'package:flutter/material.dart';
import '../constants/rules.dart' as app_rules;
import '../constants/ui_constants.dart' as ui_constants;

class RulesPage extends StatelessWidget {
  const RulesPage({super.key});

  /// Builds a single rule item, parsing for **bold** text.
  /// Applies different styling for sub-items.
  Widget _buildRuleItem(BuildContext context, String text,
      {bool isSubItem = false}) {
    final List<InlineSpan> spans = [];
    final RegExp exp = RegExp(r'[*]{2}(.*?)[*]{2}'); // Finds **bolded text**
    int currentIndex = 0;

    final textTheme = Theme.of(context).textTheme;
    final TextStyle defaultStyleForSpans =
        (isSubItem ? textTheme.bodySmall : textTheme.bodyMedium) ??
            const TextStyle(); // Fallback to default TextStyle

    for (final match in exp.allMatches(text)) {
      // Add text before the bold part (if any)
      if (match.start > currentIndex) {
        spans.add(TextSpan(text: text.substring(currentIndex, match.start)));
      }
      // Add the bold part (content within **).
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
        left: isSubItem
            ? ui_constants.kSizeMedium
            : ui_constants
                .kSizeSmall, // Was _kExtraLargePadding & _kMediumPadding
        top: ui_constants.kSizeXSmall, // Was _kSmallPadding
        bottom: ui_constants.kSizeXSmall, // Was _kSmallPadding
      ),
      child: RichText(
        text: TextSpan(
          style: defaultStyleForSpans,
          children: spans,
        ),
      ),
    );
  }

  /// Builds a styled code block with a monospace font and background.
  Widget _buildCodeBlockItem(BuildContext context, String codeText) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;
    return Container(
      margin: const EdgeInsets.symmetric(
          vertical: ui_constants.kSizeSmall), // Was _kMediumPadding
      padding:
          const EdgeInsets.all(ui_constants.kSizeSMedium), // Was _kLargePadding
      decoration: BoxDecoration(
        color: isDarkMode ? Colors.grey[850] : Colors.grey[200],
        borderRadius: BorderRadius.circular(4.0),
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Text(
          codeText.trim(),
          style: TextStyle(
            fontFamily: 'monospace',
            fontSize: Theme.of(context).textTheme.bodyMedium?.fontSize ??
                14.0, // Match bodyMedium size
            color: isDarkMode ? Colors.grey[300] : Colors.black87,
          ),
        ),
      ),
    );
  }

  /// Builds a list of widgets for a single rule's text,
  /// handling regular lines, sub-points, bolding, and code blocks.
  List<Widget> _buildWidgetsForRuleText(
      BuildContext context, String ruleFullText) {
    final List<Widget> widgets = [];
    final parts = ruleFullText.split('```'); // Split by triple backticks

    for (int i = 0; i < parts.length; i++) {
      String segment = parts[i];
      if (i % 2 == 1) {
        // Odd segments are code blocks
        if (segment.trim().isNotEmpty) {
          String codeContent = segment;
          // Language hint (e.g., ```dart) is part of the segment.
          // _buildCodeBlockItem will display it as is.
          widgets.add(_buildCodeBlockItem(context, codeContent));
        }
      } else {
        // Even segments are regular text (can be multi-line)
        if (segment.trim().isNotEmpty) {
          segment
              .split('\n')
              .where((line) => line.trim().isNotEmpty)
              .forEach((line) {
            final trimmedLine = line.trim();
            if (trimmedLine.startsWith('* ') || trimmedLine.startsWith('- ')) {
              widgets.add(_buildRuleItem(context, trimmedLine.substring(2),
                  isSubItem: true));
            } else {
              widgets.add(_buildRuleItem(context, trimmedLine));
            }
          });
        }
      }
    }
    return widgets;
  }

  /// Builds a Card widget for a section of app development rules.
  Widget _buildAppRuleSectionCard(
      BuildContext context, Map<String, dynamic> section) {
    final String title = section['section_title'] as String;
    final String description = section['description'] as String? ?? '';
    final List<Map<String, dynamic>> rulesList =
        List<Map<String, dynamic>>.from(section['rules'] as List);

    final textTheme = Theme.of(context).textTheme;

    return Card(
      margin: const EdgeInsets.only(
          bottom: ui_constants.kSizeMedium), // Was _kExtraLargePadding
      elevation: 2.0,
      child: Padding(
        padding: const EdgeInsets.all(
            ui_constants.kSizeSMedium), // Was _kLargePadding
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: textTheme.titleLarge?.copyWith(
                    // Using TextTheme
                    color: Theme.of(context).colorScheme.onSurface,
                    fontWeight: FontWeight.bold,
                  ) ??
                  const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 20), // Fallback
            ),
            if (description.isNotEmpty) ...[
              ui_constants.kXSmallVGap, // Was SizedBox(height: _kSmallPadding)
              Text(
                description,
                style: textTheme.bodyLarge?.copyWith(
                      fontStyle: FontStyle.italic,
                      color: textTheme.bodyMedium?.color?.withAlpha(
                          (0.75 * 255).round()), // Fixed: Used withAlpha
                    ) ??
                    const TextStyle(fontStyle: FontStyle.italic), // Fallback
              ),
            ],
            ui_constants.kSmallVGap, // Was SizedBox(height: _kMediumPadding)
            ...rulesList.expand((ruleMap) {
              final String ruleText = ruleMap['text'] as String;
              return _buildWidgetsForRuleText(context, ruleText);
            }),
          ],
        ),
      ),
    );
  }

  /// Builds a Card widget for the README generation rules section.
  Widget _buildReadmeRulesCard(
      BuildContext context, Map<String, dynamic> readmeRulesData) {
    final String readmeTitle =
        readmeRulesData['section_title'] as String? ?? 'README Rules';
    final String readmeDescription =
        readmeRulesData['description'] as String? ?? '';
    final List<dynamic>? readmeRulesListRaw = readmeRulesData['rules'] as List?;
    final List<Map<String, dynamic>> readmeRulesList =
        readmeRulesListRaw != null
            ? List<Map<String, dynamic>>.from(readmeRulesListRaw)
            : [];

    final List<Widget> readmeRuleWidgets = readmeRulesList.expand((ruleMap) {
      final String ruleText = ruleMap['text'] as String;
      return _buildWidgetsForRuleText(context, ruleText);
    }).toList();

    final textTheme = Theme.of(context).textTheme;

    return Card(
      margin: const EdgeInsets.only(
          bottom: ui_constants.kSizeMedium), // Was _kExtraLargePadding
      elevation: 2.0,
      child: Padding(
        padding: const EdgeInsets.all(
            ui_constants.kSizeSMedium), // Was _kLargePadding
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              readmeTitle,
              style:
                  textTheme.headlineSmall, // Consistent with overall page title
            ),
            if (readmeDescription.isNotEmpty) ...[
              ui_constants.kXSmallVGap, // Was SizedBox(height: _kSmallPadding)
              Text(
                readmeDescription,
                style: textTheme.bodyLarge?.copyWith(
                      fontStyle: FontStyle.italic,
                      color: textTheme.bodyMedium?.color?.withAlpha(
                          (0.75 * 255).round()), // Fixed: Used withAlpha
                    ) ??
                    const TextStyle(fontStyle: FontStyle.italic), // Fallback
              ),
            ],
            ui_constants.kSmallVGap, // Was SizedBox(height: _kMediumPadding)
            ...readmeRuleWidgets,
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> allRulesData =
        List<Map<String, dynamic>>.from(app_rules.rules);

    final List<Map<String, dynamic>> appDevelopmentRulesData = allRulesData
        .where((ruleSection) =>
            ruleSection['section_title'] != 'README Generation Rules')
        .toList();

    final Map<String, dynamic> readmeRulesData = allRulesData.firstWhere(
      (ruleSection) =>
          ruleSection['section_title'] == 'README Generation Rules',
      orElse: () => <String, dynamic>{},
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('App & README Rules'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: ListView(
        padding: ui_constants
            .kMediumPadding, // Was EdgeInsets.all(_kExtraLargePadding)
        children: <Widget>[
          Text(
            'Flutter App Development Guidelines',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          ui_constants.kMediumVGap, // Was SizedBox(height: _kExtraLargePadding)
          ...appDevelopmentRulesData.expand((section) {
            return [_buildAppRuleSectionCard(context, section)];
          }),
          if (readmeRulesData.isNotEmpty) ...[
            _buildReadmeRulesCard(context, readmeRulesData),
          ],
        ],
      ),
    );
  }
}
