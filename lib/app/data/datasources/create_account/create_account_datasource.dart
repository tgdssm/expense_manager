import 'package:expense_manager/app/data/models/account_model.dart';
import 'package:expense_manager/app/data/models/user_model.dart';

abstract class ICreateAccountDatasource {
  Future<UserModel> createAccount({
    required AccountModel account,
  });

  Future<bool> verifyEmailAlreadyUsed({
    required String email,
  });
}
