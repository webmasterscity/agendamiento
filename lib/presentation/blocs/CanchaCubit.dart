import 'package:agendas_tenis/data/models/Cancha.dart';
import 'package:agendas_tenis/data/providers/CanchaProvider.dart';
import 'package:agendas_tenis/domain/usecases/ObtenerCanchasUseCase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CanchaCubit extends Cubit<List<Cancha>> {
  CanchaCubit() : super([]);

  void getCanchas() {
    final canchaProvider = CanchaProvider();
    final obtenerCanchasUseCase = ObtenerCanchasUseCase(canchaProvider);
    final canchas = obtenerCanchasUseCase();
    emit(canchas);
  }
}
