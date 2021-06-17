import 'package:residencial/repository/local_repository.dart';
import 'package:residencial/repository/network_repository.dart';

class SyncVisitaUseCase {
  late NetworkRepository _networkRepository;
  late LocalRepository _localRepository;

  Future<void> call() async {
    _networkRepository = NetworkRepository();
    _localRepository = LocalRepository();

    _localRepository.getVisitas().forEach(
        (element) async => await _networkRepository.postVisita(element));
  }
}
