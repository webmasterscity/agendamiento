import 'package:agendas_tenis/data/models/Cancha.dart';

abstract class CanchaRepository {
  List<Cancha> getCanchas();
  void guardarCanchas(List<Cancha> canchas);
}
