import 'dart:convert';

import 'package:pokelista/Base/models/categoria_modal.dart';
import 'package:pokelista/Base/models/descricao_model.dart';
import 'package:pokelista/Base/models/spritepokemon_model.dart';
import 'package:pokelista/Base/models/tipo_model.dart';

import 'habilidades_model.dart';

class PokemonModel {
  int? id;
  String? name;
  String? url;
  bool favorito = false;

  SpritePokemon? spritePokemon;

  List<Habilidades>? habilidades;
  List<TipoPokemon>? tipo;
  List<Descricao>? Descricoes;
  List<Categoria>? Categorias;

  PokemonModel({
    this.id,
    this.name,
    this.url,
    this.spritePokemon,
    this.habilidades,
    this.tipo,
    this.Descricoes,
    this.Categorias,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'url': url,
      'sprites': spritePokemon,
      'abilities': habilidades,
      'types': tipo,
      // 'flavor_text_entries': Descricoes,
      'egg_groups': Categorias,
    };
  }

  factory PokemonModel.fromMap(Map<String, dynamic> json) {
    return PokemonModel(
      id: json['id'],
      name: json['name'],
      url: json['url'],
      spritePokemon:
          SpritePokemon.fromMap(json['sprites'] as Map<String, dynamic>),
      habilidades: (json["abilities"] as List)
          .map((conteudo) => Habilidades.fromMap(conteudo))
          .toList(),
      tipo: (json["types"] as List)
          .map((conteudo) => TipoPokemon.fromMap(conteudo))
          .toList(),
      // Descricoes: json["flavor_text_entries"] != null
      //     ? (json["flavor_text_entries"] as List)
      //         .map((conteudo) => Descricao.fromMap(conteudo))
      //         .toList()
      //     : null,
      Categorias: json["egg_groups"] != null
          ? (json["egg_groups"] as List)
              .map((conteudo) => Categoria.fromMap(conteudo))
              .toList()
          : null,
    );
  }
}
