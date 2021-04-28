import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:residencial/domain/exceptions/api_exception.dart';

import 'dart:convert' as convert;

import 'package:residencial/domain/models/parking.dart';
import 'package:residencial/domain/models/visita.dart';
import 'package:residencial/settings.dart';

class NetworkRepository {
  Future<List<Parking>> getAllParking() async {
    var url = Uri.parse("$urlBase/residencial/api/parking/");
    var response;

    try {
      response = await http.get(url);
    } on SocketException {
      throw FetchDataException("Sin conexion a internet");
    }

    Iterable bodyJson = convert.json.decode(response.body)["items"];

    if (response.statusCode == 200) {
      return bodyJson
          .map((itemRecibido) => Parking.fromJson(itemRecibido))
          .toList();
    }
  }

  Future<bool> postVisita(Visita visita) async {
    var url = Uri.parse("$urlBase/residencial/api/visita/");
    var response;
    try {
      response = await http.post(url,
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: convert.jsonEncode(visita));
    } on SocketException {
      throw FetchDataException("Sin conexion a internet");
    }

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
