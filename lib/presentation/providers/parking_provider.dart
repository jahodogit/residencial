import 'package:flutter/material.dart';
import 'package:residencial/domain/models/parking.dart';

import 'package:residencial/domain/usecase/initialdata.dart';
import 'package:residencial/domain/usecase/put_visita.dart';

class ParkingProvider extends ChangeNotifier {
  List<Parking> lots = [];
  GetInitialDataUseCase getInitialDataUseCase;
  PutVisitaUseCase putVisitaUseCase;

  ParkingProvider() {
    getParkingInitialData();
  }

  getParkingInitialData() async {
    getInitialDataUseCase = GetInitialDataUseCase();
    lots = await getInitialDataUseCase();
    notifyListeners();
  }

  putVisita() {
    putVisitaUseCase = PutVisitaUseCase();
    notifyListeners();
  }
}
