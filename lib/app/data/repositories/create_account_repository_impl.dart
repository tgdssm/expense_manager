import 'package:expense_manager/app/data/models/account_model.dart';
import 'package:expense_manager/app/domain/entities/account_entity.dart';
import 'package:expense_manager/app/domain/entities/user_entity.dart';
import 'package:localization/localization.dart';
import 'package:result/result.dart';
import '../../../design_system/design_system_export.dart';
import '../../domain/repositories/repositories.dart';
import '../datasources/datasources.dart';

class CreateAccountRepositoryImpl implements ICreateAccountRepository {
  final ICreateAccountDatasource datasource;

  CreateAccountRepositoryImpl(this.datasource);

  @override
  Future<Result<UserEntity>> createAccount({
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
    } on BaseError catch (e) {
      return ResultError(BaseError(message: e.message));
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
    } on BaseError catch (e) {
      return ResultError(
          BaseError(message: Strings.errorCreatingAccount.i18n()));
    } catch (e) {
      return ResultError(BaseError(message: e.toString()));
    }
  }
}
