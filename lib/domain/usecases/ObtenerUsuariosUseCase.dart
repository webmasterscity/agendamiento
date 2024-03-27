import 'package:agendas_tenis/data/models/Usuario.dart';
import 'package:agendas_tenis/data/repositories/UsuarioRepository.dart';

class ObtenerUsuariosUseCase {
  final UsuarioRepository _repository;

  ObtenerUsuariosUseCase(this._repository);

  List<Usuario> call() {
    return _repository.getUsuarios();
  }
}
