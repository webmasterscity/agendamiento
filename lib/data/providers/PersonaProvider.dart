import 'dart:convert';
import 'package:agendas_tenis/data/models/Persona.dart';
import 'package:agendas_tenis/data/repositories/PersonaRepository.dart';
import 'package:get_storage/get_storage.dart';

class PersonaProvider implements PersonaRepository {
  final box = GetStorage('personas');

  @override
  List<Persona> getPersonas() {
    final personasJson = box.read<List>('personas');
    if (personasJson == null || personasJson.isEmpty) {
      final List<Persona> personas = [
        Persona(id: '1', nombre: 'Juan', edad: 30, direccion: 'Calle 123'),
        Persona(id: '2', nombre: 'María', edad: 25, direccion: 'Avenida XYZ'),
        Persona(id: '3', nombre: 'Carlos', edad: 40, direccion: 'Calle Principal'),
        Persona(id: '4', nombre: 'Laura', edad: 35, direccion: 'Avenida Central'),
      ];
      guardarPersonas(personas); // No await needed here
      return personas;
    } else {
      return personasJson.map<Persona>((p) => Persona.fromJson(p)).toList();
    }
  }

  @override
  void guardarPersonas(List<Persona> personas) {
    final personasJson = personas.map((p) => p.toJson()).toList();
    box.write('personas', personasJson); // No await needed here
  }

  @override
  Persona getPersonaById(String personaId) {
    final personas = getPersonas();
    return personas.firstWhere((p) => p.id == personaId);
  }
}
