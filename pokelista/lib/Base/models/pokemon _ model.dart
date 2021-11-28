import 'dart:convert';

import 'package:pokelista/Base/models/spritepokemon_model.dart';
import 'package:pokelista/Base/models/tipo_model.dart';

import 'habilidades_model.dart';

class PokemonModel {
  int? id;
  String? name;
  String? url;

  // SpritePokemon? spritePokemon;

  List<Habilidades>? habilidades;
  List<TipoPokemon>? tipo;

  PokemonModel({
    this.id,
    this.name,
    this.url,
    // this.spritePokemon,
    this.habilidades,
    this.tipo,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'url': url,
      // 'sprites': spritePokemon,
      'abilities': habilidades,
      'types': tipo,
    };
  }

  factory PokemonModel.fromMap(Map<String, dynamic> json) {
    return PokemonModel(
      id: json['id'],
      name: json['name'],
      url: json['url'],
      // spritePokemon:
      //     json["sprites"].map((conteudo) => SpritePokemon.fromMap(conteudo)),
      habilidades: (json["abilities"] as List)
          .map((conteudo) => Habilidades.fromMap(conteudo))
          .toList(),
      tipo: (json["types"] as List)
          .map((conteudo) => TipoPokemon.fromMap(conteudo))
          .toList(),
    );
  }
}
