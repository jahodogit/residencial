import 'package:flutter/material.dart';
import 'package:residencial/domain/models/parking.dart';
import 'package:residencial/domain/models/visita.dart';
import 'package:residencial/domain/usecase/get_parking.dart';
import 'package:residencial/domain/usecase/get_visitas.dart';

import 'package:residencial/domain/usecase/initialdata.dart';
import 'package:residencial/domain/usecase/put_visita.dart';
import 'package:residencial/domain/usecase/sync_visita.dart';
import 'package:residencial/domain/usecase/update_parking_state.dart';
import 'package:residencial/domain/usecase/update_salida_visita.dart';

class ParkingProvider extends ChangeNotifier {
  List<Parking> lots = [];
  List<Parking> dummyLots = [];
  List<Visita> visitas = [];
  List<Visita> dummyVisitas = [];

  GetInitialDataUseCase getInitialDataUseCase;
  PutVisitaUseCase putVisitaUseCase;
  GetVisitasUseCase getVisitasUseCase;
  UpdateParkingStateUseCase updateParkingStateUseCase;
  GetParkingUseCase getParkingUseCase;
  UpdateSalidaVisitaUseCase updateSalidaVisitaUseCase;
  SyncVisitaUseCase syncVisitaUseCase;

  ParkingProvider() {
    getParkingInitialData();
  }

  getParkingInitialData() async {
    getInitialDataUseCase = GetInitialDataUseCase();
    lots = await getInitialDataUseCase();
    getVisitas();
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
    dummyVisitas = getVisitasUseCase();
    notifyListeners();
  }

  updateParkingState(Parking parking) async {
    updateParkingStateUseCase = UpdateParkingStateUseCase();
    await updateParkingStateUseCase(parking);
    notifyListeners();
  }

  searchPlaca(String placa) {
    placa = placa.toUpperCase();
    lots = dummyLots.where((element) {
      var texto = element.placa + element.apto + element.placamoto;
      return texto.contains(placa);
    }).toList();
    notifyListeners();
  }

  resetParkingSearch() {
    getParkingUseCase = GetParkingUseCase();
    lots = getParkingUseCase();
    dummyLots = getParkingUseCase();
    notifyListeners();
  }

  searchVisita(String texto) {
    texto = texto.toUpperCase();
    visitas = dummyVisitas
        .where((element) => element.cedula.contains(texto))
        .toList();
    notifyListeners();
  }

  resetVisitaSearch() {
    getVisitasUseCase = GetVisitasUseCase();
    visitas = getVisitasUseCase();
    dummyVisitas = getVisitasUseCase();
    notifyListeners();
  }

  updateSalidaVisita(Visita visita) async {
    updateSalidaVisitaUseCase = UpdateSalidaVisitaUseCase();
    await updateSalidaVisitaUseCase(visita);
    notifyListeners();
  }

  syncVisita() async {
    syncVisitaUseCase = SyncVisitaUseCase();
    await syncVisitaUseCase();
  }
}
