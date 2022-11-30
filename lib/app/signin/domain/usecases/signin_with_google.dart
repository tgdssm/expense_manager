import 'package:dartz/dartz.dart';
import 'package:expense_manager/app/core/failure.dart';
import 'package:expense_manager/app/signin/domain/repositories/signin_repository.dart';

abstract class SignInWithGoogleUseCase {
  Future<Either<Failure, void>> call();
}

class SignInWithGoogleUseCaseImpl implements SignInWithGoogleUseCase {
  final SignInRepository repository;
  SignInWithGoogleUseCaseImpl(this.repository);
  @override
  Future<Either<Failure, void>> call() {
    // TODO: implement call
    throw UnimplementedError();
  }

}

