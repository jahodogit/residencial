import 'package:flutter/material.dart';
import 'package:residencial/domain/models/parking.dart';
import 'package:residencial/presentation/widgets/parking_lot.dart';

class HomePage extends StatelessWidget {
  final List<Parking> lots = [
    Parking(numero: "12", apto: "904 TORRE 3", placa: "MSY162"),
    Parking(
        numero: "112", apto: "901 TORRE 4", placa: "PHU10B", disponible: false),
    Parking(
        numero: "34",
        apto: "502 TORRE 2",
        placa: "ABC100",
        moto: true,
        placamoto: "HDS40C"),
    Parking(numero: "82", apto: "303 TORRE 3", placa: "DEF100"),
    Parking(
        numero: "44", apto: "701 TORRE 5", placa: "AVV100", disponible: false),
    Parking(numero: "123", apto: "503 TORRE 2", placa: "KJH100"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Parqueaderos"),
      ),
      body: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemCount: lots.length,
          itemBuilder: (BuildContext context, index) {
            return ParkingLot(parking: lots[index]);
          }),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      content: TextField(),
                      actions: [
                        TextButton(
                            onPressed: () => Navigator.of(context).pop(),
                            child: Text("CANCELAR")),
                        TextButton(onPressed: () {}, child: Text("BUSCAR")),
                      ],
                    );
                  });
            },
            child: Icon(Icons.search),
          ),
          SizedBox(
            width: 20,
          ),
          FloatingActionButton(
            onPressed: () {},
            child: Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
