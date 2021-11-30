import 'package:get/get.dart';
import 'package:pokelista/Base/models/categoria_modal.dart';
import 'package:pokelista/Base/models/descricao_model.dart';
import 'package:pokelista/Base/models/habilidades_model.dart';
import 'package:pokelista/Base/models/pokemon%20_%20model.dart';
import 'package:pokelista/Base/models/tipo_model.dart';

class PokemonApi extends GetConnect {
  Future<PokemonModel?> getInfoPokemons(String int) async {
    try {
      httpClient.timeout = const Duration(seconds: 30);
      final url = 'https://pokeapi.co/api/v2/pokemon/${int}';
      Response resp = await httpClient.get(url);

      final result = resp.body;

      PokemonModel pokemon = PokemonModel.fromMap(result);
      return pokemon;
    } catch (e) {
      print(e);
      return null;
      //throw new Exception(e);
    }
  }

  Future<PokemonModel?> getInfoExtraPokemons(
      PokemonModel pokemon, String int) async {
    try {
      httpClient.timeout = const Duration(seconds: 30);
      final url = 'https://pokeapi.co/api/v2/pokemon-species/${int}';
      Response resp = await httpClient.get(url);
      pokemon.Categorias =
          (resp.body as List).map((x) => Categoria.fromMap(x)).toList();
      return pokemon;
    } catch (e) {
      print(e);
      return null;
      //throw new Exception(e);
    }
  }

  Future<List<TipoPokemon>?> getTiposPokemons() async {
    try {
      httpClient.timeout = const Duration(seconds: 30);
      Response resp = await httpClient.get('https://pokeapi.co/api/v2/type/');
      var listaTipo = (resp.body["results"] as List)
          .map((x) => TipoPokemon.fromMap(x))
          .toList();
      return listaTipo;
    } catch (e) {
      print(e);
      return null;
      //throw new Exception(e);
    }
  }

  Future<List<Categoria>?> getCategoriaPokemons() async {
    try {
      httpClient.timeout = const Duration(seconds: 30);
      Response resp =
          await httpClient.get('https://pokeapi.co/api/v2/egg-group/');
      var listaTipo = (resp.body["results"] as List)
          .map((x) => Categoria.fromMap(x))
          .toList();
      return listaTipo;
    } catch (e) {
      print(e);
      return null;
      //throw new Exception(e);
    }
  }

  Future<List<Habilidades>?> getHabilidadePokemons() async {
    try {
      httpClient.timeout = const Duration(seconds: 30);
      Response resp =
          await httpClient.get('https://pokeapi.co/api/v2/ability/');
      var listaTipo = (resp.body["results"] as List)
          .map((x) => Habilidades.fromMap(x))
          .toList();
      return listaTipo;
    } catch (e) {
      print(e);
      return null;
      //throw new Exception(e);
    }
  }
}
