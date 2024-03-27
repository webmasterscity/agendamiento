import 'package:agendas_tenis/presentation/blocs/AgendamientoBloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:agendas_tenis/data/models/Agendamiento.dart';

class ListaAgendamientosWidget extends StatelessWidget {
  const ListaAgendamientosWidget({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<AgendamientoCubit>().getAgendamientos();
    return BlocBuilder<AgendamientoCubit, List<Agendamiento>>(
      builder: (context, agendamientos) {
        if (agendamientos.isEmpty) {
          return const Center(
            child: Text('No hay agendamientos disponibles'),
          );
        } else {
          return ListView.builder(
            itemCount: agendamientos.length,
            itemBuilder: (context, index) {
              final agendamiento = agendamientos[index];
              return ListTile(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //Text(agendamiento.id),
                    Text(agendamiento.fecha),
                    Text(agendamiento.cancha),
                    Text(agendamiento.nombreUsuario),
                  ],
                ),
                leading: const Icon(Icons.date_range),
                trailing: IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () {
                    _eliminarAgendamiento(context, agendamiento.id);
                  },
                ),
              );
            },
          );
        }
      },
    );
  }

  void _eliminarAgendamiento(BuildContext context, String id) {
    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: Text('Confirmar eliminación'),
          content: Text('¿Estás seguro de que quieres eliminar este agendamiento?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(dialogContext).pop(); // Cerrar el diálogo
              },
              child: Text('Cancelar'),
            ),
            TextButton(
              onPressed: () {
                final agendamientoCubit = context.read<AgendamientoCubit>();
                agendamientoCubit.eliminarAgendamiento(id);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Agendamiento eliminado'),
                    duration: Duration(seconds: 2),
                  ),
                );
                Navigator.of(dialogContext).pop(); // Cerrar el diálogo
              },
              child: Text('Eliminar'),
            ),
          ],
        );
      },
    );
  }
}
