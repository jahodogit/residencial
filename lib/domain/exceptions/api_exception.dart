class ApiException implements Exception {
  final int code;
  final String message;
  final String prefix;

  ApiException(this.code, this.message, this.prefix);

  @override
  String toString() => "$code: $prefix$message";
}

class FetchDataException extends ApiException {
  FetchDataException([String message])
      : super(400, message, "Error de comunicacion: ");
}

class BadRequestException extends ApiException {
  BadRequestException([String message])
      : super(400, message, "Peticion invalida: ");
}

class UnauthorizedException extends ApiException {
  UnauthorizedException([String message])
      : super(401, message, "Permisos no validos: ");
}

class NotFoundException extends ApiException {
  NotFoundException([String message]) : super(404, message, "No encontrado: ");
}

class InternalServerException extends ApiException {
  InternalServerException([String message])
      : super(500, message, "Error interno en la api: ");
}

class InvalidInputException extends ApiException {
  InvalidInputException([String message]) : super(20201, message, "Error: ");
}
