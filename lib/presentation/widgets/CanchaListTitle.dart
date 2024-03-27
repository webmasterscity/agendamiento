import 'package:agendas_tenis/data/models/Cancha.dart';
import 'package:flutter/material.dart';

class CanchaListTile extends StatelessWidget {
  final Cancha cancha;

  const CanchaListTile({required this.cancha});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(cancha.nombre),
      leading: Icon(Icons.sports_tennis),
      // Aquí podrías agregar más detalles sobre la cancha si es necesario
    );
  }
}
