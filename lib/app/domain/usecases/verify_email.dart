import 'package:result/result.dart';

import '../repositories/repositories.dart';

abstract class IVerifyEmailUseCase {
  Future<Result> call({
    required String email,
  });
}

class VerifyEmailUseCaseImpl implements IVerifyEmailUseCase {
  final ICreateAccountRepository repository;

  VerifyEmailUseCaseImpl(this.repository);
  @override
  Future<Result> call({
    required String email,
  }) async {
    return await repository.verifyEmailAlreadyUsed(email: email);
  }
}
