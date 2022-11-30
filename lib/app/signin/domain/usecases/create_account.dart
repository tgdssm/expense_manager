import 'package:dartz/dartz.dart';
import 'package:expense_manager/app/core/failure.dart';
import 'package:expense_manager/app/core/strings.dart';
import 'package:expense_manager/app/signin/domain/entities/create_account_credential.dart';
import 'package:expense_manager/app/signin/domain/errors/signin_errors.dart';
import 'package:expense_manager/app/signin/domain/repositories/signin_repository.dart';
import 'package:localization/localization.dart';

abstract class CreateAccountUseCase {
  Future<Either<Failure, void>> call({
    required CreateAccountCredential credential,
  });
}

class CreateAccountUseCaseImpl implements CreateAccountUseCase {
  final SignInRepository repository;
  CreateAccountUseCaseImpl(this.repository);
  @override
  Future<Either<Failure, void>> call({
    required CreateAccountCredential credential,
  }) async {
    if(credential.validateIfPasswdIsEmpty()){
      return Left(CreateAccountError(message: Strings.fillInThePasswordField.i18n()));
    }else if(credential.validateIfConfirmPasswdIsEmpty()){
      return Left(CreateAccountError(message: Strings.fillInThePasswordField.i18n()));
    } else if(credential.validateConfirmPasswd()) {
      return Left(CreateAccountError(message: Strings.passwordsDoNotMatch.i18n()));
    }
    return await repository.createAccount(credential: credential);
  }
}
