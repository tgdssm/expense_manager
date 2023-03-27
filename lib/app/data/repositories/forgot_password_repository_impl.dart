import 'package:expense_manager/app/data/datasources/datasources.dart';
import 'package:expense_manager/app/domain/repositories/repositories.dart';
import 'package:flutter/material.dart';
import 'package:result/result.dart';

class ForgotPasswordRepositoryImpl implements IForgotPasswordRepository {
  final IForgotPasswordDatasource datasource;
  const ForgotPasswordRepositoryImpl(this.datasource);
  @override
  Future<Result<void>> call(String email) async {
    try {
      await datasource(email);
      return ResultSuccess(DoNothingAction);
    } on BaseError catch (e) {
      return ResultError(BaseError(message: e.message));
    } catch (e) {
      return ResultError(BaseError(message: e.toString()));
    }
  }
}
