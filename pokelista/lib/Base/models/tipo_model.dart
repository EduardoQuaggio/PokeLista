import 'dart:convert';

class TipoPokemon {
  String? name;
  TipoPokemon({
    this.name,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
    };
  }

  factory TipoPokemon.fromMap(Map<String, dynamic> map) {
    return TipoPokemon(
      name: map['name'],
    );
  }
}