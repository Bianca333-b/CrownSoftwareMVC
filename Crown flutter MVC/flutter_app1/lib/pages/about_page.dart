// lib/pages/about_page.dart
import 'package:flutter/material.dart';
import '../widgets/nav_drawer.dart';

class AboutPage extends StatelessWidget {
  static const routeName = '/about';
  const AboutPage({Key? key}) : super(key: key);

  Widget _section(String title, String body) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 6),
          Text(body, style: const TextStyle(fontSize: 14)),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppNavDrawer(),
      appBar: AppBar(title: const Text('About')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            const Center(child: FlutterLogo(size: 86)),
            const SizedBox(height: 12),
            const Text(
              'GHFlutter Demo',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 12),
            _section(
              'Purpose',
              'A small demo app to showcase multiple pages, navigation, GitHub organization member listing and details.',
            ),
            _section(
              'Built With',
              'Flutter + Dart, simple http client for fetching GitHub org members.',
            ),
            _section(
              'How To Use',
              'Open Home to view members for the configured organization. Use the drawer to navigate between pages. Tap a user to view details.',
            ),
            const SizedBox(height: 10),
            const Divider(),
            const SizedBox(height: 8),
            const Text('Author', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 4),
            const Text(
              'This is an example/demo app produced for learning purposes.',
            ),
          ],
        ),
      ),
    );
  }
}
