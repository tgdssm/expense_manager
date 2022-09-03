import 'package:dartz/dartz.dart';
import 'package:expense_manager/app/core/failure.dart';
import 'package:expense_manager/app/signin/domain/entities/create_account_credential.dart';
import 'package:expense_manager/app/signin/domain/repositories/signin_repository.dart';

abstract class CreateAccount {
  Future<Either<Failure, void>> call({
    required CreateAccountCredential credential,
  });
}

class CreateAccountImpl implements CreateAccount {
  final SigninRepository repository;
  CreateAccountImpl(this.repository);
  @override
  Future<Either<Failure, void>> call({
    required CreateAccountCredential credential,
  }) async {
    return await repository.createAccount(credential: credential);
  }
}
