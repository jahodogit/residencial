import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:residencial/core/exceptions/exceptions.dart';

import 'dart:convert' as convert;

import 'package:residencial/domain/models/parking.dart';
import 'package:residencial/domain/models/visita.dart';
import 'package:residencial/settings.dart';

class NetworkRepository {
  Future<List<Parking>> getAllParking() async {
    var url = Uri.parse("$urlBase/residencial/api/parking/");

    var response = await http.get(url);

    Iterable bodyJson = convert.json.decode(response.body)["items"];

    if (response.statusCode == 200) {
      return bodyJson
          .map((itemRecibido) => Parking.fromJson(itemRecibido))
          .toList();
    } else {
      throw ServerException();
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
    } on SocketException {}

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
