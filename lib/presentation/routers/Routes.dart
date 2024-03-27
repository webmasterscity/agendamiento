import 'package:agendas_tenis/data/providers/CanchaProvider.dart';
import 'package:flutter/material.dart';
import 'package:agendas_tenis/presentation/pages/HomePage.dart';
import 'package:agendas_tenis/presentation/pages/AddAgendamientoPage.dart';
import 'package:agendas_tenis/presentation/pages/CanchasPage.dart';
import 'package:agendas_tenis/domain/usecases/ObtenerCanchasUseCase.dart';
import 'package:agendas_tenis/data/providers/AgendamientoProvider.dart';

class Routes {
  static Map<String, WidgetBuilder> routes = {
    '/': (context) => const HomePage(),
    '/canchas': (context) => CanchasPage(),
    '/add_agendamiento': (context) => AddAgendamientoPage(), // Ajusta según sea necesario
  };
}
