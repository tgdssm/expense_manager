import 'package:expense_manager/app/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  UserModel(
    super.id,
    super.name,
    super.email,
    super.income,
  );

  factory UserModel.fromMap(Map<String, dynamic> map) => UserModel(
        map["id"],
        map["name"],
        map["email"],
        map["income"] as double,
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "email": email.toLowerCase(),
        "income": income,
      };
}
