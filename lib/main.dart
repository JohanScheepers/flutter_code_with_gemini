import 'package:flutter/material.dart';
import 'package:flutter_code_with_gemini/src/screens/home_page.dart'; // Import the new home page

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
      debugShowCheckedModeBanner: false, // Hide the debug banner
      theme: ThemeData(
        // Reverted from const
        colorScheme: ColorScheme.fromSeed(
            // Reverted from const
            seedColor: Colors.blue), // You can choose any color
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Open GitHub Project'),
      // routes: { // Named routes were added
      //   '/rules': (context) => const RulesPage(),
      // },
    );
  }
}
