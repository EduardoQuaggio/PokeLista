import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:pokelista/Base/api/pokemon_api.dart';
import 'package:pokelista/Base/models/categoria_modal.dart';
import 'package:pokelista/Base/models/habilidades_model.dart';
import 'package:pokelista/Base/models/pokemon%20_%20model.dart';
import 'package:pokelista/Base/models/tipo_model.dart';

class PokelistaController extends GetxController {
  late RxList<PokemonModel>? pokemons = <PokemonModel>[].obs;
  late RxList<PokemonModel>? pokemonsFavoritos = <PokemonModel>[].obs;
  var listaFavoritosVisivel = false.obs;
  var isLoading = false.obs;
  var isLoadingModal = false.obs;
  List<PokemonModel>? auxListaPokemon;
  List<TipoPokemon>? tiposPokemon = [];
  List<Categoria>? categoriasPokemon = [];
  List<Habilidades>? habilidadesPokemon = [];

  Rx<TipoPokemon>? tipoPokemonSelecionado = TipoPokemon().obs;
  Rx<Categoria>? categoriaPokemonSelecionado = Categoria().obs;
  Rx<Habilidades>? habilidadePokemonSelecionado = Habilidades().obs;
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
      if (auxListaPokemon == null) {
        auxListaPokemon = [];
        for (var i = 1; i < 16; i++) {
          var pokemon = await PokemonApi().getInfoPokemons('${i}');
          auxListaPokemon!.add(pokemon!);
        }
      }
      pokemons!.addAll(auxListaPokemon!);
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
      if (pokemons![index].favorito) {
        auxListaPokemon![index].favorito = false;
      } else {
        auxListaPokemon![index].favorito = true;
      }
    } else {
      if (pokemons![index].favorito) {
        auxListaPokemon![index].favorito = false;
      } else {
        auxListaPokemon![index].favorito = true;
      }
    }

    pokemons!.clear();
    pokemons!.addAll(auxListaPokemon!);
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

  Future<void> carregarListaCadastro() async {
    try {
      try {
        isLoading.value = true;
        tiposPokemon = await PokemonApi().getTiposPokemons();
        categoriasPokemon = await PokemonApi().getCategoriaPokemons();
        habilidadesPokemon = await PokemonApi().getHabilidadePokemons();
        isLoading.value = false;
      } catch (e) {
        isLoading.value = false;
        print(e);
      }
    } catch (e) {}
  }

  Future<void> selecionarPicker(String? nome, int tipo) async {
    try {
      if (tipo == 0)
        categoriaPokemonSelecionado!.value = categoriasPokemon!
            .firstWhere((element) => element.nomeCategoria == nome!);
      else if (tipo == 1)
        tipoPokemonSelecionado!.value =
            tiposPokemon!.firstWhere((element) => element.name == nome!);
      else if (tipo == 2)
        habilidadePokemonSelecionado!.value =
            habilidadesPokemon!.firstWhere((element) => element.name == nome!);
    } catch (e) {
      print(e);
    } catch (e) {}
  }
}
