class AppExceptions implements Exception {
  final _message;
  final _prefix;

  AppExceptions([this._message, this._prefix]);

  String toString() {
    return '$_prefix$_message';
  }
}

class FetchDataExceptions extends AppExceptions {
  FetchDataExceptions([String? message])
      : super(message, 'Error During Communication ');
}

class RequestTimeOutExceptions extends AppExceptions {
  RequestTimeOutExceptions([String? message]) : super(message, 'Request TimeOut ');
}

class ServerExceptions extends AppExceptions {
  ServerExceptions([String? message]) : super(message, 'Internal Server Error ');
}

class BadRequestExceptions extends AppExceptions {
  BadRequestExceptions([String? message]) : super(message, 'Invalid Request ');
}

class UnAuthorizedExceptions extends AppExceptions {
  UnAuthorizedExceptions([String? message])
      : super(message, 'UnAuthorized Request');
}

class InvalidInputExceptions extends AppExceptions {
  InvalidInputExceptions([String? message]) : super(message, 'Invalid Input ');
} 