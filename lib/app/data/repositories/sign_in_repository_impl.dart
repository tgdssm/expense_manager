import 'package:expense_manager/app/data/datasources/datasources.dart';
import 'package:expense_manager/app/domain/entities/user_entity.dart';
import 'package:expense_manager/app/domain/repositories/repositories.dart';
import 'package:result/result.dart';

class SignInRepositoryImpl implements ISignInRepository {
  final ISignInDatasource datasource;
  const SignInRepositoryImpl(this.datasource);
  @override
  Future<Result<UserEntity>> signInWithEmailAndPasswd(
    String email,
    String passwd,
  ) async {
    try {
      final result = await datasource.signInWithEmailAndPasswd(
        email,
        passwd,
      );
      return ResultSuccess(result);
    } on BaseError catch (e) {
      return ResultError(
        BaseError(
          message: e.message,
        ),
      );
    } catch (e) {
      return ResultError(
        BaseError(
          message: e.toString(),
        ),
      );
    }
  }

  @override
  Future<Result<UserEntity>> signInWithGoogle() async {
    try {
      final result = await datasource.signInWithGoogle();
      return ResultSuccess(result);
    } on BaseError catch (e) {
      return ResultError(
        BaseError(
          message: e.message,
        ),
      );
    } catch (e) {
      return ResultError(
        BaseError(
          message: e.toString(),
        ),
      );
    }
  }
}
