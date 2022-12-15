import 'package:expense_manager/app/signin/domain/repositories/create_account_repository.dart';
import 'package:result/result.dart';

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

