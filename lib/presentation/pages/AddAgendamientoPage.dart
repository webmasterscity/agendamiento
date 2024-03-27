import 'dart:math';
import 'package:agendas_tenis/data/models/Agendamiento.dart';
import 'package:agendas_tenis/data/models/Cancha.dart';
import 'package:agendas_tenis/data/models/Usuario.dart';
import 'package:agendas_tenis/data/providers/PersonaProvider.dart';
import 'package:agendas_tenis/data/providers/UsuarioProvider.dart';
import 'package:agendas_tenis/domain/helpers/WeatherService.dart';
import 'package:agendas_tenis/domain/helpers/GlobalHelpers.dart';
import 'package:agendas_tenis/presentation/blocs/AgendamientoBloc.dart';
import 'package:agendas_tenis/presentation/blocs/CanchaCubit.dart';
import 'package:agendas_tenis/presentation/blocs/UsuarioCubit.dart'; // Importa el UsuarioCubit
import 'package:agendas_tenis/presentation/widgets/DatePickerWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddAgendamientoPage extends StatelessWidget {
  const AddAgendamientoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CanchaCubit>(create: (_) => CanchaCubit()..getCanchas()),
        BlocProvider<UsuarioCubit>(create: (_) => UsuarioCubit()..getUsuarios()), // Proporciona el UsuarioCubit
      ],
      child: Scaffold(
        appBar: AppBar(
          title: Text('Agregar Agendamiento'),
        ),
        body: BlocBuilder<CanchaCubit, List<Cancha>>(
          builder: (context, canchasState) => BlocBuilder<UsuarioCubit, List<Usuario>>(
            builder: (context, usuariosState) => AddAgendamientoForm(
              canchasDisponibles: canchasState,
              usuariosDisponibles: usuariosState,
            ),
          ),
        ),
      ),
    );
  }
}

class AddAgendamientoForm extends StatefulWidget {
  final List<Cancha> canchasDisponibles;
  final List<Usuario> usuariosDisponibles;

  const AddAgendamientoForm({
    Key? key,
    required this.canchasDisponibles,
    required this.usuariosDisponibles,
  }) : super(key: key);

  @override
  _AddAgendamientoFormState createState() => _AddAgendamientoFormState();
}

class _AddAgendamientoFormState extends State<AddAgendamientoForm> {
  List<String?> selectedCanchas = [];
  List<String?> selectedUsuarios = [];
  List<String?> selectedFechas = [];
  late PersonaProvider personaProvider;

  @override
  void initState() {
    super.initState();
    personaProvider = PersonaProvider(); // Si no lo has inicializado ya en la declaración

    if (widget.canchasDisponibles.isNotEmpty) {
      selectedCanchas.add(widget.canchasDisponibles.first.nombre);
    }

    if (widget.usuariosDisponibles.isNotEmpty) {
      selectedUsuarios.add(widget.usuariosDisponibles.first.id);
    }
    selectedFechas.add(formatDate(DateTime.now()));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Dropdowns de las canchas y usuarios seleccionados
          for (int i = 0; i < selectedCanchas.length; i++)
            Row(
              children: [
                _dropDownCanchas(i),
                const SizedBox(
                  width: 10,
                ),
                _fechas(i),
                const SizedBox(
                  width: 10,
                ),
                _dropDownUsuarios(i),
              ],
            ),
          // Botón para agregar otro dropdown
          _btnAgregarOtro(),
          // Botón de guardar
          _btnSave(),
        ],
      ),
    );
  }

  DatePickerWidget _fechas(int i) {
    return DatePickerWidget(
      onDateSelected: (DateTime selectedDate) async {
        selectedFechas[i] = formatDate(selectedDate);
        // Fecha específica
        String rainProbability = await WeatherService.getRainProbability(selectedDate);
        showDialog2(context, rainProbability);
      },
    );
  }

  Expanded _dropDownCanchas(int index) {
    return Expanded(
      child: DropdownButtonFormField<String>(
        value: selectedCanchas[index],
        decoration: const InputDecoration(
          border: InputBorder.none,
        ),
        items: widget.canchasDisponibles.map((cancha) {
          return DropdownMenuItem<String>(
            value: cancha.nombre,
            child: Text(cancha.nombre),
          );
        }).toList(),
        onChanged: (newValue) {
          setState(() {
            selectedCanchas[index] = newValue;
          });
        },
      ),
    );
  }

  Expanded _dropDownUsuarios(int index) {
    return Expanded(
      child: DropdownButtonFormField<String>(
        value: selectedUsuarios[index],
        decoration: InputDecoration(
          border: InputBorder.none,
        ),
        items: widget.usuariosDisponibles.map((usuario) {
          final persona = personaProvider.getPersonaById(usuario.personaId);
          final nombrePersona = persona.nombre;
          return DropdownMenuItem<String>(
            value: usuario.id,
            child: Text(nombrePersona),
          );
        }).toList(),
        onChanged: (newValue) {
          setState(() {
            selectedUsuarios[index] = newValue;
          });
        },
      ),
    );
  }

  ElevatedButton _btnSave() {
    return ElevatedButton(
      onPressed: () {
        final agendamientoCubit = context.read<AgendamientoCubit>();

        // Obtener los datos del formulario
        final List<Agendamiento> agendamientos = [];
        for (int i = 0; i < selectedCanchas.length; i++) {
          final selectedCancha = selectedCanchas[i];
          final selectedUsuario = selectedUsuarios[i];
          final selectedFecha = selectedFechas[i];

          final usuario = UsuarioProvider().getUsuarioById(selectedUsuario.toString());
          final persona = personaProvider.getPersonaById(usuario.personaId);
          final nombrePersona = persona.nombre;

          final selectedDate = "_selectedDate";
          String id = DateTime.now().millisecondsSinceEpoch.toString() + Random().nextInt(10000).toString();
          // Crear un objeto de tipo Agendamiento con los datos obtenidos
          final agendamiento = Agendamiento(
            id: id,
            cancha: selectedCancha.toString(),
            nombreUsuario: nombrePersona,
            fecha: selectedFecha.toString(),
          );
          agendamientos.add(agendamiento);
        }

        for (final agendamiento in agendamientos) {
          agendamientoCubit.agregarAgendamiento(agendamiento);
        }

        // Cierra la página después de guardar los agendamientos
        Navigator.pop(context);
      },
      child: Text('Guardar'),
    );
  }

  ElevatedButton _btnAgregarOtro() {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          if (widget.canchasDisponibles.isNotEmpty) {
            selectedCanchas.add(widget.canchasDisponibles.first.nombre);
            selectedUsuarios.add(widget.usuariosDisponibles.first.id);
            selectedFechas.add(formatDate(DateTime.now()));
          }
        });
      },
      child: Text('Agregar otro'),
    );
  }
}
