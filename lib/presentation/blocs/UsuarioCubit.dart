import 'package:agendas_tenis/data/models/Usuario.dart';
import 'package:agendas_tenis/data/providers/UsuarioProvider.dart';
import 'package:agendas_tenis/domain/usecases/ObtenerUsuariosUseCase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UsuarioCubit extends Cubit<List<Usuario>> {
  UsuarioCubit() : super([]);

  void getUsuarios() {
    final usuarioProvider = UsuarioProvider();
    final obtenerUsuarioUseCase = ObtenerUsuariosUseCase(usuarioProvider);
    final canchas = obtenerUsuarioUseCase();
    emit(canchas);
  }
}
