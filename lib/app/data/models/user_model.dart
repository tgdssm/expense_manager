import 'package:expense_manager/app/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  UserModel(
    super.name,
    super.email,
    super.id,
  );

  factory UserModel.fromMap(Map<String, dynamic> map) => UserModel(
        map["name"],
        map["email"],
        map["id"],
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "email": email.toLowerCase(),
        "id": id,
      };
}
