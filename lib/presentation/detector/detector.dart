import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'package:residencial/presentation/providers/parking_provider.dart';

class DetectorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ParkingProvider parkingProvider = Provider.of<ParkingProvider>(context);
    return Scaffold(
      appBar: AppBar(title: Text("Licence plate detector")),
      body: Center(
        child: GestureDetector(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                  "This module use Firebase ML services to get text from image,  can be used to detect authorized cars entering and leaving building"),
              Container(
                width: MediaQuery.of(context).size.width - 50,
                height: MediaQuery.of(context).size.height / 2,
                color: Colors.grey,
                child: Column(
                  children: [
                    Image.asset("images/licence-plate.png"),
                    Icon(Icons.camera_alt_outlined),
                    Text(
                      "Tap to activate camera",
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text("DETECTED TEXT",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 20)),
                    Expanded(
                      child: Text(
                        parkingProvider.detectedText,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          onTap: () => parkingProvider.detectLicencePlate(),
        ),
      ),
    );
  }
}
