// agendamiento.dart

class Agendamiento {
  final String id;
  final String cancha;
  final String fecha;
  final String nombreUsuario;

  Agendamiento({
    required this.id,
    required this.cancha,
    required this.fecha,
    required this.nombreUsuario,
  });

  factory Agendamiento.fromJson(Map<String, dynamic> json) {
    return Agendamiento(
      id: json['id'],
      cancha: json['cancha'],
      fecha: json['fecha'],
      nombreUsuario: json['nombreUsuario'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'cancha': cancha,
      'fecha': fecha,
      'nombreUsuario': nombreUsuario,
    };
  }
}
