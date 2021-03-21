import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'package:residencial/domain/models/parking.dart';
import 'package:residencial/domain/models/visita.dart';
import 'package:residencial/settings.dart';

class NetworkRepository {
  Future<List<Parking>> getAllParking() async {
    var url = Uri.parse("$urlBase/test/residencial/parking/");
    var response = await http.get(url);

    Iterable bodyJson = convert.json.decode(response.body)["items"];

    if (response.statusCode == 200) {
      return bodyJson
          .map((itemRecibido) => Parking.fromJson(itemRecibido))
          .toList();
    }
  }

  Future<String> postVisita(Visita visita) async {
    var url = Uri.parse("$urlBase/test/residencial/visita/");
    var response = await http.post(url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: convert.jsonEncode(visita));

    if (response.statusCode == 200) {
      return "API OK - status 200";
    } else {
      return "API ERROR";
    }
  }
}
