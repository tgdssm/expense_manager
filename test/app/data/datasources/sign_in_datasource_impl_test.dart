// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:expense_manager/app/data/datasources/datasources.dart';
// import 'package:expense_manager/app/data/models/account_model.dart';
// import 'package:expense_manager/app/data/models/user_model.dart';
// import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:google_sign_in_mocks/google_sign_in_mocks.dart';
// import 'package:mocktail/mocktail.dart';
//
// class FirebaseAuthMock extends Mock implements FirebaseAuth {}
//
// class UserCredentialMock extends Mock implements UserCredential {}
//
// class FirebaseUserMock extends Mock implements User {}
//
// class FirebaseFirestoreMock extends Mock implements FirebaseFirestore {}
//
// class QuerySnapshotMock extends Mock
//     implements QuerySnapshot<Map<String, dynamic>> {}
//
// void main() async {
//   late FirebaseAuthMock firebaseAuth;
//   late FirebaseUserMock firebaseUser;
//   late UserCredentialMock userCredential;
//   late AccountModel accountModel;
//   late UserModel userModel;
//   late FakeFirebaseFirestore fakeFirebaseFirestore;
//   late ISignInDatasource datasource;
//   late QuerySnapshotMock snapshot;
//   late MockGoogleSignIn googleSignIn;
//
//   setUp(() {
//     firebaseAuth = FirebaseAuthMock();
//     firebaseUser = FirebaseUserMock();
//     userCredential = UserCredentialMock();
//     snapshot = QuerySnapshotMock();
//     googleSignIn = MockGoogleSignIn();
//     accountModel = AccountModel(
//       'Thalisson',
//       'thalisson@gmail.com',
//       'test',
//       'test',
//     );
//     userModel = UserModel(
//       'Thalisson',
//       'thalisson@gmail.com',
//       '@uid',
//     );
//     fakeFirebaseFirestore = FakeFirebaseFirestore();
//     datasource = SignInDatasourceImpl(
//       firebaseAuth,
//       fakeFirebaseFirestore,
//       googleSignIn,
//     );
//   });
//
//   group('[DATA] - SignInDatasourceImpl', () {
//     test('signInWithEmailAndPasswd success', () async {
//       when(() => firebaseUser.displayName).thenReturn('Thalisson');
//       when(() => firebaseUser.email).thenReturn('thalisson@gmail.com');
//       when(() => firebaseUser.uid).thenReturn('@uid');
//       when(() => userCredential.user).thenReturn(firebaseUser);
//       when(
//             () => firebaseAuth.signInWithEmailAndPassword(
//           email: accountModel.email,
//           password: accountModel.passwd,
//         ),
//       ).thenAnswer((_) async => userCredential);
//
//       final result = await datasource.signInWithEmailAndPasswd(accountModel.email, accountModel.passwd);
//       expect(result.email, userModel.email);
//     });
//
//     test('verifyEmailAlreadyUsed success', () async {
//       final result =
//       await datasource.signInWithGoogle();
//       expect(result, false);
//     });
//   });
// }
