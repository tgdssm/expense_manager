import 'package:result/result.dart';
import '../entities/account_entity.dart';
import '../entities/user_entity.dart';

abstract class ICreateAccountRepository {
  Future<Result<UserEntity>> createAccount({
    required AccountEntity account,
  });

  Future<Result<bool>> verifyEmailAlreadyUsed({
    required String email,
  });
}
