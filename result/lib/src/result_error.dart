import '../result.dart';

class ResultError<T> extends Result<T> {
  final Error error;
  ResultError(this.error) : super(error);

}
