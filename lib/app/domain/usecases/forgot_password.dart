import 'package:result/result.dart';

abstract class IForgotPasswordUseCase {
  Future<Result<void>> call(String email);
}

class ForgotPasswordUseCaseImpl implements IForgotPasswordUseCase {
  final ForgotPasswordUseCaseImpl repository;
  const ForgotPasswordUseCaseImpl(this.repository);
  @override
  Future<Result<void>> call(String email) async {
    return repository(email);
  }

}