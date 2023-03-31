import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expense_manager/app/data/datasources/datasources.dart';
import 'package:expense_manager/app/data/repositories/repositories.dart';
import 'package:expense_manager/app/domain/entities/user_entity.dart';
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
import 'ui/income/pages/income_page.dart';

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
      Routes.signIn.name,
      transition: TransitionType.leftToRight,
      child: (context, args) => const SignInPage(),
    ),
    ChildRoute(
      Routes.income.name,
      transition: TransitionType.leftToRight,
      child: (context, args) => IncomePage(currentUser: args.data),
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
        Bind.factory<ICreateAccountDatasource>(
          (i) => CreateAccountDatasourceImpl(i(), i()),
        ),
        Bind.factory<ISignInDatasource>(
          (i) => SignInDatasourceImpl(i(), i(), i()),
        ),
        Bind.factory<IForgotPasswordDatasource>(
          (i) => ForgotPasswordDatasourceImpl(i()),
        ),

        // Repositories
        Bind.factory<ICreateAccountRepository>(
          (i) => CreateAccountRepositoryImpl(i()),
        ),
        Bind.factory<ISignInRepository>(
          (i) => SignInRepositoryImpl(i()),
        ),
        Bind.factory<IForgotPasswordRepository>(
          (i) => ForgotPasswordRepositoryImpl(i()),
        ),

        // Use cases
        Bind.factory<ICreateAccountUseCase>(
          (i) => CreateAccountUseCaseImpl(i()),
        ),
        Bind.factory<IVerifyEmailUseCase>(
          (i) => VerifyEmailUseCaseImpl(i()),
        ),
        Bind.factory<ISignInWithEmailAndPasswdUseCase>(
          (i) => SignInWithEmailAndPasswdUseCaseImpl(i()),
        ),
        Bind.factory<ISignInWithGoogleUseCase>(
          (i) => SignInWithGoogleUseCaseImpl(i()),
        ),
        Bind.factory<IForgotPasswordUseCase>(
          (i) => ForgotPasswordUseCaseImpl(i()),
        ),

        // Controllers
        Bind.factory<IntroductionController>(
          (i) => IntroductionControllerImpl(),
        ),
        Bind.factory<CreateAccountController>(
          (i) => CreateAccountControllerImpl(i(), i()),
        ),
        Bind.factory<SignInController>(
          (i) => SignInControllerImpl(i(), i()),
        ),
      ];
}
