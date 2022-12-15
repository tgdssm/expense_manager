import 'package:expense_manager/app/signin/domain/entities/create_account_credential.dart';
import 'package:expense_manager/app/signin/domain/repositories/create_account_repository.dart';
import 'package:result/result.dart';

abstract class ICreateAccountUseCase {
  Future<Result<void>> call({
    required CreateAccountCredential credential,
  });
}

class CreateAccountUseCaseImpl implements ICreateAccountUseCase {
  final ICreateAccountRepository repository;
  CreateAccountUseCaseImpl(this.repository);
  @override
  Future<Result<void>> call({
    required CreateAccountCredential credential,
  }) async {
    return await repository.createAccount(credential: credential);
  }
}
