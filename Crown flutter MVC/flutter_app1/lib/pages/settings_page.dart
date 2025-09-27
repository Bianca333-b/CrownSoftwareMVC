// lib/pages/settings_page.dart
import 'package:flutter/material.dart';
import '../widgets/nav_drawer.dart';

class SettingsPage extends StatefulWidget {
  static const routeName = '/settings';
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _darkMode = false;
  bool _notifications = true;
  double _listItemDensity = 1.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppNavDrawer(),
      appBar: AppBar(title: const Text('Settings')),
      body: ListView(
        padding: const EdgeInsets.all(12),
        children: [
          SwitchListTile(
            title: const Text('Dark Mode'),
            value: _darkMode,
            onChanged: (v) => setState(() => _darkMode = v),
            secondary: const Icon(Icons.dark_mode),
          ),
          SwitchListTile(
            title: const Text('Notifications'),
            subtitle: const Text('Enable push-style notifications (demo)'),
            value: _notifications,
            onChanged: (v) => setState(() => _notifications = v),
            secondary: const Icon(Icons.notifications_active),
          ),
          const SizedBox(height: 8),
          ListTile(
            leading: const Icon(Icons.format_size),
            title: const Text('List density'),
            subtitle: Slider(
              value: _listItemDensity,
              min: 0.6,
              max: 1.6,
              divisions: 10,
              label: _listItemDensity.toStringAsFixed(1),
              onChanged: (v) => setState(() => _listItemDensity = v),
            ),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.restore),
            title: const Text('Reset to defaults'),
            onTap: () {
              setState(() {
                _darkMode = false;
                _notifications = true;
                _listItemDensity = 1.0;
              });
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Settings reset (demo)')),
              );
            },
          ),
        ],
      ),
    );
  }
}
