import 'package:expense_manager/app/core/app_colors.dart';
import 'package:expense_manager/app/core/widgets/default_text_field.dart';
import 'package:expense_manager/app/core/strings.dart';
import 'package:expense_manager/app/core/text_styles.dart';
import 'package:expense_manager/app/core/widgets/buttons/default_button.dart';
import 'package:expense_manager/app/core/widgets/helpers/error_box.dart';
import 'package:expense_manager/app/core/widgets/helpers/horizontal_space.dart';
import 'package:expense_manager/app/core/widgets/helpers/vertical_space.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:localization/localization.dart';

import '../../../core/assets_path.dart';
import '../../../core/injection_dependencies.dart';
import '../../../core/widgets/buttons/default_back_button.dart';
import '../../../core/widgets/buttons/outline_button.dart';
import '../controllers/create_account_controller.dart';

class CreateAccountPage extends StatefulWidget {
  const CreateAccountPage({Key? key}) : super(key: key);

  @override
  _CreateAccountPageState createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {
  final _controller = injection<CreateAccountController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Form(
            key: _controller.formKey,
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
                    Strings.createAccount.i18n(),
                    style: TextStyles.heading1,
                  ),
                ),
                VerticalSpace(height: 25),
                buildTextFieldEmail(),
                VerticalSpace(height: 25),
                buildTextFieldPasswd(),
                VerticalSpace(height: 25),
                buildTextFieldConfirmPasswd(),
                VerticalSpace(height: 25),
                Obx(
                  () => _controller.errorMessage.isNotEmpty
                      ? Padding(
                        padding: const EdgeInsets.only(bottom: 25),
                        child: ErrorBox(error: _controller.errorMessage.value),
                      )
                      : const SizedBox(),
                ),
                OutlineButton(
                  onTap: () {},
                  text: Strings.loginWithGoogle.i18n(),
                  iconPath: AssetsPath.google,
                  width: 325,
                ),
                VerticalSpace(height: 22),
                Obx(() {
                  return DefaultButton(
                    loading: _controller.loadingButton.value,
                    text: Strings.createAccount.i18n(),
                    onTap: () async {
                      await _controller.createAccount();
                      print(_controller.credential.passwd);
                      print(_controller.credential.confirmPasswd);
                    },
                    width: 325,
                  );
                }),
                VerticalSpace(height: 28),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      Strings.haveAnAccount.i18n(),
                      style: TextStyles.body4,
                    ),
                    HorizontalSpace(5),
                    Text(
                      Strings.termsOfUse.i18n(),
                      style: TextStyles.body4.copyWith(
                        color: AppColors.primaryColor,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ],
                ),
                VerticalSpace(height: 28),
              ],
            ),
          ),
        ),
      ),
    );
  }

  DefaultTextField buildTextFieldConfirmPasswd() {
    return DefaultTextField(
      controller: _controller.confirmPasswdController,
      label: Strings.confirmYourPassword.i18n(),
      isPasswd: true,
      validator: (_) {
        if (_controller.credential.validateIfConfirmPasswdIsEmpty()) {
          return Strings.fillInThePasswordField.i18n();
        } else if (_controller.credential.validateConfirmPasswd()) {
          return Strings.passwordsDoNotMatch.i18n();
        }
        return null;
      },
    );
  }

  DefaultTextField buildTextFieldPasswd() {
    return DefaultTextField(
      controller: _controller.passwdController,
      label: Strings.password.i18n(),
      isPasswd: true,
      validator: (_) {
        if (_controller.credential.validateIfPasswdIsEmpty()) {
          return Strings.fillInThePasswordField.i18n();
        } else if (_controller.credential.validateConfirmPasswd()) {
          return Strings.passwordsDoNotMatch.i18n();
        }
        return null;
      },
    );
  }

  DefaultTextField buildTextFieldEmail() {
    return DefaultTextField(
      controller: _controller.emailController,
      label: Strings.email.i18n(),
      validator: (_) {
        if (_controller.credential.validateIfEmailIsEmpty()) {
          return Strings.fillInTheEmailField.i18n();
        } else if (!_controller.credential.validateEmailFormat()) {
          return Strings.invalidFormat.i18n();
        }
        return null;
      },
    );
  }
}
