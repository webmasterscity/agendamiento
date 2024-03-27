import 'package:agendas_tenis/data/models/Agendamiento.dart';
import 'package:agendas_tenis/data/providers/AgendamientoProvider.dart';
import 'package:agendas_tenis/domain/usecases/GestionarAgendamientoUseCase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AgendamientoCubit extends Cubit<List<Agendamiento>> {
  AgendamientoCubit() : super([]);

  void agregarAgendamiento(Agendamiento agendamiento) async {
    final agendamientoProvider = AgendamientoProvider();
    final gestionarAgendamientoUseCase = GestionarAgendamientoUseCase(agendamientoProvider);
    gestionarAgendamientoUseCase.agregarAgendamiento(agendamiento);

    getAgendamientos();
  }

  void getAgendamientos() {
    final agendamientoProvider = AgendamientoProvider();
    final gestionarAgendamientoUseCase = GestionarAgendamientoUseCase(agendamientoProvider);
    List<Agendamiento> agendamientos = gestionarAgendamientoUseCase.getAgendamientos();
    emit(agendamientos);
  }

  void eliminarAgendamiento(String id) async {
    final agendamientoProvider = AgendamientoProvider();
    final gestionarAgendamientoUseCase = GestionarAgendamientoUseCase(agendamientoProvider);
    gestionarAgendamientoUseCase.eliminarAgendamiento(id);
    getAgendamientos();
  }
}
