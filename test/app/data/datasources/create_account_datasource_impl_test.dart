import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expense_manager/app/data/datasources/datasources.dart';
import 'package:expense_manager/app/data/models/account_model.dart';
import 'package:expense_manager/app/data/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class FirebaseAuthMock extends Mock implements FirebaseAuth {}

class UserCredentialMock extends Mock implements UserCredential {}

class FirebaseUserMock extends Mock implements User {}

class FirebaseFirestoreMock extends Mock implements FirebaseFirestore {}

class CollectionReferenceMock extends Mock
    implements CollectionReference<Map<String, dynamic>> {}

class DocumentReferenceMock extends Mock
    implements DocumentReference<Map<String, dynamic>> {}

void main() async {
  final firebaseAuth = FirebaseAuthMock();
  final firebaseFirestore = FirebaseFirestoreMock();
  final firebaseUser = FirebaseUserMock();
  final userCredential = UserCredentialMock();
  final collection = CollectionReferenceMock();
  final document = DocumentReferenceMock();
  final accountModel = AccountModel(
    'Thalisson',
    'thalisson@gmail.com',
    'test',
    'test',
  );
  final userModel = UserModel(
    'Thalisson',
    'thalisson@gmail.com',
    '@uid',
  );
  final datasource = CreateAccountDatasourceImpl(
    firebaseAuth,
    firebaseFirestore,
  );

  group('[DATA] - CreateAccountDatasourceImpl', () {
    test('createAccount success', () async {
      when(() => firebaseUser.displayName).thenReturn('Thalisson');
      when(() => firebaseUser.email).thenReturn('thalisson@gmail.com');
      when(() => firebaseUser.uid).thenReturn('@uid');
      when(() => userCredential.user).thenReturn(firebaseUser);
      when(() => firebaseFirestore.collection('Users')).thenReturn(collection);
      when(() => collection.doc('@uid')).thenReturn(document);
      when(() => document.set(userModel.toMap())).thenAnswer((_) async => (){});
      when(
        () => firebaseAuth.createUserWithEmailAndPassword(
          email: accountModel.email,
          password: accountModel.passwd,
        ),
      ).thenAnswer((_) => Future<UserCredentialMock>.value(userCredential));

      when(
        () => firebaseFirestore
            .collection('Users')
            .doc(userCredential.user!.uid)
            .set(userModel.toMap()),
      ).thenAnswer((_) async => () {});

      final result = await datasource.createAccount(account: accountModel);
      expect(result, userModel);
    });
  });
}
