import 'package:flutter/material.dart';
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
        const Text(
          'Flutter Code with Gemini',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const FlutterLogo(
              size: 80,
            ),
            const SizedBox(width: 20),
            Image.asset(
              'assets/images/gemini_logo.png',
              height: 80,
            ),
          ],
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            context.push('/rules');
          },
          child: const Text('View App & README Rules'),
        ),
        const SizedBox(height: 20),
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
        padding: const EdgeInsets.all(16.0), // Standard padding for narrow view
        child: _buildContent(context),
      ),
    );
  }

  Widget _buildWideLayout(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: 64.0, vertical: 32.0), // More horizontal padding
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
