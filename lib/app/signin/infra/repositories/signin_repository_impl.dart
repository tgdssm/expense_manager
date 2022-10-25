import 'package:expense_manager/app/core/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:expense_manager/app/signin/domain/errors/signin_errors.dart';
import 'package:expense_manager/app/signin/domain/repositories/signin_repository.dart';
import 'package:expense_manager/app/signin/infra/datasources/signin_datasource.dart';
import 'package:expense_manager/app/signin/infra/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../domain/entities/create_account_credential.dart';

class SigninRepositoryImpl implements SigninRepository {
  final SignInDatasource datasource;

  SigninRepositoryImpl(this.datasource);

  @override
  Future<Either<Failure, UserModel>> createAccount({
    required CreateAccountCredential credential,
  }) async {
    try {
      final result = await datasource.createAccount(credential: credential);
      return Right(result);
    } on FirebaseAuthException catch (e) {
      return Left(CreateAccountError(message: e.message));
    } catch (e) {
      return Left(CreateAccountError(message: e.toString()));
    }
  }
}
