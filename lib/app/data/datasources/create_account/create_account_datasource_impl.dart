import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expense_manager/app/data/datasources/create_account/create_account_datasource.dart';
import 'package:expense_manager/app/data/models/account_model.dart';
import 'package:expense_manager/app/data/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:result/result.dart';


class CreateAccountDatasourceImpl implements ICreateAccountDatasource {
  final FirebaseAuth auth;
  final FirebaseFirestore fireStore;
  CreateAccountDatasourceImpl(this.auth, this.fireStore);

  Future<void> createUserInFirestore(UserModel user) async {
    final userCollection = fireStore.collection("Users");
    await userCollection.doc(user.id).set(user.toMap());
  }

  @override
  Future<UserModel> createAccount({
    required AccountModel account,
  }) async {
    try {
      final userCredential = await auth.createUserWithEmailAndPassword(
        email: account.email,
        password: account.passwd,
      );
      final user = UserModel(
        account.name,
        account.email,
        userCredential.user!.uid,
      );
      await createUserInFirestore(user);
      return user;
    } on FirebaseAuthException catch (e) {
      throw BaseError(message: e.message!);
    }
  }

  @override
  Future<bool> verifyEmailAlreadyUsed({required String email}) async {
    try {
      bool emailAlreadyUsed = false;
      final user = await fireStore
          .collection("Users")
          .where("email", isEqualTo: email.toLowerCase())
          .get();

      if (user.docs.isNotEmpty) {
        emailAlreadyUsed = true;
      }

      return emailAlreadyUsed;
    } on FirebaseException catch (e) {
      throw BaseError(message: e.message!);
    }
  }
}
