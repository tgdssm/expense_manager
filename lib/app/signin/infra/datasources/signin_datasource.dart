import 'package:expense_manager/app/signin/infra/models/user_model.dart';

import '../../domain/entities/create_account_credential.dart';

abstract class SigninDatasource {
  Future<UserModel> createAccount({
    required CreateAccountCredential credential,
  });
}
