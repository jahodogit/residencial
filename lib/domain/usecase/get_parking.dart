import 'package:residencial/domain/models/parking.dart';
import 'package:residencial/repository/local_repository.dart';

class GetParkingUseCase {
  LocalRepository _localRepository;

  List<Parking> call() {
    _localRepository = LocalRepository();
    return _localRepository.getAllParking();
  }
}
