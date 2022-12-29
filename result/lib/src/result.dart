import '../result.dart';

abstract class Result<T> {
  T? _success;
  BaseError? _error;

  Result(Object object) {
    if(this is ResultSuccess) {
      _success = object as T;
    }

    if(this is ResultError) {
      _error = object as BaseError;
    }
  }

  bool get isSuccess => _success != null;
  bool get isError => _error != null;

  T get successData => _success!;
  BaseError get errorData => _error!;

}



