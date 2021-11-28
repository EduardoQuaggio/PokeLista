import 'dart:convert';

class SpritePokemon {
  String? frontdefault;
  SpritePokemon({
    this.frontdefault,
  });

  Map<String, dynamic> toMap() {
    return {
      'front_default': frontdefault,
    };
  }

  factory SpritePokemon.fromMap(Map<String, dynamic> map) {
    return SpritePokemon(
      frontdefault: map['front_default'],
    );
  }
}
