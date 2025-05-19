import 'package:flutter/material.dart';
import 'package:flutter_code_with_gemini/src/constants/ui_constants.dart'; // Import AppConstants
import 'package:flutter_code_with_gemini/src/constants/text_styles.dart'; // Import Text Styles
import 'package:flutter_code_with_gemini/main.dart';
import 'package:go_router/go_router.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static const double kBreakpoint = 600.0;

  @override
  void initState() {
    super.initState();
    // Listen to theme changes to rebuild the icon.
    themeNotifier.addListener(_onThemeModeChanged);
  }

  @override
  void dispose() {
    themeNotifier.removeListener(_onThemeModeChanged);
    super.dispose();
  }

  void _onThemeModeChanged() {
    if (mounted) setState(() {});
  }

  /// This Column contains all the main content of your home page.
  /// It's extracted here to be reused by both narrow and wide layouts.
  Widget _buildContent(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          'Flutter Code with Gemini',
          style:
              AppTextStyle.kLargeHeadline.copyWith(fontWeight: FontWeight.bold),
        ),
        kMediumVGap,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FlutterLogo(size: kX3LargeIconSize),
            kMediumHGap,
            Image.asset('assets/images/gemini_logo.png',
                height: kX3LargeIconSize),
          ],
        ),
        kMediumVGap,
        ElevatedButton(
          onPressed: () {
            context.push('/rules');
          },
          child: const Text('View App & README Rules'),
        ),
        kMediumVGap,
        ElevatedButton(
          onPressed: () {
            context.push('/github');
          },
          child: const Text('View GitHub Link Page'),
        ),
        kMediumVGap,
        Text(
          'Disclaimer: This app was created with the assistance of Gemini.',
          style: Theme.of(context).textTheme.bodySmall,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildNarrowLayout(BuildContext context) {
    return Center(
      child: Padding(
        padding: kMediumPadding,
        child: _buildContent(context),
      ),
    );
  }

  Widget _buildWideLayout(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: kXXXLargePadding.left, vertical: kXLargePadding.top),
        child: ConstrainedBox(
          constraints:
              const BoxConstraints(maxWidth: 700), // Max width for content
          child: _buildContent(context),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        actions: [
          ValueListenableBuilder<ThemeMode>(
            valueListenable: themeNotifier,
            builder: (_, ThemeMode currentMode, __) {
              bool isCurrentlyDark;
              if (currentMode == ThemeMode.system) {
                isCurrentlyDark =
                    MediaQuery.platformBrightnessOf(context) == Brightness.dark;
              } else {
                isCurrentlyDark = currentMode == ThemeMode.dark;
              }
              return IconButton(
                icon: Icon(
                  isCurrentlyDark ? Icons.light_mode : Icons.dark_mode,
                ),
                tooltip: isCurrentlyDark
                    ? 'Switch the Lights On'
                    : 'Switch the Lights Off',
                onPressed: () {
                  if (isCurrentlyDark) {
                    themeNotifier.value = ThemeMode.light;
                  } else {
                    themeNotifier.value = ThemeMode.dark;
                  }
                },
              );
            },
          ),
        ],
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          if (constraints.maxWidth < kBreakpoint) {
            return _buildNarrowLayout(context);
          } else {
            return _buildWideLayout(context);
          }
        },
      ),
    );
  }
}
