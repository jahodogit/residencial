import 'package:dartz/dartz.dart';
import 'package:residencial/domain/models/parking.dart';
import 'package:residencial/repository/local_repository.dart';

class GetParkingUseCase {
  late LocalRepository _localRepository;

  Either<Exception, List<Parking>> call() {
    _localRepository = LocalRepository();
    return _localRepository.getAllParking();
  }
}
