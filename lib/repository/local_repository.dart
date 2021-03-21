import 'package:hive/hive.dart';
import 'package:residencial/domain/models/parking.dart';
import 'package:residencial/domain/models/visita.dart';

class LocalRepository {
  static final LocalRepository _instance = LocalRepository._internal();
  Box parkingBox;
  Box visitasBox;

  factory LocalRepository() {
    return _instance;
  }

  openBox() async {
    parkingBox = await Hive.openBox<Parking>('parking');
    visitasBox = await Hive.openBox<Visita>('visitas');
  }

  bool ready() {
    return parkingBox.isEmpty;
  }

  putDataParking(List<Parking> lots) async {
    await parkingBox.addAll(lots);
  }

  List<Parking> getAllParking() {
    return parkingBox.values.toList();
  }

  LocalRepository._internal();
}
