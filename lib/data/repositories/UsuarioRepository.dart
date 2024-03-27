import 'package:agendas_tenis/data/models/Usuario.dart';

abstract class UsuarioRepository {
  List<Usuario> getUsuarios();
  Usuario getUsuarioById(String id);
  void guardarUsuarios(List<Usuario> personas);
}
