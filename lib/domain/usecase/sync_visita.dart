import 'package:residencial/domain/models/visita.dart';
import 'package:residencial/repository/local_repository.dart';
import 'package:residencial/repository/network_repository.dart';

class SyncVisitaUseCase {
  NetworkRepository _networkRepository;
  LocalRepository _localRepository;

  Future<void> call() async {
    _networkRepository = NetworkRepository();
    _localRepository = LocalRepository();

    _localRepository.getVisitas().forEach(
        (element) async => await _networkRepository.postVisita(element));
  }
}
