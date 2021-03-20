import 'package:residencial/domain/models/parking.dart';
import 'package:residencial/repository/local_repository.dart';
import 'package:residencial/repository/network_repository.dart';

class GetInitialDataUseCase {
  LocalRepository _localRepository;
  NetworkRepository _networkRepository;

  Future<List<Parking>> call() async {
    _localRepository = LocalRepository();
    _networkRepository = NetworkRepository();

    await _localRepository.openBox();

    if (_localRepository.ready()) {
      var lots = await _networkRepository.getAllParking();
      await _localRepository.putDataParking(lots);
    }

    return _localRepository.getAllParking();
  }
}
