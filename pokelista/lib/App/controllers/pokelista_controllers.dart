import 'package:get/get.dart';
import 'package:pokelista/Base/api/pokemon_api.dart';
import 'package:pokelista/Base/models/pokemon%20_%20model.dart';

class PokelistaController extends GetxController {
  late List<PokemonModel> Pokemons;

  PokelistaController() {
    carregarListaPokemon();
  }

  Future<void> carregarListaPokemon() async {
    Pokemons = [];
    for (var i = 1; i < 16; i++) {
      var pokemon = await PokemonApi().getInfoPokemons('${i}');
      Pokemons.add(pokemon!);
    }
  }
}
