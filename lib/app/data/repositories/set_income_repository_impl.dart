import 'package:expense_manager/app/data/datasources/datasources.dart';
import 'package:expense_manager/app/domain/repositories/repositories.dart';
import 'package:flutter/material.dart';
import 'package:result/result.dart';

class SetIncomeRepositoryImpl implements ISetIncomeRepository {
  final ISetIncomeDatasource datasource;
  const SetIncomeRepositoryImpl(this.datasource);
  @override
  Future<Result<void>> call(
    String userId,
    double income,
  ) async {
    try {
      await datasource(userId, income);
      return ResultSuccess(DoNothingAction);
    } on BaseError catch (e) {
      return ResultError(BaseError(message: e.message));
    } catch (e) {
      return ResultError(BaseError(message: e.toString()));
    }
  }
}
