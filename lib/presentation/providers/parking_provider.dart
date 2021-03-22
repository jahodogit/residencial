import 'package:flutter/material.dart';
import 'package:residencial/domain/models/parking.dart';
import 'package:residencial/domain/models/visita.dart';
import 'package:residencial/domain/usecase/get_visitas.dart';

import 'package:residencial/domain/usecase/initialdata.dart';
import 'package:residencial/domain/usecase/put_visita.dart';

class ParkingProvider extends ChangeNotifier {
  List<Parking> lots = [];
  List<Visita> visitas = [];

  GetInitialDataUseCase getInitialDataUseCase;
  PutVisitaUseCase putVisitaUseCase;
  GetVisitasUseCase getVisitasUseCase;

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

  getVisitas() {
    getVisitasUseCase = GetVisitasUseCase();
    visitas = getVisitasUseCase();
    notifyListeners();
  }
}
