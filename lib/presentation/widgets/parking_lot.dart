import 'package:flutter/material.dart';
import 'package:residencial/domain/models/parking.dart';

import '../../settings.dart';

class ParkingLot extends StatelessWidget {
  Parking parking;
  ParkingLot({this.parking});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 140,
        height: 180,
        child: Card(
          shadowColor:
              intToBool(parking.disponible) ? Colors.green : Colors.red,
          elevation: 15,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                parking.numero,
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              Text(parking.apto),
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
    );
  }
}
