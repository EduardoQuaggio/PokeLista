import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:pokelista/Base/api/pokemon_api.dart';
import 'package:pokelista/Base/models/pokemon%20_%20model.dart';

class PokelistaController extends GetxController {
  late RxList<PokemonModel>? pokemons = <PokemonModel>[].obs;
  late RxList<PokemonModel>? pokemonsFavoritos = <PokemonModel>[].obs;
  var listaFavoritosVisivel = false.obs;
  var isLoading = false.obs;
  var isLoadingModal = false.obs;
  // PokelistaController() {
  //   carregarListaPokemon();
  // }

  Future<void> onInit() async {
    super.onInit();
    carregarListaPokemon();
  }

  Future<void> carregarListaPokemon() async {
    try {
      isLoading.value = true;
      for (var i = 1; i < 16; i++) {
        var pokemon = await PokemonApi().getInfoPokemons('${i}');
        pokemons!.add(pokemon!);
      }
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
      print(e);
    }
  }

  Future<void> listaPokemonsFavoritos() async {
    pokemonsFavoritos!.value = [];
    if (listaFavoritosVisivel.value == false) {
      isLoading.value = true;
      listaFavoritosVisivel.value = true;
      pokemonsFavoritos!
          .addAll(pokemons!.where((element) => element.favorito == true));
      isLoading.value = false;
    } else {
      isLoading.value = true;
      listaFavoritosVisivel.value = false;
      isLoading.value = false;
    }
  }

  Future<void> FavoritarPokemon(int index, bool favorito) async {
    if (!favorito) {
      if (pokemons![index].favorito!) {
        pokemons![index].favorito = false;
      } else {
        pokemons![index].favorito = true;
      }
    } else {
      if (pokemons![index].favorito!) {
        pokemons![index].favorito = false;
      } else {
        pokemons![index].favorito = true;
      }
    }
  }

  Future<void> carregarInformacoesExtras(
      PokemonModel pokemon, int index) async {
    try {
      isLoadingModal.value = true;

      var descricoes =
          await PokemonApi().getInfoExtraPokemons(pokemon, '${index}');
      // pokemons![index - 1].descricao = descricoes![0];
      isLoadingModal.value = false;
    } catch (e) {
      isLoadingModal.value = false;
      print(e);
    }
  }
}
