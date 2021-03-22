import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';

class VisitaPage extends StatelessWidget {
  const VisitaPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            ),
            TextField(
              decoration: InputDecoration(labelText: "NOMBRE COMPLETO"),
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text("FECHA DE ENTRADA"),
              Text(formatDate(
                  DateTime.now(), [dd, '/', mm, '/', yy, ' ', HH, ':', nn])),
            ]),
            TextField(
              decoration: InputDecoration(labelText: "PARQUEADERO ASIGNADO"),
            ),
            TextField(
              decoration: InputDecoration(labelText: "PLACA"),
            ),
            ElevatedButton(onPressed: () {}, child: Text("GUARDAR"))
          ],
        ),
      ),
    );
  }
}
