import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:residencial/presentation/providers/parking_provider.dart';
import 'package:residencial/presentation/widgets/parking_lot.dart';

class ParkingList extends StatelessWidget {
  const ParkingList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ParkingProvider parkingProvider = Provider.of<ParkingProvider>(context);

    return Container(
      child: Scrollbar(
        showTrackOnHover: true,
        child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemCount: parkingProvider.lots.length,
            itemBuilder: (BuildContext context, index) {
              return ParkingLot(parking: parkingProvider.lots[index]);
            }),
      ),
    );
  }
}
