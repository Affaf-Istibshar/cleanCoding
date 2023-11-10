//Inheritance concept (following)

class AppExceptions implements Exception{
  final _message;
  final _prefix;
  AppExceptions([this._message, this._prefix]);
// why this function?
  String toString() {
    return '$_prefix $_message';
  }
}
class InternetExceptions extends AppExceptions{
  //passing parameters, super method for passing values(by default)
  InternetExceptions(String? message) : super(message, 'No internet');
}
class RequestExceptions extends AppExceptions{
  RequestExceptions(String? message) : super(message, 'Request Time Out');
}
class ServerExceptions extends AppExceptions{
  ServerExceptions(String? message) : super(message, 'Server Error');
}
class InvalidUrl extends AppExceptions{
  InvalidUrl(String? message) : super(message, 'InvalidUrl Error');
}
class FetchDataException extends AppExceptions{
  FetchDataException(String? message) : super(message, 'Fetch Data Error');
}
