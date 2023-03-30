import 'package:flutter/material.dart';
import 'package:localization/localization.dart';

import '../../../../core/core_export.dart';
import '../../../../design_system/design_system_export.dart';
import '../controllers/create_account_controller.dart';

class CreateAccountPage extends StatefulWidget {
  const CreateAccountPage({Key? key}) : super(key: key);

  @override
  State<CreateAccountPage> createState() => _CreateAccountPageState();
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
                DefaultAppBar(title: Strings.createAccount.i18n()),
                buildTextFieldName(),
                const VerticalSpace(height: 25),
                buildTextFieldEmail(),
                const VerticalSpace(height: 25),
                buildTextFieldPasswd(),
                const VerticalSpace(height: 25),
                buildTextFieldConfirmPasswd(),
                const VerticalSpace(height: 25),
                ValueListenableBuilder(
                  valueListenable: _controller.errorMessage,
                  builder: (context, value, child) => _controller
                          .errorMessage.value.isNotEmpty
                      ? Padding(
                          padding: const EdgeInsets.only(bottom: 25),
                          child:
                              ErrorBox(error: _controller.errorMessage.value),
                        )
                      : const SizedBox(),
                ),
                ValueListenableBuilder(
                    valueListenable: _controller.loadingButton,
                    builder: (context, value, child) {
                      return DefaultButton(
                        loading: _controller.loadingButton.value,
                        text: Strings.createAccount.i18n(),
                        onTap: () async {
                          await _controller.callFunctionsToCreateAccount();
                        },
                        width: 325,
                      );
                    }),
                const VerticalSpace(height: 28),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      Strings.haveAnAccount.i18n(),
                      style: TextStyles.body4,
                    ),
                    const HorizontalSpace(width: 5),
                    Text(
                      Strings.termsOfUse.i18n(),
                      style: TextStyles.body4.copyWith(
                        color: AppColors.primaryColor,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ],
                ),
                const VerticalSpace(height: 28),
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
        if (_controller.validateIfConfirmPasswdIsEmpty()) {
          return Strings.fillInThePasswordField.i18n();
        } else if (_controller.validateConfirmPasswd()) {
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
        if (_controller.validateIfPasswdIsEmpty()) {
          return Strings.fillInThePasswordField.i18n();
        } else if (_controller.validateConfirmPasswd()) {
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
        if (_controller.validateIfEmailIsEmpty()) {
          return Strings.fillInTheEmailField.i18n();
        } else if (!_controller.validateEmailFormat()) {
          return Strings.invalidFormat.i18n();
        }
        return null;
      },
    );
  }

  DefaultTextField buildTextFieldName() {
    return DefaultTextField(
      controller: _controller.nameController,
      label: Strings.name.i18n(),
      validator: (_) {
        if (_controller.validateIfNameIsEmpty()) {
          return Strings.fillInTheNameField.i18n();
        } else if (_controller.validateNameFormat() ||
            _controller.validateNameLength()) {
          return Strings.invalidFormat.i18n();
        }
        return null;
      },
    );
  }
}
