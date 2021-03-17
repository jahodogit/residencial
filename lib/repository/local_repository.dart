import 'package:hive/hive.dart';

class LocalRepository {
  static final LocalRepository _instance = LocalRepository._internal();
  Box parkingBox;

  factory LocalRepository() {
    return _instance;
  }

  openBox() async {
    parkingBox = await Hive.openBox('parking');
  }

  LocalRepository._internal();
}
