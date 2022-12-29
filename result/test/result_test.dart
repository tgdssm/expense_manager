import 'package:flutter_test/flutter_test.dart';
import 'package:result/result.dart';
import 'package:result/src/base_error.dart';

void main() {
  late final Result<bool> resultSuccess;
  late final Result<Error> resultError;


  setUp(() {
    resultSuccess = ResultSuccess<bool>(false);
    resultError = ResultError(BaseError(message: "error test"));
  });

  group("result tests", () {
    test("result success", () {
      expect(resultSuccess, isA<ResultSuccess<bool>>());
      expect(resultSuccess.isSuccess, true);
      expect(resultSuccess.successData, false);
    });
    test("result error", () {
      expect(resultError, isA<ResultError<BaseError>>());
      expect(resultError.isError, true);
      expect(resultError.errorData, isA<BaseError>());
    });
  });
}
