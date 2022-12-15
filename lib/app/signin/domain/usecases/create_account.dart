import 'package:expense_manager/app/signin/domain/entities/create_account_credential.dart';
import 'package:expense_manager/app/signin/domain/repositories/signin_repository.dart';
import 'package:result/result.dart';

abstract class CreateAccountUseCase {
  Future<Result<void>> call({
    required CreateAccountCredential credential,
  });
}

class CreateAccountUseCaseImpl implements CreateAccountUseCase {
  final SignInRepository repository;
  CreateAccountUseCaseImpl(this.repository);
  @override
  Future<Result<void>> call({
    required CreateAccountCredential credential,
  }) async {
    return await repository.createAccount(credential: credential);
  }
}
