import 'package:dartz/dartz.dart';
import 'package:residencial/domain/models/parking.dart';
import 'package:residencial/repository/local_repository.dart';
import 'package:residencial/repository/network_repository.dart';

class GetInitialDataUseCase {
  late LocalRepository _localRepository;
  late NetworkRepository _networkRepository;

  Future<Either<Exception, List<Parking>>> call() async {
    _localRepository = LocalRepository();
    _networkRepository = NetworkRepository();

    await _localRepository.openBox();

    if (_localRepository.ready()) {
      try {
        var lots = await _networkRepository.getAllParking();
        await _localRepository.putDataParking(lots);
        return _localRepository.getAllParking();
      } catch (e) {
        return Left(Exception());
      }
    } else {
      return Left(Exception());
    }
  }
}
