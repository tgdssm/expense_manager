import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expense_manager/app/data/datasources/datasources.dart';
import 'package:expense_manager/app/data/repositories/repositories.dart';
import 'package:expense_manager/app/domain/repositories/repositories.dart';
import 'package:expense_manager/app/domain/usecases/usecases.dart';
import 'package:expense_manager/app/ui/introduction/controllers/introduction_controller.dart';
import 'package:expense_manager/app/ui/introduction/pages/introduction_page.dart';
import 'package:expense_manager/app/ui/signin/controllers/create_account_controller.dart';
import 'package:expense_manager/app/ui/signin/controllers/sign_in_controller.dart';
import 'package:expense_manager/app/ui/signin/pages/create_account_page.dart';
import 'package:expense_manager/app/ui/signin/pages/sign_in_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../core/core_export.dart';

class AppModule extends Module {
  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      Routes.initial.name,
      child: (context, args) => const IntroductionPage(),
    ),
    ChildRoute(
      Routes.createAccount.name,
      transition: TransitionType.leftToRight,
      child: (context, args) => const CreateAccountPage(),
    ),
    ChildRoute(
      Routes.signin.name,
      transition: TransitionType.leftToRight,
      child: (context, args) => const SignInPage(),
    ),
  ];

  @override
  List<Bind> get binds => [
        // Google
        Bind.instance<GoogleSignIn>(
          GoogleSignIn(),
        ),

        // Firebase
        Bind.instance<FirebaseAuth>(
          FirebaseAuth.instance,
        ),
        Bind.instance<FirebaseFirestore>(
          FirebaseFirestore.instance,
        ),

        // Datasource
        Bind.singleton<ICreateAccountDatasource>(
          (i) => CreateAccountDatasourceImpl(i(), i()),
        ),
        Bind.singleton<ISignInDatasource>(
          (i) => SignInDatasourceImpl(i(), i(), i()),
        ),

        // Repositories
        Bind.singleton<ICreateAccountRepository>(
          (i) => CreateAccountRepositoryImpl(i()),
        ),
        Bind.singleton<ISignInRepository>(
          (i) => SignInRepositoryImpl(i()),
        ),

        // Use cases
        Bind.singleton<ICreateAccountUseCase>(
          (i) => CreateAccountUseCaseImpl(i()),
        ),
        Bind.singleton<IVerifyEmailUseCase>(
          (i) => VerifyEmailUseCaseImpl(i()),
        ),
        Bind.singleton<ISignInWithEmailAndPasswdUseCase>(
          (i) => SignInWithEmailAndPasswdUseCaseImpl(i()),
        ),
        Bind.singleton<ISignInWithGoogleUseCase>(
          (i) => SignInWithGoogleUseCaseImpl(i()),
        ),

        // Controllers
        Bind.singleton<IntroductionController>(
          (i) => IntroductionControllerImpl(),
        ),
        Bind.singleton<CreateAccountController>(
          (i) => CreateAccountControllerImpl(i(), i()),
        ),

        Bind.singleton<SignInController>(
          (i) => SignInControllerImpl(i(), i()),
        ),
      ];
}
