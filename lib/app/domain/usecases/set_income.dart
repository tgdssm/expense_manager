import 'package:expense_manager/app/domain/repositories/repositories.dart';
import 'package:result/result.dart';

abstract class ISetIncomeUseCase {
  Future<Result<void>> call(
    String userId,
    double income,
  );
}

class SetIncomeUseCaseImpl implements ISetIncomeUseCase {
  final ISetIncomeRepository repository;
  const SetIncomeUseCaseImpl(this.repository);
  @override
  Future<Result<void>> call(
    String userId,
    double income,
  ) async {
    return repository(
      userId,
      income,
    );
  }
}
