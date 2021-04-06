import 'package:residencial/domain/models/parking.dart';
import 'package:residencial/repository/local_repository.dart';

class UpdateParkingStateUseCase {
  LocalRepository _localRepository;

  Future<void> call(Parking parking) async {
    _localRepository = LocalRepository();
    await _localRepository.updateEstadoParking(parking);
  }
}
