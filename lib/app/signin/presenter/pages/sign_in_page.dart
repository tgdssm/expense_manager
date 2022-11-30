import 'package:expense_manager/app/core/app_colors.dart';
import 'package:expense_manager/app/core/injection_dependencies.dart';
import 'package:expense_manager/app/core/widgets/default_text_field.dart';
import 'package:expense_manager/app/core/strings.dart';
import 'package:expense_manager/app/core/text_styles.dart';
import 'package:expense_manager/app/core/widgets/buttons/default_button.dart';
import 'package:expense_manager/app/core/widgets/helpers/vertical_space.dart';
import 'package:expense_manager/app/signin/presenter/controllers/create_account_controller.dart';
import 'package:flutter/material.dart';
import 'package:localization/localization.dart';
import '../../../core/assets_path.dart';
import '../../../core/widgets/buttons/default_back_button.dart';
import '../../../core/widgets/buttons/outline_button.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final controller = injection<CreateAccountController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: ListView(
            children: [
              VerticalSpace(height: 40),
              Container(
                width: 325,
                alignment: Alignment.centerLeft,
                child: const DefaultBackButton(),
              ),
              VerticalSpace(height: 40),
              Container(
                width: 325,
                alignment: Alignment.centerLeft,
                child: Text(
                  Strings.login.i18n(),
                  style: TextStyles.heading1,
                ),
              ),
              VerticalSpace(height: 40),
              DefaultTextField(
                  controller: TextEditingController(),
                  label: Strings.email.i18n()),
              VerticalSpace(height: 40),
              DefaultTextField(
                controller: TextEditingController(),
                label: Strings.password.i18n(),
                isPasswd: true,
              ),
              VerticalSpace(height: 28),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    Strings.forgotYour.i18n(),
                    style: TextStyles.body4,
                  ),
                  Text(
                    "${Strings.password.i18n().toLowerCase()}?",
                    style: TextStyles.body4.copyWith(
                      color: AppColors.primaryColor,
                    ),
                  ),
                ],
              ),
              VerticalSpace(height: 200),
              OutlineButton(
                onTap: () {},
                text: Strings.loginWithGoogle.i18n(),
                iconPath: AssetsPath.google,
                width: 325,
              ),
              VerticalSpace(height: 22),
              DefaultButton(
                text: Strings.login.i18n(),
                onTap: () {},
                width: 325,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
