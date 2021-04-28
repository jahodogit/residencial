import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:residencial/domain/models/parking.dart';
import 'package:residencial/domain/models/visita.dart';
import 'package:residencial/presentation/providers/parking_provider.dart';

class VisitaPage extends StatelessWidget {
  VisitaPage({this.parking});

  Parking parking;
  Visita visita = Visita();
  String fecha =
      formatDate(DateTime.now(), [dd, '/', mm, '/', yy, ' ', HH, ':', nn]);

  @override
  Widget build(BuildContext context) {
    ParkingProvider parkingProvider = Provider.of<ParkingProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Ingreso visitante"),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TextField(
              decoration: InputDecoration(labelText: "CEDULA"),
              onChanged: (value) => visita.cedula = value,
            ),
            TextField(
              decoration: InputDecoration(labelText: "NOMBRE COMPLETO"),
              onChanged: (value) => visita.nombre = value,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text("FECHA DE ENTRADA"),
              Text(fecha),
            ]),
            Text("Apartamento: ${parking.apto}"),
            TextField(
              decoration: InputDecoration(labelText: "PLACA"),
              onChanged: (value) => visita.placavehiculo = value,
            ),
            ElevatedButton(
                onPressed: () {
                  visita.lot = parking;
                  visita.entrada = fecha;
                  parkingProvider.putVisita(visita);
                  Navigator.of(context).pop();
                },
                child: Text("GUARDAR"))
          ],
        ),
      ),
    );
  }
}
