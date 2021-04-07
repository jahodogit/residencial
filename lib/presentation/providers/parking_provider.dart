import 'package:flutter/material.dart';
import 'package:residencial/domain/models/parking.dart';
import 'package:residencial/domain/models/visita.dart';
import 'package:residencial/domain/usecase/get_parking.dart';
import 'package:residencial/domain/usecase/get_visitas.dart';

import 'package:residencial/domain/usecase/initialdata.dart';
import 'package:residencial/domain/usecase/put_visita.dart';
import 'package:residencial/domain/usecase/update_parking_state.dart';

class ParkingProvider extends ChangeNotifier {
  List<Parking> lots = [];
  List<Parking> dummy = [];
  List<Visita> visitas = [];

  GetInitialDataUseCase getInitialDataUseCase;
  PutVisitaUseCase putVisitaUseCase;
  GetVisitasUseCase getVisitasUseCase;
  UpdateParkingStateUseCase updateParkingStateUseCase;
  GetParkingUseCase getParkingUseCase;

  ParkingProvider() {
    getParkingInitialData();
  }

  getParkingInitialData() async {
    getInitialDataUseCase = GetInitialDataUseCase();
    lots = await getInitialDataUseCase();
    resetParkingSearch();
    notifyListeners();
  }

  putVisita(Visita visita) async {
    putVisitaUseCase = PutVisitaUseCase();
    await putVisitaUseCase(visita);

    getVisitas();
  }

  getVisitas() {
    getVisitasUseCase = GetVisitasUseCase();
    visitas = getVisitasUseCase();
    notifyListeners();
  }

  updateParkingState(Parking parking) async {
    updateParkingStateUseCase = UpdateParkingStateUseCase();
    await updateParkingStateUseCase(parking);
    notifyListeners();
  }

  searchPlaca(String placa) {
    placa = placa.toUpperCase();
    lots = dummy.where((element) => element.placa.contains(placa)).toList();
    notifyListeners();
  }

  resetParkingSearch() {
    getParkingUseCase = GetParkingUseCase();
    lots = getParkingUseCase();
    dummy = getParkingUseCase();
    notifyListeners();
  }
}
