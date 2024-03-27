import 'package:agendas_tenis/presentation/widgets/ListaAgendamientoWidget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Agendas Tenis'),
      ),
      body: const ListaAgendamientosWidget(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/add_agendamiento');
        },
        child: const Text('Agregar'),
      ),
    );
  }
}
