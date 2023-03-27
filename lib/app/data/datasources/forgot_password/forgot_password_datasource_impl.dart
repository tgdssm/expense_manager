import 'package:expense_manager/app/data/datasources/datasources.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:result/result.dart';

class ForgotPasswordDatasourceImpl implements IForgotPasswordDatasource {
  final FirebaseAuth firebaseAuth;
  const ForgotPasswordDatasourceImpl(this.firebaseAuth);
  @override
  Future<void> call(String email) async {
    try {
      await firebaseAuth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      throw BaseError(message: e.message!);
    } catch (e) {
      throw BaseError(message: e.toString());
    }
  }
}
