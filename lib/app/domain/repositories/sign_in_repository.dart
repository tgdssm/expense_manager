import 'package:result/result.dart';
import '../entities/user_entity.dart';

abstract class ISignInRepository {
  Future<Result<UserEntity>> signInWithEmailAndPasswd(
    String email,
    String passwd,
  );

  Future<Result<UserEntity>> signInWithGoogle();
}
