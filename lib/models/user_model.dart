class UserModel {
  final String name;
  final bool isOnline;
  final String lastSeen;

  UserModel({
    required this.name,
    this.isOnline = false,
    this.lastSeen = "Recently",
  });
}
