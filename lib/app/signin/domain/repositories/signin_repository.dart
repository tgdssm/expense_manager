import 'package:dartz/dartz.dart';
import 'package:expense_manager/app/core/failure.dart';
import 'package:expense_manager/app/signin/infra/models/user_model.dart';

import '../entities/create_account_credential.dart';

abstract class SigninRepository {
  Future<Either<Failure, UserModel>> createAccount({
    required CreateAccountCredential credential,
  });
}
