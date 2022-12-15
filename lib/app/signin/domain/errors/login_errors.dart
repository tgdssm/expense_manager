
import 'package:expense_manager/app/core/base_error.dart';

class CreateAccountError extends BaseError {
  @override
  String? message;
  CreateAccountError({this.message});
}

class SignInError extends BaseError {
  @override
  String? message;
  SignInError({this.message});
}

class VerifyEmailError extends BaseError {
  @override
  String? message;
  VerifyEmailError({this.message});
}

