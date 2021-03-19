import 'package:flutter/material.dart';
import 'package:residencial/domain/models/parking.dart';

import 'package:residencial/domain/usecase/initialdata.dart';

class ParkingProvider extends ChangeNotifier {
  List<Parking> lots = [];
  GetInitialDataUseCase getInitialDataUseCase;

  ParkingProvider() {
    getParkingInitialData();
  }

  getParkingInitialData() async {
    getInitialDataUseCase = GetInitialDataUseCase();
    lots = await getInitialDataUseCase();
    notifyListeners();
  }
}
