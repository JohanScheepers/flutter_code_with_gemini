import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart'; // Import url_launcher

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'flutter_code_with_gemini',
      debugShowCheckedModeBanner: false, // Add this line
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.blue), // You can choose any color
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Open GitHub Project'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final String _urlToLaunch =
      'https://github.com/JohanScheepers/flutter_code_with_gemini';

  Future<void> _launchURL() async {
    final Uri url = Uri.parse(_urlToLaunch);
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      // Show an error message if the URL can't be launched
      if (mounted) {
        // Check if the widget is still in the tree
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Could not launch $_urlToLaunch')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Flutter Code with Gemini', // Add a title
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20), // Add some spacing
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const FlutterLogo(
                  size: 80, // You can adjust the size as needed
                ),
                const SizedBox(width: 20), // Spacing between logos
                Image.asset(
                  'assets/images/gemini_logo.png', // Path to your Gemini logo
                  height: 80, // Adjust height as needed
                ),
              ],
            ),
            const SizedBox(height: 20), // Add some spacing
            const Text(
              'Click the button below to open the\nFlutter Code with Gemini project on GitHub:',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _launchURL,
              child: const Text('Open Project on GitHub'),
            ),
          ],
        ),
      ),
    );
  }
}
