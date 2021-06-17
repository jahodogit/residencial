import 'package:dartz/dartz.dart';
import 'package:hive/hive.dart';
import 'package:date_format/date_format.dart';

import 'package:residencial/domain/models/parking.dart';
import 'package:residencial/domain/models/visita.dart';

class LocalRepository {
  static final LocalRepository _instance = LocalRepository._internal();

  late Box parkingBox;
  late Box visitasBox;

  factory LocalRepository() {
    return _instance;
  }

  openBox() async {
    parkingBox = await Hive.openBox<Parking>('parking');
    visitasBox = await Hive.openBox<Visita>('visitas');
  }

  bool ready() => parkingBox.isEmpty;

  Future<void> putDataParking(List<Parking> lots) async =>
      await parkingBox.addAll(lots);

  Either<Exception, List<Parking>> getAllParking() {
    try {
      var parking = parkingBox.values.toList().cast<Parking>();
      return Right(parking);
    } catch (e) {
      return Left(Exception());
    }
  }

  Future<int> putVisita(Visita visita) async => await visitasBox.add(visita);

  List<Visita> getVisitas() => visitasBox.values.toList().cast();

  Future<void> updateEstadoParking(Parking parking) async {
    Parking element = parkingBox.values
        .where((element) => element.numero == parking.numero)
        .first;
    element.disponible = parking.disponible;
    await element.save();
  }

  Future<void> updateSalidaVisita(Visita visita) async {
    Visita element = visitasBox.values
        .where((element) => element.cedula == visita.cedula)
        .first;
    element.salida =
        formatDate(DateTime.now(), [dd, '/', mm, '/', yy, ' ', HH, ':', nn]);

    await element.save();
  }

  LocalRepository._internal();
}
