import 'package:result/result.dart';
import '../entities/account_entity.dart';

abstract class ICreateAccountRepository {
  Future<Result> createAccount({
    required AccountEntity account,
  });

  Future<Result> verifyEmailAlreadyUsed({
    required String email,
  });
}
