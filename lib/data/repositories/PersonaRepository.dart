import 'package:agendas_tenis/data/models/Persona.dart';

abstract class PersonaRepository {
  List<Persona> getPersonas();
  Persona getPersonaById(String id);
  void guardarPersonas(List<Persona> personas);
}
