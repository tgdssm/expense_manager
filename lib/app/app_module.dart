import 'package:expense_manager/app/core/routes.dart';
import 'package:expense_manager/app/introduction/presenter/controllers/introduction_controller.dart';
import 'package:expense_manager/app/introduction/presenter/pages/introduction_page.dart';
import 'package:expense_manager/app/signin/presenter/pages/create_account_page.dart';
import 'package:expense_manager/app/signin/presenter/pages/sign_in_page.dart';
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
        Bind((i) => IntroductionControllerImpl()),
      ];
}
