import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'package:residencial/domain/models/parking.dart';
import 'package:residencial/settings.dart';

class NetworkRepository {
  Future<List<Parking>> getAllParking() async {
    var url = Uri.https(urlBase, "test/residencial/parking/");
    var response = await http.get(url);

    Iterable bodyJson = convert.json.decode(response.body);

    if (response.statusCode == 200) {
      return bodyJson.map((itemRecibido) {
        itemRecibido.moto = intToBool(itemRecibido.moto);
        itemRecibido.vehiculo = intToBool(itemRecibido.vehiculo);
        print(itemRecibido);
        Parking.fromJson(itemRecibido);
      }).toList();
    }
  }
}
