class Persona {
  final String id;
  final String nombre;
  final int edad;
  final String direccion;

  Persona({
    required this.id,
    required this.nombre,
    required this.edad,
    required this.direccion,
  });

  factory Persona.fromJson(Map<String, dynamic> json) {
    return Persona(
      id: json['id'],
      nombre: json['nombre'],
      edad: json['edad'],
      direccion: json['direccion'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nombre': nombre,
      'edad': edad,
      'direccion': direccion,
    };
  }
}
