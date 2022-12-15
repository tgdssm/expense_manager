import 'package:expense_manager/app/signin/domain/repositories/create_account_repository.dart';
import 'package:result/result.dart';

import '../entities/create_account_credential.dart';
abstract class IVerifyEmailUseCase {
  Future<Result<bool>> call({
    required CreateAccountCredential credential,
  });
}

class VerifyEmailUseCaseImpl implements IVerifyEmailUseCase {
  final ICreateAccountRepository repository;

  VerifyEmailUseCaseImpl(this.repository);
  @override
  Future<Result<bool>> call({
    required CreateAccountCredential credential,
  }) async {
    return await repository.verifyEmailAlreadyUsed(email: credential.email);
  }
}
