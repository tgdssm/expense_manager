import 'package:expense_manager/app/data/models/account_model.dart';
import 'package:expense_manager/app/domain/entities/account_entity.dart';
import 'package:expense_manager/app/domain/entities/user_entity.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:localization/localization.dart';
import 'package:result/result.dart';
import '../../../design_system/design_system_export.dart';
import '../../domain/repositories/repositories.dart';
import '../datasources/datasources.dart';

class CreateAccountRepositoryImpl implements ICreateAccountRepository {
  final ICreateAccountDatasource datasource;

  CreateAccountRepositoryImpl(this.datasource);

  @override
  Future<Result> createAccount({
    required AccountEntity account,
  }) async {
    try {
      final result = await datasource.createAccount(
        account: AccountModel(
          account.name,
          account.email,
          account.passwd,
          account.confirmPasswd,
        ),
      );
      return ResultSuccess<UserEntity>(result);
    } on FirebaseAuthException catch (e) {
      return ResultError(BaseError(message: e.message!));
    } on BaseError catch (e) {
      return ResultError(BaseError(message: e.message));
    }
  }

  @override
  Future<Result> verifyEmailAlreadyUsed({
    required String email,
  }) async {
    try {
      final result = await datasource.verifyEmailAlreadyUsed(email: email);
      return ResultSuccess<bool>(result);
    } on FirebaseException catch (e) {
      return ResultError<BaseError>(BaseError(message: e.message!));
    } catch (e) {
      return ResultError<BaseError>(
          BaseError(message: Strings.errorCreatingAccount.i18n()));
    }
  }
}
