import 'package:agendas_tenis/data/models/Agendamiento.dart';
import 'package:flutter/material.dart';

class AgendamientoListTile extends StatelessWidget {
  final Agendamiento agendamiento;

  const AgendamientoListTile({required this.agendamiento});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(agendamiento.nombreUsuario),
      subtitle: Text(agendamiento.fecha),
      leading: Icon(Icons.calendar_today),
      // Aquí podrías agregar más detalles sobre el agendamiento si es necesario
    );
  }
}
