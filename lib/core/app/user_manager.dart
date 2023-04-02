import 'package:expense_manager/app/domain/entities/user_entity.dart';

import '../../app/data/models/user_model.dart';

class UserManager {
  UserModel? _user;

  set user(UserEntity value) {
    _user = UserModel(
      value.id,
      value.name,
      value.email,
      value.income,
    );
  }

  UserEntity get user => _user!;

  void userIncome(double income) {
    _user = _user!.copyWith(income);
  }
}
