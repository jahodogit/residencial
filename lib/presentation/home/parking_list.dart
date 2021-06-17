import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:residencial/presentation/providers/parking_provider.dart';
import 'package:residencial/presentation/widgets/parking_lot.dart';

class ParkingListPage extends StatelessWidget {
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
              return ParkingLotPage(parking: parkingProvider.lots[index]);
            }),
      ),
    );
  }
}
