import '../../models/user_model.dart';

abstract class ISignInDatasource {
  Future<UserModel> signInWithEmailAndPasswd(
    String email,
    String passwd,
  );
  Future<UserModel> signInWithGoogle();
}
