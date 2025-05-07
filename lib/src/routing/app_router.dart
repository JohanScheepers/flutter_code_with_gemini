import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_code_with_gemini/src/screens/home_page.dart';
import 'package:flutter_code_with_gemini/src/screens/rules_page.dart';
import 'package:flutter_code_with_gemini/src/screens/github_link_screen.dart'; // Import GithubLinkScreen

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: '/',
    debugLogDiagnostics: true, // Helpful for debugging
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        name: 'home',
        builder: (BuildContext context, GoRouterState state) {
          return const MyHomePage(title: 'Open GitHub Project');
        },
      ),
      GoRoute(
        path: '/rules',
        name: 'rules',
        builder: (BuildContext context, GoRouterState state) {
          return const RulesPage();
        },
      ),
      GoRoute(
        path: '/github',
        name: 'github',
        builder: (BuildContext context, GoRouterState state) {
          return const GithubLinkScreen();
        },
      ),
    ],
  );
}
