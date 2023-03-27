import 'package:expense_manager/app/domain/entities/user_entity.dart';
import 'package:result/result.dart';

import '../repositories/repositories.dart';

abstract class ISignInWithEmailAndPasswdUseCase {
  Future<Result<UserEntity>> call(
    String email,
    String passwd,
  );
}

class SignInWithEmailAndPasswdUseCaseImpl
    implements ISignInWithEmailAndPasswdUseCase {
  final ISignInRepository repository;
  SignInWithEmailAndPasswdUseCaseImpl(this.repository);
  @override
  Future<Result<UserEntity>> call(
    String email,
    String passwd,
  ) async {
    return await repository.signInWithEmailAndPasswd(email, passwd);
  }
}
