import 'package:residencial/domain/models/visita.dart';
import 'package:residencial/repository/local_repository.dart';

class PutVisitaUseCase {
  LocalRepository _localRepository;

  String call(Visita visita) {
    _localRepository = LocalRepository();
    _localRepository.putVisita(visita);
  }
}
