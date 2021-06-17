import 'package:residencial/domain/models/visita.dart';
import 'package:residencial/repository/local_repository.dart';

class PutVisitaUseCase {
  late LocalRepository _localRepository;

  Future<int> call(Visita visita) async {
    _localRepository = LocalRepository();
    return await _localRepository.putVisita(visita);
  }
}
