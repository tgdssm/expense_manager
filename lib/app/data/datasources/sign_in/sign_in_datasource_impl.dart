import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expense_manager/app/data/datasources/datasources.dart';
import 'package:expense_manager/app/data/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:result/result.dart';

class SignInDatasourceImpl implements ISignInDatasource {
  final FirebaseAuth auth;
  final FirebaseFirestore fireStore;
  final GoogleSignIn googleSigIn;
  const SignInDatasourceImpl(
    this.auth,
    this.fireStore,
    this.googleSigIn,
  );
  @override
  Future<UserModel> signInWithEmailAndPasswd(
    String email,
    String passwd,
  ) async {
    try {
      final userCredential = await auth.signInWithEmailAndPassword(
        email: email,
        password: passwd,
      );

      final user = await fireStore
          .collection('Users')
          .where('id', isEqualTo: userCredential.user!.uid)
          .get();
      return UserModel.fromMap(user.docs.first.data());
    } on FirebaseAuthException catch (e) {
      throw BaseError(message: e.message!);
    } catch (e) {
      throw BaseError(message: e.toString());
    }
  }

  @override
  Future<UserModel> signInWithGoogle() async {
    try {
      final account = await googleSigIn.signIn();

      final user = await fireStore
          .collection('Users')
          .where('id', isEqualTo: account?.id)
          .get();
      return UserModel.fromMap(user.docs.first.data());
    } on FirebaseAuthException catch (e) {
      throw BaseError(message: e.message!);
    } catch (e) {
      throw BaseError(message: e.toString());
    }
  }
}
