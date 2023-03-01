import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expense_manager/app/ui/introduction/controllers/introduction_controller.dart';
import 'package:expense_manager/app/ui/introduction/pages/introduction_page.dart';
import 'package:expense_manager/app/ui/signin/controllers/create_account_controller.dart';
import 'package:expense_manager/app/ui/signin/pages/create_account_page.dart';
import 'package:expense_manager/app/ui/signin/pages/sign_in_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../core/core_export.dart';
import 'data/datasources/create_account/create_account_datasource.dart';
import 'data/datasources/create_account/create_account_datasource_impl.dart';
import 'data/repositories/create_account_repository_impl.dart';
import 'domain/repositories/create_account_repository.dart';
import 'domain/usecases/create_account.dart';
import 'domain/usecases/verify_email.dart';

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
        Bind.singleton<ICreateAccountDatasource>(
          (i) => CreateAccountDatasourceImpl(i(), i()),
        ),

        // Repositories
        Bind.singleton<ICreateAccountRepository>(
          (i) => CreateAccountRepositoryImpl(i()),
        ),

        // Use cases
        Bind.singleton<ICreateAccountUseCase>(
          (i) => CreateAccountUseCaseImpl(i()),
        ),
        Bind.singleton<IVerifyEmailUseCase>(
          (i) => VerifyEmailUseCaseImpl(i()),
        ),

        // Controllers
        Bind.singleton<IntroductionController>(
          (i) => IntroductionControllerImpl(),
        ),
        Bind.singleton<CreateAccountController>(
          (i) => CreateAccountControllerImpl(i(), i()),
        ),
      ];
}
