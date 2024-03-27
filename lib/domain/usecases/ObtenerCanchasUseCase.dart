// obtener_canchas_usecase.dart

import 'package:agendas_tenis/data/models/Cancha.dart';
import 'package:agendas_tenis/data/repositories/CanchaRepository.dart';

class ObtenerCanchasUseCase {
  final CanchaRepository _repository;

  ObtenerCanchasUseCase(this._repository);

  List<Cancha> call() {
    return _repository.getCanchas();
  }
}
