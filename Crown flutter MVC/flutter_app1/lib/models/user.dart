// lib/models/user.dart
class UserModel {
  final int id;
  final String login;
  final String avatarUrl;
  final String htmlUrl;
  final String type;

  UserModel({
    required this.id,
    required this.login,
    required this.avatarUrl,
    required this.htmlUrl,
    required this.type,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] ?? 0,
      login: json['login'] ?? '',
      avatarUrl: json['avatar_url'] ?? '',
      htmlUrl: json['html_url'] ?? '',
      type: json['type'] ?? '',
    );
  }
}
