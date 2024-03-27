class Cancha {
  final String id;
  final String nombre;
  final Map<String, int> disponibilidad; // Mapa de fecha -> número de agendamientos

  Cancha({
    required this.id,
    required this.nombre,
    required this.disponibilidad,
  });

  factory Cancha.fromJson(Map<String, dynamic> json) {
    return Cancha(
      id: json['id'],
      nombre: json['nombre'],
      disponibilidad: Map<String, int>.from(json['disponibilidad']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nombre': nombre,
      'disponibilidad': disponibilidad,
    };
  }
}
