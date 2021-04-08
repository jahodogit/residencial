import 'package:residencial/domain/models/visita.dart';
import 'package:residencial/repository/local_repository.dart';

class UpdateSalidaVisitaUseCase {
  LocalRepository _localRepository;

  Future<void> call(Visita visita) async {
    _localRepository = LocalRepository();
    await _localRepository.updateSalidaVisita(visita);
  }
}
