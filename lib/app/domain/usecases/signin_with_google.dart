import 'package:result/result.dart';

import '../repositories/repositories.dart';

abstract class SignInWithGoogleUseCase {
  Future<Result<void>> call();
}

class SignInWithGoogleUseCaseImpl implements SignInWithGoogleUseCase {
  final ICreateAccountRepository repository;
  SignInWithGoogleUseCaseImpl(this.repository);
  @override
  Future<Result<bool>> call() {
    // TODO: implement call
    throw UnimplementedError();
  }

}

