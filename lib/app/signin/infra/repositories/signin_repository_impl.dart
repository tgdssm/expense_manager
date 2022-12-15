import 'package:expense_manager/app/core/strings.dart';
import 'package:expense_manager/app/signin/domain/errors/signin_errors.dart';
import 'package:expense_manager/app/signin/domain/repositories/signin_repository.dart';
import 'package:expense_manager/app/signin/infra/datasources/signin_datasource.dart';
import 'package:expense_manager/app/signin/infra/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:localization/localization.dart';
import 'package:result/result.dart';

import '../../domain/entities/create_account_credential.dart';

class SignInRepositoryImpl implements SignInRepository {
  final SignInDatasource datasource;

  SignInRepositoryImpl(this.datasource);

  @override
  Future<Result<UserModel>> createAccount({
    required CreateAccountCredential credential,
  }) async {
    try {
      final result = await datasource.createAccount(credential: credential);
      return ResultSuccess<UserModel>(result);
    } on FirebaseAuthException catch (e) {
      return ResultError(CreateAccountError(message: e.message));
    } catch (e) {
      return ResultError(CreateAccountError(message: e.toString()));
    }
  }

  @override
  Future<Result<bool>> verifyEmailAlreadyUsed({
    required String email,
  }) async {
    try {
      final result = await datasource.verifyEmailAlreadyUsed(email: email);
      return ResultSuccess<bool>(result);
    } on FirebaseException catch(e){
      return ResultError(VerifyEmailError(message: e.message));
    } catch(e) {
      return ResultError(VerifyEmailError(message: Strings.errorCreatingAccount.i18n()));
    }
  }
}
