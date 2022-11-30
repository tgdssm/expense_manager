import 'package:dartz/dartz.dart';
import 'package:expense_manager/app/core/failure.dart';
import 'package:expense_manager/app/core/strings.dart';
import 'package:expense_manager/app/signin/domain/errors/signin_errors.dart';
import 'package:expense_manager/app/signin/domain/repositories/signin_repository.dart';
import 'package:localization/localization.dart';

import '../entities/create_account_credential.dart';
abstract class VerifyEmailUseCase {
  Future<Either<Failure, bool>> call({
    required CreateAccountCredential credential,
  });
}

class VerifyEmailUseCaseImpl implements VerifyEmailUseCase {
  final SignInRepository repository;

  VerifyEmailUseCaseImpl(this.repository);
  @override
  Future<Either<Failure, bool>> call({
    required CreateAccountCredential credential,
  }) async {
    if(!credential.validateEmailFormat()) {
      return Left(VerifyEmailError(message: Strings.invalidFormat.i18n()));
    } else if(credential.validateIfPasswdIsEmpty()) {
      return Left(VerifyEmailError(message: Strings.fillInTheEmailField.i18n()));
    }
    return await repository.verifyEmailAlreadyUsed(email: credential.email);
  }
}
