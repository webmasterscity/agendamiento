// gestionar_agendamiento_usecase.dart

import 'package:agendas_tenis/data/models/Agendamiento.dart';
import 'package:agendas_tenis/data/repositories/AgendamientoRepository.dart';

class GestionarAgendamientoUseCase {
  final AgendamientoRepository _repository;

  GestionarAgendamientoUseCase(this._repository);

  void agregarAgendamiento(Agendamiento agendamiento) {
    return _repository.agregarAgendamiento(agendamiento);
  }

  void eliminarAgendamiento(String id) {
    return _repository.eliminarAgendamiento(id);
  }

  List<Agendamiento> getAgendamientos() {
    return _repository.getAgendamientos();
  }
}
