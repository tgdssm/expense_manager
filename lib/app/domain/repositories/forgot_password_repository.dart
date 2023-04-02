import 'package:result/result.dart';

abstract class IForgotPasswordRepository {
  Future<Result<void>> call(String email);
}
