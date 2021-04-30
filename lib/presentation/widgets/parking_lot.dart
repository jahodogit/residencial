import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:residencial/domain/models/parking.dart';
import 'package:residencial/presentation/providers/parking_provider.dart';
import 'package:residencial/presentation/visitor/visit.dart';

import '../../settings.dart';

class ParkingLotPage extends StatefulWidget {
  Parking parking;
  ParkingLotPage({this.parking});

  @override
  _ParkingLotPageState createState() => _ParkingLotPageState();
}

class _ParkingLotPageState extends State<ParkingLotPage> {
  AnimationController _controller;
  @override
  Widget build(BuildContext context) {
    ParkingProvider parkingProvider = Provider.of<ParkingProvider>(context);
    return FlipInY(
      duration: Duration(milliseconds: 1500),
      animate: true,
      controller: (controller) => _controller = controller,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GestureDetector(
          onDoubleTap: () {
            //update parking state
            widget.parking.disponible = widget.parking.disponible == 0 ? 1 : 0;
            _controller.reset();
            _controller.forward();
            parkingProvider.updateParkingState(widget.parking);
          },
          onLongPress: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => VisitPage(parking: widget.parking))),
          child: Container(
            width: 140,
            height: 180,
            child: Card(
              color: intToBool(widget.parking.disponible)
                  ? Colors.green[300]
                  : Colors.red[400],
              shadowColor: intToBool(widget.parking.disponible)
                  ? Colors.green[300]
                  : Colors.red[400],
              elevation: 15,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    widget.parking.apto,
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    widget.parking.numero,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    widget.parking.placa,
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    widget.parking.placamoto,
                    style: TextStyle(fontSize: 20),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                      children: [
                        intToBool(widget.parking.vehiculo)
                            ? Icon(Icons.directions_car_outlined)
                            : SizedBox(),
                        intToBool(widget.parking.moto)
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
      ),
    );
  }
}
