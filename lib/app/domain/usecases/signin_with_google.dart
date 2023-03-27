import 'package:expense_manager/app/domain/entities/user_entity.dart';
import 'package:result/result.dart';

import '../repositories/repositories.dart';

abstract class ISignInWithGoogleUseCase {
  Future<Result<UserEntity>> call();
}

class SignInWithGoogleUseCaseImpl implements ISignInWithGoogleUseCase {
  final ISignInRepository repository;
  SignInWithGoogleUseCaseImpl(this.repository);
  @override
  Future<Result<UserEntity>> call() async {
    return await repository.signInWithGoogle();
  }
}
