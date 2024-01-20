class User {
  final int id;
  final String username;
  final String email;
  final String provider;
  final bool confirmed;
  final bool blocked;
  final String createdAt;
  final String updatedAt;

  User({
    required this.id,
    required this.username,
    required this.email,
    required this.provider,
    required this.confirmed,
    required this.blocked,
    required this.createdAt,
    required this.updatedAt,
  });
}
