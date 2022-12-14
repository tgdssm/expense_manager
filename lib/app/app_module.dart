import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expense_manager/app/core/routes.dart';
import 'package:expense_manager/app/introduction/presenter/controllers/introduction_controller.dart';
import 'package:expense_manager/app/introduction/presenter/pages/introduction_page.dart';
import 'package:expense_manager/app/signin/domain/usecases/create_account.dart';
import 'package:expense_manager/app/signin/domain/usecases/verify_email.dart';
import 'package:expense_manager/app/signin/external/datasources/signin_datasource_impl.dart';
import 'package:expense_manager/app/signin/infra/repositories/signin_repository_impl.dart';
import 'package:expense_manager/app/signin/presenter/controllers/create_account_controller.dart';
import 'package:expense_manager/app/signin/presenter/pages/create_account_page.dart';
import 'package:expense_manager/app/signin/presenter/pages/sign_in_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';

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
        // Firebase
        Bind.instance<FirebaseAuth>(
          FirebaseAuth.instance,
        ),
        Bind.instance<FirebaseFirestore>(
          FirebaseFirestore.instance,
        ),

        // Datasource
        Bind.singleton(
          (i) => SignInDatasourceImpl(i(), i()),
        ),

        // Repositories
        Bind.singleton(
          (i) => SignInRepositoryImpl(i()),
        ),

        // Use cases
        Bind.singleton(
          (i) => CreateAccountUseCaseImpl(i()),
        ),
        Bind.singleton(
          (i) => VerifyEmailUseCaseImpl(i()),
        ),

        // Controllers
        Bind.singleton(
          (i) => IntroductionControllerImpl(),
        ),
        Bind.singleton(
          (i) => CreateAccountControllerImpl(i(), i()),
        ),
      ];
}
