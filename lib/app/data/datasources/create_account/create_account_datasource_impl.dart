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
        userCredential.user!.uid,
        account.name,
        account.email,
      );
      final userCollection = fireStore.collection("Users");
      await userCollection.doc(user.id).set(user.toMap());
      return user;
    } on FirebaseAuthException catch (e) {
      throw BaseError(message: e.message!);
    } catch(e) {
      throw BaseError(message: e.toString());
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
    } catch(e) {
      throw BaseError(message: e.toString());
    }
  }
}
