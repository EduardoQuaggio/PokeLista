import 'dart:convert';

class Habilidades {
  String? name;
  Habilidades({
    this.name,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
    };
  }

  factory Habilidades.fromMap(Map<String, dynamic> map) {
    return Habilidades(
      name: map['name'],
    );
  }
}
