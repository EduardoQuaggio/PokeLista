import 'package:get/get.dart';
import 'package:pokelista/Base/models/pokemon%20_%20model.dart';

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
}
