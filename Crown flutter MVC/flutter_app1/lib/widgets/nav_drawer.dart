// lib/widgets/nav_drawer.dart
import 'package:flutter/material.dart';
import '../pages/about_page.dart';
import '../pages/home_page.dart';
import '../pages/profile_page.dart';
import '../pages/settings_page.dart';
import '../pages/details_page.dart';

class AppNavDrawer extends StatelessWidget {
  const AppNavDrawer({Key? key}) : super(key: key);

  Widget _tile(BuildContext context, String title, String route, IconData icon) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      onTap: () {
        Navigator.pop(context);
        if (ModalRoute.of(context)?.settings.name != route) {
          Navigator.pushReplacementNamed(context, route);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            DrawerHeader(
              child: Row(
                children: [
                  const CircleAvatar(radius: 36, child: Icon(Icons.person, size: 36)),
                  const SizedBox(width: 12),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text('GHFlutter Demo', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      SizedBox(height: 6),
                      Text('demo@example.com', style: TextStyle(fontSize: 12)),
                    ],
                  )
                ],
              ),
            ),
            _tile(context, 'Home', HomePage.routeName, Icons.home),
            _tile(context, 'Profile', ProfilePage.routeName, Icons.person),
            _tile(context, 'Details', DetailsPage.routeName, Icons.info),
            _tile(context, 'Settings', SettingsPage.routeName, Icons.settings),
            const Spacer(),
            ListTile(
              leading: const Icon(Icons.info_outline),
              title: const Text('About'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushReplacementNamed(context, AboutPage.routeName);
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Exit'),
              onTap: () => Navigator.pop(context),
            ),
          ],
        ),
      ),
    );
  }
}
