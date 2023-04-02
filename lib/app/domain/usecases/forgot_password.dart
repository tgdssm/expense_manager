import 'package:expense_manager/app/data/repositories/forgot_password_repository_impl.dart';
import 'package:result/result.dart';

abstract class IForgotPasswordUseCase {
  Future<Result<void>> call(String email);
}

class ForgotPasswordUseCaseImpl implements IForgotPasswordUseCase {
  final ForgotPasswordRepositoryImpl repository;
  const ForgotPasswordUseCaseImpl(this.repository);
  @override
  Future<Result<void>> call(String email) async {
    return repository(email);
  }
}
