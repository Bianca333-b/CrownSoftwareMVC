// lib/pages/details_page.dart
import 'package:flutter/material.dart';
import '../models/user.dart';
import '../widgets/nav_drawer.dart';

class DetailsPage extends StatelessWidget {
  static const routeName = '/details';
  const DetailsPage({Key? key}) : super(key: key);

  Widget _buildRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          SizedBox(
            width: 120,
            child: Text(
              '$title:',
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
          Expanded(child: Text(value)),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final arg = ModalRoute.of(context)?.settings.arguments;
    UserModel? user;
    if (arg is UserModel) user = arg;

    return Scaffold(
      drawer: const AppNavDrawer(),
      appBar: AppBar(title: const Text('Member Details')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: user == null
            ? const Center(
                child: Text('No details available. Tap a user from Home.'),
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 42,
                        backgroundImage: NetworkImage(user.avatarUrl),
                      ),
                      const SizedBox(width: 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            user.login,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(user.type),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  _buildRow('GitHub URL', user.htmlUrl),
                  _buildRow('ID', user.id.toString()),
                  const SizedBox(height: 18),
                  const Text(
                    'Quick actions',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 8,
                    children: [
                      ElevatedButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.open_in_new),
                        label: const Text('Open in Browser'),
                      ),
                      OutlinedButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.copy),
                        label: const Text('Copy Profile URL'),
                      ),
                    ],
                  ),
                ],
              ),
      ),
    );
  }
}
