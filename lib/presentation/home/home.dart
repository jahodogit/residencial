import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:residencial/presentation/providers/parking_provider.dart';
import 'package:residencial/presentation/widgets/parking_lot.dart';

class HomePage extends StatelessWidget {
  String placa;

  @override
  Widget build(BuildContext context) {
    ParkingProvider parkingProvider = Provider.of<ParkingProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Parqueaderos"),
        actions: [
          IconButton(
              icon: Icon(Icons.refresh_rounded),
              onPressed: () => parkingProvider.resetParkingSearch())
        ],
      ),
      body: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemCount: parkingProvider.lots.length,
          itemBuilder: (BuildContext context, index) {
            return ParkingLot(parking: parkingProvider.lots[index]);
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
                      content: TextField(onChanged: (value) => placa = value),
                      actions: [
                        TextButton(
                            onPressed: () {
                              parkingProvider.resetParkingSearch();
                              Navigator.of(context).pop();
                            },
                            child: Text("CANCELAR")),
                        TextButton(
                            onPressed: () {
                              parkingProvider.searchPlaca(placa);
                              Navigator.of(context).pop();
                            },
                            child: Text("BUSCAR")),
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
            onPressed: () {
              Navigator.of(context).pushNamed("/visita");
            },
            child: Icon(Icons.person_add),
          ),
        ],
      ),
    );
  }
}
