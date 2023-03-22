abstract class IForgotPasswordDatasource {
  Future<void> call(String email);
}