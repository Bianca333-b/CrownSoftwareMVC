// lib/pages/home_page.dart
import 'package:flutter/material.dart';
import '../widgets/nav_drawer.dart';
import '../models/user.dart';
import '../services/github_service.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/';
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GitHubService _gh = GitHubService();
  List<UserModel> _members = [];
  bool _loading = false;
  String _org = 'flutter'; // default org

  @override
  void initState() {
    super.initState();
    _loadMembers();
  }

  Future<void> _loadMembers() async {
    setState(() => _loading = true);
    final members = await _gh.fetchOrgMembers(_org);
    setState(() {
      _members = members;
      _loading = false;
    });
  }

  @override
  void dispose() {
    _gh.dispose();
    super.dispose();
  }

  Widget _buildList() {
    if (_loading) {
      return const Center(child: CircularProgressIndicator());
    }
    if (_members.isEmpty) {
      return Center(
        child: Text(
          'No members found for org: $_org',
          style: const TextStyle(fontSize: 16),
        ),
      );
    }
    return RefreshIndicator(
      onRefresh: _loadMembers,
      child: ListView.separated(
        padding: const EdgeInsets.all(12),
        itemBuilder: (ctx, i) {
          final user = _members[i];
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(user.avatarUrl),
            ),
            title: Text(user.login),
            subtitle: Text(user.type),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              Navigator.pushNamed(context, '/details', arguments: user);
            },
          );
        },
        separatorBuilder: (_, __) => const Divider(),
        itemCount: _members.length,
      ),
    );
  }

  void _showOrgDialog() {
    final ctrl = TextEditingController(text: _org);
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Change GitHub Org'),
        content: TextField(
          controller: ctrl,
          decoration: const InputDecoration(
            labelText: 'Organization (e.g., flutter, dart-lang)',
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() => _org = ctrl.text.trim());
              Navigator.pop(ctx);
              _loadMembers();
            },
            child: const Text('Load'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppNavDrawer(),
      appBar: AppBar(
        title: const Text('GHFlutter Demo'),
        actions: [
          IconButton(onPressed: _showOrgDialog, icon: const Icon(Icons.search)),
          IconButton(onPressed: _loadMembers, icon: const Icon(Icons.refresh)),
        ],
      ),
      body: _buildList(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, '/profile'),
        child: const Icon(Icons.person_add),
        tooltip: 'Go to Profile',
      ),
    );
  }
}
