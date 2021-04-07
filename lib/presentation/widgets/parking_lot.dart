import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:residencial/domain/models/parking.dart';
import 'package:residencial/presentation/providers/parking_provider.dart';

import '../../settings.dart';

class ParkingLot extends StatelessWidget {
  Parking parking;
  ParkingLot({this.parking});
  @override
  Widget build(BuildContext context) {
    ParkingProvider parkingProvider = Provider.of<ParkingProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onDoubleTap: () {
          //SE ACTUALIZA EL ESTADO DEL PARQUEADERO
          parking.disponible = parking.disponible == 0 ? 1 : 0;
          parkingProvider.updateParkingState(parking);
        },
        child: Container(
          width: 140,
          height: 180,
          child: Card(
            color: intToBool(parking.disponible)
                ? Colors.green[300]
                : Colors.red[400],
            shadowColor: intToBool(parking.disponible)
                ? Colors.green[300]
                : Colors.red[400],
            elevation: 15,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  height: 10,
                ),
                Text(
                  parking.apto,
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                Text(
                  parking.numero,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  parking.placa,
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  parking.placamoto,
                  style: TextStyle(fontSize: 20),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    children: [
                      intToBool(parking.vehiculo)
                          ? Icon(Icons.directions_car_outlined)
                          : SizedBox(),
                      intToBool(parking.moto)
                          ? Icon(Icons.motorcycle)
                          : SizedBox()
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
