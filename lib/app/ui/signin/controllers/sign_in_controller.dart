import 'package:email_validator/email_validator.dart';
import 'package:expense_manager/app/domain/usecases/usecases.dart';
import 'package:flutter/material.dart';

abstract class SignInController {
  abstract GlobalKey<FormState> formKey;
  abstract TextEditingController email;
  abstract TextEditingController passwd;
  abstract ValueNotifier<String> errorMessage;
  abstract ValueNotifier<bool> loadingButton;

  bool validator(String value);
  bool validateEmailFormat();
  Future<void> signInWithGoogle();
  Future<void> signInWithEmailAndPasswd();
}

class SignInControllerImpl implements SignInController {
  final ISignInWithGoogleUseCase signInWithGoogleUseCase;
  final ISignInWithEmailAndPasswdUseCase signInWithEmailAndPasswdUseCase;

  SignInControllerImpl(
    this.signInWithGoogleUseCase,
    this.signInWithEmailAndPasswdUseCase,
  );

  @override
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  ValueNotifier<String> errorMessage = ValueNotifier('');

  @override
  ValueNotifier<bool> loadingButton = ValueNotifier(false);

  @override
  TextEditingController email = TextEditingController();

  @override
  TextEditingController passwd = TextEditingController();

  @override
  bool validator(String value) => value.isEmpty;

  @override
  bool validateEmailFormat() => EmailValidator.validate(email.text);

  @override
  Future<void> signInWithEmailAndPasswd() async {
    if (formKey.currentState!.validate()) {
      loadingButton.value = true;
      try {
        final result = await signInWithEmailAndPasswdUseCase(
          email.text,
          passwd.text,
        );
        if (result.isSuccess) {
        } else {
          errorMessage.value = result.errorData.message;
        }
      } catch (e) {
        errorMessage.value = e.toString();
      }
      loadingButton.value = false;
    }
  }

  @override
  Future<void> signInWithGoogle() async {
    loadingButton.value = true;
    try {
      final result = await signInWithGoogleUseCase();
      if (result.isSuccess) {
      } else {
        errorMessage.value = result.errorData.message;
      }
    } catch (e) {
      errorMessage.value = e.toString();
    }
    loadingButton.value = false;
  }
}
