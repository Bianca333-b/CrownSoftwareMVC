// lib/main.dart
import 'package:flutter/material.dart';
import 'pages/home_page.dart';
import 'pages/about_page.dart';
import 'pages/profile_page.dart';
import 'pages/settings_page.dart';
import 'pages/details_page.dart';

void main() {
  runApp(const GHFlutterDemoApp());
}

class GHFlutterDemoApp extends StatelessWidget {
  const GHFlutterDemoApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GHFlutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: HomePage.routeName,
      routes: {
        HomePage.routeName: (_) => const HomePage(),
        AboutPage.routeName: (_) => const AboutPage(),
        ProfilePage.routeName: (_) => const ProfilePage(),
        SettingsPage.routeName: (_) => const SettingsPage(),
        DetailsPage.routeName: (_) => const DetailsPage(),
      },
    );
  }
}
