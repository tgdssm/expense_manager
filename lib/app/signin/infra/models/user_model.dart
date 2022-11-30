class UserModel {
  final String? id;
  final String name;
  final String email;

  UserModel({required this.name, required this.email, required this.id});

  Map<String, dynamic> toMap() => {
    "name": name,
    "email": email.toLowerCase(),
    "id": id
  };
}
