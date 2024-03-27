import 'dart:convert';
import 'package:agendas_tenis/data/models/Agendamiento.dart';
import 'package:agendas_tenis/data/repositories/AgendamientoRepository.dart';
import 'package:get_storage/get_storage.dart';

class AgendamientoProvider implements AgendamientoRepository {
  @override
  List<Agendamiento> getAgendamientos() {
    final box = GetStorage();
    final agendamientosJson = box.read<List>('agendamientos');
    if (agendamientosJson == null) return [];
    return agendamientosJson.map((a) => Agendamiento.fromJson(json.decode(a))).toList();
  }

  @override
  void agregarAgendamiento(Agendamiento agendamiento) {
    final box = GetStorage();
    final agendamientos = getAgendamientos();
    agendamientos.add(agendamiento);
    final agendamientosJson = agendamientos.map((a) => json.encode(a.toJson())).toList();
    box.write('agendamientos', agendamientosJson);
  }

  @override
  void eliminarAgendamiento(String id) {
    final box = GetStorage();
    final agendamientos = getAgendamientos();
    agendamientos.removeWhere((a) => a.id == id);
    final agendamientosJson = agendamientos.map((a) => json.encode(a.toJson())).toList();
    box.write('agendamientos', agendamientosJson);
  }
}
