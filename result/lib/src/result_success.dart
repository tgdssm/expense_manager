import 'package:result/result.dart';

class ResultSuccess<T> extends Result<T> {
  final T success;
  ResultSuccess(this.success) : super(success!);
}
