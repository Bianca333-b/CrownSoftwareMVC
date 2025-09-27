// lib/services/github_service.dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/user.dart';

class GitHubService {
  final http.Client _client;

  GitHubService([http.Client? client]) : _client = client ?? http.Client();

  /// Fetch list of members for a public org (e.g., flutter).
  /// Returns empty list on error.
  Future<List<UserModel>> fetchOrgMembers(String org) async {
    final url = Uri.https('api.github.com', '/orgs/$org/members');
    try {
      final res = await _client.get(url, headers: {
        'Accept': 'application/vnd.github.v3+json',
        'User-Agent': 'ghflutter-demo',
      });
      if (res.statusCode == 200) {
        final List<dynamic> data = jsonDecode(res.body) as List<dynamic>;
        return data.map((e) => UserModel.fromJson(e as Map<String, dynamic>)).toList();
      } else {
        return [];
      }
    } catch (_) {
      return [];
    }
  }

  void dispose() {
    _client.close();
  }
}
