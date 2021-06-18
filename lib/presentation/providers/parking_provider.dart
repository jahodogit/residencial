import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import 'package:residencial/domain/models/parking.dart';
import 'package:residencial/domain/models/visita.dart';
import 'package:residencial/domain/usecase/get_parking.dart';
import 'package:residencial/domain/usecase/get_visitas.dart';

import 'package:residencial/domain/usecase/initialdata.dart';
import 'package:residencial/domain/usecase/put_visita.dart';
import 'package:residencial/domain/usecase/sync_visita.dart';
import 'package:residencial/domain/usecase/text_detect.dart';
import 'package:residencial/domain/usecase/update_parking_state.dart';
import 'package:residencial/domain/usecase/update_salida_visita.dart';

enum ApiState { INITIAL, LOADING, LOADED, EMPTY, ERROR }

class ParkingProvider extends ChangeNotifier {
  ApiState apiState = ApiState.INITIAL;

  late Either<Exception, List<Parking>> exceptionOrLots;
  List<Parking> lots = [];
  List<Parking> dummyLots = [];
  List<Visita> visitas = [];
  List<Visita> dummyVisitas = [];
  String detectedText = "";

  late GetInitialDataUseCase getInitialDataUseCase;
  late PutVisitaUseCase putVisitaUseCase;
  late GetVisitasUseCase getVisitasUseCase;
  late UpdateParkingStateUseCase updateParkingStateUseCase;
  late GetParkingUseCase getParkingUseCase;
  late UpdateSalidaVisitaUseCase updateSalidaVisitaUseCase;
  late SyncVisitaUseCase syncVisitaUseCase;

  late TextDetectUseCase textDetectUseCase;

  ParkingProvider() {
    getParkingInitialData();
  }

  changeApiState(ApiState valor) {
    apiState = valor;
    notifyListeners();
  }

  getParkingInitialData() async {
    getInitialDataUseCase = GetInitialDataUseCase();
    exceptionOrLots = await getInitialDataUseCase();
    exceptionOrLots.fold(
        (exception) => Exception(), (lotsfromapi) => lots = lotsfromapi);

    getVisitas();
    resetParkingSearch();
  }

  putVisita(Visita visita) async {
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
    exceptionOrLots = getParkingUseCase();
    exceptionOrLots.fold((exception) => Exception(), (lotsfromlocal) {
      lots = lotsfromlocal;
      dummyLots = lotsfromlocal;
    });

    notifyListeners();
  }

  searchVisita(String texto) {
    texto = texto.toUpperCase();
    visitas = dummyVisitas
        .where((element) => element.cedula!.contains(texto))
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

  detectLicencePlate() async {
    detectedText = await textDetectUseCase();
    notifyListeners();
  }
}
