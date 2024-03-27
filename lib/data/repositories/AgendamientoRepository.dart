import 'package:agendas_tenis/data/models/Agendamiento.dart';

abstract class AgendamientoRepository {
  List<Agendamiento> getAgendamientos();
  void agregarAgendamiento(Agendamiento agendamiento);
  void eliminarAgendamiento(String id);
}
