import 'package:expense_manager/app/core/strings.dart';
import 'package:expense_manager/app/signin/domain/usecases/create_account.dart';
import 'package:expense_manager/app/signin/domain/usecases/verify_email.dart';
import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:localization/localization.dart';

import '../../domain/entities/create_account_credential.dart';

abstract class CreateAccountController {
  abstract GlobalKey<FormState> formKey;
  abstract TextEditingController nameController;
  abstract TextEditingController emailController;
  abstract TextEditingController passwdController;
  abstract TextEditingController confirmPasswdController;
  abstract Rx<String> errorMessage;
  abstract Rx<bool> loadingButton;
  CreateAccountCredential get credential;

  Future<void> createAccount();
  Future<bool> emailExists();
  void resetControllers();
}

class CreateAccountControllerImpl implements CreateAccountController {
  final CreateAccountUseCase createAccountUseCase;
  final VerifyEmailUseCase verifyEmailUseCase;

  CreateAccountControllerImpl(
    this.createAccountUseCase,
    this.verifyEmailUseCase,
  );

  @override
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  TextEditingController confirmPasswdController = TextEditingController();

  @override
  TextEditingController emailController = TextEditingController();

  @override
  TextEditingController nameController = TextEditingController();

  @override
  TextEditingController passwdController = TextEditingController();

  @override
  Rx<String> errorMessage = "".obs;

  @override
  Rx<bool> loadingButton = false.obs;

  @override
  CreateAccountCredential get credential => CreateAccountCredential(
    name: nameController.text,
    email: emailController.text,
    passwd: passwdController.text,
    confirmPasswd: confirmPasswdController.text,
  );

  @override
  Future<void> createAccount() async {
    if(formKey.currentState!.validate()) {
      loadingButton(true);
      try {
        if(!(await emailExists())) {
          await createAccountUseCase(credential: credential);
        } else {
          errorMessage.value = Strings.emailIsAlreadyBeingUsed.i18n();
        }
      } catch (e) {
        errorMessage.value = e.toString();
      }
      loadingButton(false);
      // resetControllers();
    }
  }

  @override
  Future<bool> emailExists() async {
    try {
      final result = await verifyEmailUseCase(credential: credential);
      return result.successData;
    } catch (e) {
      print(e);
      errorMessage.value = e.toString();
      throw Exception(e);
    }
  }

  @override
  void resetControllers() {
    nameController.clear();
    emailController.clear();
    passwdController.clear();
    confirmPasswdController.clear();
  }

}
