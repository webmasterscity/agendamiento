class Usuario {
  final String id;
  final String email;
  final String personaId;
  final String password;

  Usuario({
    required this.id,
    required this.email,
    required this.personaId,
    required this.password,
  });

  factory Usuario.fromJson(Map<String, dynamic> json) {
    return Usuario(
      id: json['id'],
      email: json['email'],
      personaId: json['personaId'],
      password: json['password'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'personaId': personaId,
      'password': password,
    };
  }
}
