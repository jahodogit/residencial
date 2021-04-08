import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:residencial/presentation/providers/parking_provider.dart';
import 'package:residencial/presentation/widgets/parking_lot.dart';
import 'package:residencial/styles.dart';

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
              onPressed: () => parkingProvider.resetParkingSearch()),
          Image.asset("images/naranja.png")
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              decoration: kInputDecoration,
              onChanged: (value) => parkingProvider.searchPlaca(value),
            ),
            Expanded(
              child: parkingProvider.lots.isNotEmpty
                  ? GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                      ),
                      itemCount: parkingProvider.lots.length,
                      itemBuilder: (BuildContext context, index) {
                        return ParkingLot(parking: parkingProvider.lots[index]);
                      })
                  : Center(child: CircularProgressIndicator()),
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              Navigator.of(context).pushNamed("/visitas");
            },
            child: Icon(Icons.person),
          ),
        ],
      ),
    );
  }
}
