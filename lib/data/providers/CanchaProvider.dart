import 'dart:convert';
import 'package:agendas_tenis/data/models/Cancha.dart';
import 'package:agendas_tenis/data/repositories/CanchaRepository.dart';
import 'package:get_storage/get_storage.dart';

class CanchaProvider implements CanchaRepository {
  final box = GetStorage('canchas');

  @override
  List<Cancha> getCanchas() {
    final canchasJson = box.read<List>('canchas');
    if (canchasJson == null || canchasJson.isEmpty) {
      final List<Cancha> canchas = [
        Cancha(id: '1', nombre: 'Cancha A', disponibilidad: {}),
        Cancha(id: '2', nombre: 'Cancha B', disponibilidad: {}),
        Cancha(id: '3', nombre: 'Cancha C', disponibilidad: {}),
      ];
      guardarCanchas(canchas); // No await needed here
      return canchas;
    } else {
      return canchasJson.map<Cancha>((c) => Cancha.fromJson(c)).toList();
    }
  }

  @override
  void guardarCanchas(List<Cancha> canchas) {
    final canchasJson = canchas.map((c) => c.toJson()).toList();
    box.write('canchas', canchasJson); // No await needed here
  }
}
