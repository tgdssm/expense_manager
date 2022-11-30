import 'package:expense_manager/app/signin/infra/models/user_model.dart';

import '../../domain/entities/create_account_credential.dart';

abstract class SignInDatasource {
  Future<UserModel> createAccount({
    required CreateAccountCredential credential,
  });

  Future<bool> verifyEmailAlreadyUsed({
    required String email,
  });
}
