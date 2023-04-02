import 'package:result/result.dart';

abstract class ISetIncomeRepository {
  Future<Result<void>> call(
    String userId,
    double income,
  );
}
