import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:residencial/domain/exceptions/api_exception.dart';

dynamic returnResponse(http.Response response) {
  var responseJson = json.decode(response.body.toString());

  switch (response.statusCode) {
    case 200:
      return response.body;
    case 400:
      return BadRequestException(responseJson["err"]["message"]);
    case 401:
    case 403:
      return UnauthorizedException(responseJson["err"]["message"]);
    case 404:
      return NotFoundException(responseJson["err"]["message"]);
    case 500:
      return InternalServerException(responseJson["err"]["message"]);
    case 20201:
      return InvalidInputException(responseJson["err"]["message"]);
    default:
      throw FetchDataException(
          "A ocurrido un error de comunicacion -StatusCode- : ${response.statusCode}");
  }
}
