import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:pokelista/App/controllers/pokelista_controllers.dart';

import 'cadastropokemon_page.dart';

class PokelistaPage extends StatefulWidget {
  const PokelistaPage({Key? key}) : super(key: key);
  final exibirListaFavoritos = false;
  @override
  _PokelistaPageState createState() => _PokelistaPageState();
}

class _PokelistaPageState extends State<PokelistaPage> {
  late PokelistaController controller;

  @override
  void initState() {
    controller = Get.put(PokelistaController());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SafeArea(
          child: Material(
        child: Scaffold(
          appBar: AppBar(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "PokeLista",
                ),
                IconButton(
                  onPressed: () {
                    controller.listaPokemonsFavoritos();
                  },
                  icon: const Icon(
                    Icons.star_outline,
                    color: Colors.white,
                  ),
                )
              ],
            ),
            backgroundColor: Colors.red,
          ),
          body: Stack(
            children: [
              controller.isLoading == true
                  ? AlertDialog(
                      content: SingleChildScrollView(
                          child: Column(
                        children: const [
                          CircularProgressIndicator(),
                          Text('Loading..'),
                        ],
                      )),
                    )
                  : controller.listaFavoritosVisivel == false
                      ? ListView.builder(
                          itemCount: controller.pokemons!.length,
                          itemBuilder: (context, index) {
                            return Card(
                                child: GestureDetector(
                              onTap: () {
                                controller.carregarInformacoesExtras(
                                    controller.pokemons![index],
                                    controller.pokemons![index].id!);
                                controller.isLoadingModal == true
                                    ? AlertDialog(
                                        content: SingleChildScrollView(
                                            child: Column(
                                          children: const [
                                            CircularProgressIndicator(),
                                            Text('Loading..'),
                                          ],
                                        )),
                                      )
                                    : showModalBottomSheet<void>(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return Container(
                                            height: 200,
                                            color: Colors.white,
                                            child: Center(
                                              child: Column(
                                                children: <Widget>[
                                                  Row(
                                                    children: [
                                                      Image.network(controller
                                                          .pokemons![index]
                                                          .spritePokemon!
                                                          .frontdefault!),
                                                      Column(
                                                        children: [
                                                          Text(controller
                                                              .pokemons![index]
                                                              .name!),
                                                        ],
                                                      ),
                                                      IconButton(
                                                        onPressed: () {
                                                          controller
                                                              .FavoritarPokemon(
                                                                  index, false);

                                                          setState(() {
                                                            controller
                                                                .pokemons!;
                                                          });
                                                        },
                                                        icon: const Icon(
                                                          Icons.star_outline,
                                                          color: Colors.grey,
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                  Text(controller
                                                      .pokemons![index]
                                                      .Categorias![0]
                                                      .nomeCategoria!),
                                                  ElevatedButton(
                                                    child: const Text(
                                                        'Close BottomSheet'),
                                                    onPressed: () =>
                                                        Navigator.pop(context),
                                                  )
                                                ],
                                              ),
                                            ),
                                          );
                                        },
                                      );
                              },
                              child: ListTile(
                                  title:
                                      Text(controller.pokemons![index].name!),
                                  subtitle: Text(controller.pokemons![index].id
                                      .toString()),
                                  leading: Image.network(controller
                                      .pokemons![index]
                                      .spritePokemon!
                                      .frontdefault!),
                                  trailing: Icon(
                                    Icons.star_rate,
                                    color:
                                        controller.pokemons![index].favorito ==
                                                true
                                            ? Colors.amber
                                            : Colors.grey,
                                  )),
                            ));
                          })
                      : ListView.builder(
                          itemCount: controller.pokemonsFavoritos!.length,
                          itemBuilder: (context, index) {
                            return Card(
                              child: ListTile(
                                title: Text(
                                    controller.pokemonsFavoritos![index].name!),
                                subtitle: Text(controller
                                    .pokemonsFavoritos![index].id
                                    .toString()),
                                leading: Image.network(controller
                                    .pokemonsFavoritos![index]
                                    .spritePokemon!
                                    .frontdefault!),
                                trailing: Icon(
                                  Icons.star_rate,
                                  color: controller.pokemonsFavoritos![index]
                                              .favorito ==
                                          true
                                      ? Colors.amber
                                      : Colors.grey,
                                ),
                              ),
                            );
                          }),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    color: Colors.red,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Get.back();
                            },
                            child: Column(
                              children: const [
                                Icon(
                                  Icons.home,
                                  color: Colors.white,
                                ),
                                Text(
                                  'DashBoard',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                          GestureDetector(
                            child: Column(
                              children: const [
                                Icon(
                                  Icons.list,
                                  color: Colors.black,
                                ),
                                Text(
                                  'Pokelista',
                                  style: TextStyle(color: Colors.black),
                                ),
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.back();
                              Get.to(const CadastroPokemonsPage());
                            },
                            child: Column(
                              children: const [
                                Icon(
                                  Icons.add,
                                  color: Colors.white,
                                ),
                                Text(
                                  'Cadastro',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      )),
    );
  }
}
