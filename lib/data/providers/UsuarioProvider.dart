import 'dart:convert';
import 'package:agendas_tenis/data/models/Usuario.dart'; // Asumiendo que existe un modelo Usuario en este directorio
import 'package:agendas_tenis/data/repositories/UsuarioRepository.dart';
import 'package:get_storage/get_storage.dart';

class UsuarioProvider implements UsuarioRepository {
  final box = GetStorage();

  @override
  List<Usuario> getUsuarios() {
    final usuariosJson = box.read<List>('usuarios');
    if (usuariosJson == null || usuariosJson.isEmpty) {
      // Si no hay usuarios guardados, crea una lista con algunos usuarios y guárdalos
      final List<Usuario> usuarios = [
        Usuario(id: '1', email: 'juan@example.com', personaId: '1', password: 'password1'),
        Usuario(id: '2', email: 'maria@example.com', personaId: '2', password: 'password2'),
        Usuario(id: '3', email: 'carlos@example.com', personaId: '3', password: 'password3'),
        Usuario(id: '4', email: 'laura@example.com', personaId: '4', password: 'password4'),
      ];
      guardarUsuarios(usuarios);
      return usuarios;
    } else {
      // Si hay usuarios guardados, convierte el JSON en objetos Usuario y devuelve la lista
      return usuariosJson.map((u) => Usuario.fromJson(json.decode(u))).toList();
    }
  }

  @override
  void guardarUsuarios(List<Usuario> usuarios) {
    final usuariosJson = usuarios.map((u) => json.encode(u.toJson())).toList();
    box.write('usuarios', usuariosJson);
  }

  @override
  Usuario getUsuarioById(String usuarioId) {
    final usuarios = getUsuarios();
    return usuarios.firstWhere((u) => u.id == usuarioId);
  }
}
