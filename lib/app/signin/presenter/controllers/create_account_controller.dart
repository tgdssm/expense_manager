import 'package:expense_manager/app/core/strings.dart';
import 'package:expense_manager/app/signin/domain/usecases/create_account.dart';
import 'package:expense_manager/app/signin/domain/usecases/verify_email.dart';
import 'package:flutter/material.dart';
import 'package:localization/localization.dart';
import '../../domain/entities/create_account_credential.dart';

abstract class CreateAccountController {
  abstract GlobalKey<FormState> formKey;
  abstract TextEditingController nameController;
  abstract TextEditingController emailController;
  abstract TextEditingController passwdController;
  abstract TextEditingController confirmPasswdController;
  abstract bool emailExists;
  abstract ValueNotifier<String> errorMessage;
  abstract ValueNotifier<bool> loadingButton;
  CreateAccountCredential get credential;

  Future<void> callFunctionsToCreateAccount();
  Future<void> createAccount();
  Future<void> fEmailExists();
  void resetControllers();
}

class CreateAccountControllerImpl implements CreateAccountController {
  final ICreateAccountUseCase createAccountUseCase;
  final IVerifyEmailUseCase verifyEmailUseCase;

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
  bool emailExists = false;

  @override
  ValueNotifier<String> errorMessage = ValueNotifier("");

  @override
  ValueNotifier<bool> loadingButton = ValueNotifier(false);


  @override
  CreateAccountCredential get credential => CreateAccountCredential(
    name: nameController.text,
    email: emailController.text,
    passwd: passwdController.text,
    confirmPasswd: confirmPasswdController.text,
  );

  @override
  Future<void> callFunctionsToCreateAccount() async {
    if(formKey.currentState!.validate()) {
      loadingButton.value = true;
      emailExists = false;
      await fEmailExists();
      if(!emailExists) {
        createAccount();
      } else {
        errorMessage.value = Strings.emailIsAlreadyBeingUsed.i18n();
      }
      loadingButton.value = false;
    }
  }

  @override
  Future<void> createAccount() async {
    try {
      final result = await createAccountUseCase(credential: credential);
      if(result.isSuccess) {
        errorMessage.value = "";
        resetControllers();
      } else {
        errorMessage.value = result.errorData.message;
      }
    } catch(e) {
      errorMessage.value = e.toString();
    }
  }

  @override
  Future<void> fEmailExists() async {
    try {
      final result = await verifyEmailUseCase(credential: credential);
      if(result.isSuccess) {
        errorMessage.value = "";
        emailExists = result.successData;
      } else {
        errorMessage.value = result.errorData.message;
      }
    } catch (e) {
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
