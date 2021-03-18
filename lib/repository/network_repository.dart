import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'package:residencial/domain/models/parking.dart';
import 'package:residencial/settings.dart';

class NetworkRepository {
  Future<List<Parking>> getAllParking() async {
    var url = Uri.https(urlBase, "/parking/");
    var response = await http.get(url);

    Iterable bodyJson = convert.json.decode(response.body)['items'];

    if (response.statusCode == 200) {
      return bodyJson
          .map((itemRecibido) => Parking.fromJson(itemRecibido))
          .toList();
    }
  }
}
