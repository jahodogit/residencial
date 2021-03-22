import 'package:residencial/domain/models/visita.dart';
import 'package:residencial/repository/local_repository.dart';

class GetVisitasUseCase {
  LocalRepository _localRepository;

  List<Visita> call() {
    _localRepository = LocalRepository();
    return _localRepository.getVisitas();
  }
}
