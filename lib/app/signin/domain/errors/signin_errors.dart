
class CreateAccountError extends Error {
  String? message;
  CreateAccountError({this.message});
}

class SignInError extends Error {
  String? message;
  SignInError({this.message});
}

class VerifyEmailError extends Error {
  String? message;
  VerifyEmailError({this.message});
}

