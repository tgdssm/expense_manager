import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expense_manager/app/signin/domain/entities/create_account_credential.dart';
import 'package:expense_manager/app/signin/infra/datasources/signin_datasource.dart';
import 'package:expense_manager/app/signin/infra/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignInDatasourceImpl implements SignInDatasource {
  final FirebaseAuth auth;
  final FirebaseFirestore fireStore;
  SignInDatasourceImpl(this.auth, this.fireStore);

  Future<void> createUserInFirestore(UserModel user) async {
    final userCollection = fireStore.collection("Users");
    await userCollection.doc(user.id).set(user.toMap());
  }

  @override
  Future<UserModel> createAccount({
    required CreateAccountCredential credential,
  }) async {
    try {
      final userCredential = await auth.createUserWithEmailAndPassword(
        email: credential.email,
        password: credential.passwd,
      );
      final user = UserModel(
        name: credential.name,
        email: credential.email,
        id: userCredential.user!.uid,
      );
      await createUserInFirestore(user);
      return user;
    } catch (e) {
      throw Exception(e);
    }
  }
}
