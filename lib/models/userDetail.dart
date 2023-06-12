class UserDetail {
  String id, name, username, email, userDescription, image;
  DateTime createdAt;

  UserDetail(
      {required this.username,
      required this.id,
      required this.email,
      required this.name,
      required this.createdAt,
      required this.userDescription,
      required this.image});
}
