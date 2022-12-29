import 'package:result/src/base_error.dart';
import 'package:expense_manager/app/core/strings.dart';
import 'package:expense_manager/app/signin/domain/repositories/create_account_repository.dart';
import 'package:expense_manager/app/signin/infra/datasources/create_account_datasource.dart';
import 'package:expense_manager/app/signin/infra/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:localization/localization.dart';
import 'package:result/result.dart';

import '../../domain/entities/create_account_credential.dart';

class CreateAccountRepositoryImpl implements ICreateAccountRepository {
  final ICreateAccountDatasource datasource;

  CreateAccountRepositoryImpl(this.datasource);

  @override
  Future<Result<UserModel>> createAccount({
    required CreateAccountCredential credential,
  }) async {
    try {
      final result = await datasource.createAccount(credential: credential);
      return ResultSuccess<UserModel>(result);
    } on FirebaseAuthException catch (e) {
      return ResultError(BaseError(message: e.message!));
    } catch (e) {
      return ResultError(BaseError(message: e.toString()));
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
      return ResultError(BaseError(message: e.message!));
    } catch(e) {
      return ResultError(BaseError(message: Strings.errorCreatingAccount.i18n()));
    }
  }
}
