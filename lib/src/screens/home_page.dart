import 'package:flutter/material.dart';
import 'package:flutter_code_with_gemini/src/constants/ui_constants.dart'; // Corrected import path
import 'package:go_router/go_router.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static const double kBreakpoint = 600.0; // Breakpoint for switching layouts

  Widget _buildContent(BuildContext context) {
    // This Column contains all the main content of your home page.
    // It's extracted here to be reused by both narrow and wide layouts.
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          'Flutter Code with Gemini',
          style: kLargeHeadline.copyWith(
              fontWeight: FontWeight.bold), // Used headlineLarge (fontSize 24)
        ),
        kMediumVGap, // Was kVerticalSpacerMedium (16.0), now xxsmallVGap (16.0)
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FlutterLogo(
              size: kX3LargeIconSize, // Was 80, now xlargeIconSize (80.0)
            ),
            kMediumHGap, // Was kHorizontalSpacerMedium (16.0), now xsmallHGap (16.0)
            Image.asset(
              'assets/images/gemini_logo.png',
              height: kX3LargeIconSize, // Was 80, now xlargeIconSize (80.0)
            ),
          ],
        ),
        kMediumVGap, // Was kVerticalSpacerMedium (16.0), now xxsmallVGap (16.0)
        ElevatedButton(
          onPressed: () {
            context.push('/rules');
          },
          child: const Text('View App & README Rules'),
        ),
        kMediumVGap, // Was kVerticalSpacerMedium (16.0), now xxsmallVGap (16.0)
        ElevatedButton(
          onPressed: () {
            context.push('/github');
          },
          child: const Text('View GitHub Link Page'),
        ),
      ],
    );
  }

  Widget _buildNarrowLayout(BuildContext context) {
    return Center(
      child: Padding(
        padding:
            kMediumPadding, // Was kPagePadding (16.0), now mediumPadding (16.0)
        child: _buildContent(context),
      ),
    );
  }

  Widget _buildWideLayout(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(
            // horizontal: 64.0, vertical: 32.0
            horizontal: kXXXLargePadding.left,
            vertical: kXLargePadding.top),
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
