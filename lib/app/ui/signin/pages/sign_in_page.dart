import 'package:expense_manager/app/ui/signin/controllers/sign_in_controller.dart';
import 'package:flutter/material.dart';
import 'package:localization/localization.dart';
import '../../../../core/core_export.dart';
import '../../../../design_system/design_system_export.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _controller = injection<SignInController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _controller.formKey,
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
                buildTextFieldEmail(),
                const VerticalSpace(height: 40),
                buildTextFieldPasswd(),
                const VerticalSpace(height: 28),
                ValueListenableBuilder(
                  valueListenable: _controller.errorMessage,
                  builder: (context, value, child) => _controller
                          .errorMessage.value.isNotEmpty
                      ? Padding(
                          padding: const EdgeInsets.only(bottom: 25),
                          child:
                              ErrorBox(error: _controller.errorMessage.value),
                        )
                      : const VerticalSpace(height: 28),
                ),
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
                  onTap: _controller.signInWithGoogle,
                  text: Strings.loginWithGoogle.i18n(),
                  iconPath: AssetsPath.google,
                  width: 325,
                ),
                const VerticalSpace(height: 22),
                ValueListenableBuilder(
                    valueListenable: _controller.loadingButton,
                    builder: (context, value, child) {
                      return DefaultButton(
                        loading: _controller.loadingButton.value,
                        text: Strings.login.i18n(),
                        onTap: _controller.signInWithEmailAndPasswd,
                        width: 325,
                      );
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }

  DefaultTextField buildTextFieldPasswd() {
    return DefaultTextField(
      controller: _controller.passwd,
      label: Strings.password.i18n(),
      isPasswd: true,
      validator: (value) {
        if (_controller.validator(value!)) {
          return Strings.fillInThePasswordField.i18n();
        }
        return null;
      },
    );
  }

  DefaultTextField buildTextFieldEmail() {
    return DefaultTextField(
      controller: _controller.email,
      label: Strings.email.i18n(),
      validator: (value) {
        if (_controller.validator(value!)) {
          return Strings.fillInTheEmailField.i18n();
        } else if (!_controller.validateEmailFormat()) {
          return Strings.invalidFormat.i18n();
        }
        return null;
      },
    );
  }
}
