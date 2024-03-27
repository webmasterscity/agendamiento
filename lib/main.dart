import 'package:agendas_tenis/presentation/blocs/AgendamientoBloc.dart';
import 'package:agendas_tenis/presentation/blocs/CanchaCubit.dart';
import 'package:agendas_tenis/presentation/blocs/UsuarioCubit.dart';
import 'package:agendas_tenis/presentation/routers/Routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_storage/get_storage.dart';

main() async {
  await GetStorage.init();
  runApp(const BlocsProviders());
}

class BlocsProviders extends StatelessWidget {
  const BlocsProviders({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(
        create: (context) => CanchaCubit(),
      ),
      BlocProvider(
        create: (context) => UsuarioCubit(),
      ),
      BlocProvider(
        create: (context) => AgendamientoCubit(),
      )
    ], child: MyApp());
  }
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Agendas Tenis',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: "/",
      routes: Routes.routes,
    );
  }
}
