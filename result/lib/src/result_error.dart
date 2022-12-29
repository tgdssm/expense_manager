import '../result.dart';

class ResultError<T> extends Result<T> {
  final BaseError error;
  ResultError(this.error) : super(error);

}
