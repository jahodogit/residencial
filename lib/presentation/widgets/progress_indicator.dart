import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:residencial/presentation/providers/parking_provider.dart';

class ProgressIndicatorWithInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ParkingProvider parkingProvider = Provider.of<ParkingProvider>(context);

    return Container(
      child: Column(
        children: [
          CircularProgressIndicator(),
        ],
      ),
    );
  }
}
