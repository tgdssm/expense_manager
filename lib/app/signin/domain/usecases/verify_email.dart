import 'package:expense_manager/app/signin/domain/repositories/signin_repository.dart';
import 'package:result/result.dart';

import '../entities/create_account_credential.dart';
abstract class VerifyEmailUseCase {
  Future<Result<bool>> call({
    required CreateAccountCredential credential,
  });
}

class VerifyEmailUseCaseImpl implements VerifyEmailUseCase {
  final SignInRepository repository;

  VerifyEmailUseCaseImpl(this.repository);
  @override
  Future<Result<bool>> call({
    required CreateAccountCredential credential,
  }) async {
    return await repository.verifyEmailAlreadyUsed(email: credential.email);
  }
}
