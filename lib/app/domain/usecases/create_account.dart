import 'package:expense_manager/app/domain/entities/account_entity.dart';
import 'package:expense_manager/app/domain/entities/user_entity.dart';
import 'package:result/result.dart';

import '../repositories/repositories.dart';

abstract class ICreateAccountUseCase {
  Future<Result<UserEntity>> call({
    required AccountEntity account,
  });
}

class CreateAccountUseCaseImpl implements ICreateAccountUseCase {
  final ICreateAccountRepository repository;
  CreateAccountUseCaseImpl(this.repository);
  @override
  Future<Result<UserEntity>> call({
    required AccountEntity account,
  }) async {
    return await repository.createAccount(account: account);
  }
}
