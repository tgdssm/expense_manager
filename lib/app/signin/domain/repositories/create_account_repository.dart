import 'package:expense_manager/app/signin/infra/models/user_model.dart';
import 'package:result/result.dart';

import '../entities/create_account_credential.dart';

abstract class ICreateAccountRepository {
  Future<Result<UserModel>> createAccount({
    required CreateAccountCredential credential,
  });

  Future<Result<bool>> verifyEmailAlreadyUsed({
    required String email,
  });
}
