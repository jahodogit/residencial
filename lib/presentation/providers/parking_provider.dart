import 'package:flutter/material.dart';
import 'package:residencial/domain/exceptions/api_exception.dart';
import 'package:residencial/domain/models/parking.dart';
import 'package:residencial/domain/models/visita.dart';
import 'package:residencial/domain/usecase/get_parking.dart';
import 'package:residencial/domain/usecase/get_visitas.dart';

import 'package:residencial/domain/usecase/initialdata.dart';
import 'package:residencial/domain/usecase/put_visita.dart';
import 'package:residencial/domain/usecase/sync_visita.dart';
import 'package:residencial/domain/usecase/take_photo.dart';
import 'package:residencial/domain/usecase/text_detect.dart';
import 'package:residencial/domain/usecase/update_parking_state.dart';
import 'package:residencial/domain/usecase/update_salida_visita.dart';

enum ApiState { INITIAL, LOADING, LOADED, EMPTY, ERROR }

class ParkingProvider extends ChangeNotifier {
  ApiState apiState = ApiState.INITIAL;
  ApiException apiException;
  List<Parking> lots = [];
  List<Parking> dummyLots = [];
  List<Visita> visitas = [];
  List<Visita> dummyVisitas = [];
  String detectedText = "";

  GetInitialDataUseCase getInitialDataUseCase;
  PutVisitaUseCase putVisitaUseCase;
  GetVisitasUseCase getVisitasUseCase;
  UpdateParkingStateUseCase updateParkingStateUseCase;
  GetParkingUseCase getParkingUseCase;
  UpdateSalidaVisitaUseCase updateSalidaVisitaUseCase;
  SyncVisitaUseCase syncVisitaUseCase;

  TextDetectUseCase textDetectUseCase;

  ParkingProvider() {
    getParkingInitialData();
  }

  changeApiState(ApiState valor) {
    apiState = valor;
    notifyListeners();
  }

  getParkingInitialData() async {
    changeApiState(ApiState.LOADING);
    getInitialDataUseCase = GetInitialDataUseCase();
    try {
      lots = await getInitialDataUseCase();
      changeApiState(ApiState.LOADED);
    } on ApiException catch (error) {
      apiException = error;
      changeApiState(ApiState.ERROR);
    }

    getVisitas();
    resetParkingSearch();
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

  detectLicencePlate() async {
    textDetectUseCase = TextDetectUseCase();
    detectedText = await textDetectUseCase();
    notifyListeners();
  }
}
