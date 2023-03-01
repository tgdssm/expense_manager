
import 'package:flutter/material.dart';
import 'package:localization/localization.dart';
import '../../../../core/core_export.dart';
import '../../../../design_system/design_system_export.dart';

import '../controllers/create_account_controller.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
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
              const VerticalSpace(height: 40),
              Container(
                width: 325,
                alignment: Alignment.centerLeft,
                child: const DefaultBackButton(),
              ),
              const VerticalSpace(height: 40),
              Container(
                width: 325,
                alignment: Alignment.centerLeft,
                child: Text(
                  Strings.login.i18n(),
                  style: TextStyles.heading1,
                ),
              ),
              const VerticalSpace(height: 40),
              DefaultTextField(
                  controller: TextEditingController(),
                  label: Strings.email.i18n()),
              const VerticalSpace(height: 40),
              DefaultTextField(
                controller: TextEditingController(),
                label: Strings.password.i18n(),
                isPasswd: true,
              ),
              const VerticalSpace(height: 28),
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
              const VerticalSpace(height: 40),
              OutlineButton(
                onTap: () {},
                text: Strings.loginWithGoogle.i18n(),
                iconPath: AssetsPath.google,
                width: 325,
              ),
              const VerticalSpace(height: 22),
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
