import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:pokelista/App/controllers/pokelista_controllers.dart';

import 'cadastropokemon_page.dart';

class PokelistaPage extends StatefulWidget {
  final PokelistaController controller;
  const PokelistaPage({Key? key, required this.controller}) : super(key: key);
  final exibirListaFavoritos = false;
  @override
  _PokelistaPageState createState() => _PokelistaPageState();
}

class _PokelistaPageState extends State<PokelistaPage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
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
                      widget.controller.listaPokemonsFavoritos();
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
            body: widget.controller.isLoading == true
                ? AlertDialog(
                    content: SingleChildScrollView(
                        child: Column(
                      children: const [
                        CircularProgressIndicator(),
                        Text('Loading..'),
                      ],
                    )),
                  )
                : widget.controller.listaFavoritosVisivel == false
                    ? Padding(
                        padding: const EdgeInsets.only(bottom: 50.0),
                        child: ListView.builder(
                            itemCount: widget.controller.pokemons!.length,
                            itemBuilder: (context, index) {
                              return Card(
                                  child: GestureDetector(
                                onTap: () {
                                  // controller.carregarInformacoesExtras(
                                  //     controller.pokemons![index],
                                  //     controller.pokemons![index].id!);
                                  // controller.isLoadingModal == true
                                  //     ?AlertDialog(
                                  //     content: SingleChildScrollView(
                                  //         child: Column(
                                  //       children: const [
                                  //         CircularProgressIndicator(),
                                  //         Text('Loading..'),
                                  //       ],
                                  //     )),
                                  //   )
                                  // :
                                  showModalBottomSheet<void>(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return Container(
                                        height: 300,
                                        color: Colors.white,
                                        child: Center(
                                          child: Column(
                                            children: <Widget>[
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Row(
                                                    children: [
                                                      !widget
                                                              .controller
                                                              .pokemons![index]
                                                              .adicionado
                                                          ? Image.network(widget
                                                              .controller
                                                              .pokemons![index]
                                                              .spritePokemon!
                                                              .frontdefault!)
                                                          : SizedBox(
                                                              height:
                                                                  width * 0.45,
                                                              width:
                                                                  width * 0.35,
                                                              child: Image.file(widget
                                                                  .controller
                                                                  .pokemonCriado!
                                                                  .FotoPokemon!),
                                                            ),
                                                      widget
                                                              .controller
                                                              .pokemons![index]
                                                              .adicionado
                                                          ? Column(
                                                              children: [
                                                                Text(widget
                                                                    .controller
                                                                    .pokemons![
                                                                        index]
                                                                    .name!),
                                                                Text(widget
                                                                    .controller
                                                                    .pokemons![
                                                                        index]
                                                                    .tipo![0]
                                                                    .name!),
                                                                Text(widget
                                                                    .controller
                                                                    .pokemons![
                                                                        index]
                                                                    .Categorias![
                                                                        0]
                                                                    .nomeCategoria!),
                                                                Text(widget
                                                                    .controller
                                                                    .pokemons![
                                                                        index]
                                                                    .habilidades![
                                                                        0]
                                                                    .name!),
                                                              ],
                                                            )
                                                          : Text(widget
                                                              .controller
                                                              .pokemons![index]
                                                              .name!),
                                                    ],
                                                  ),
                                                  IconButton(
                                                    onPressed: () {
                                                      widget.controller
                                                          .FavoritarPokemon(
                                                              index, false);
                                                    },
                                                    icon: const Icon(
                                                      Icons.star_outline,
                                                      color: Colors.grey,
                                                    ),
                                                  )
                                                ],
                                              ),
                                              ElevatedButton(
                                                child:
                                                    const Text('Gotta Catch'),
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
                                    title: Text(widget
                                        .controller.pokemons![index].name!),
                                    subtitle: Text(widget
                                        .controller.pokemons![index].id
                                        .toString()),
                                    leading: !widget.controller.pokemons![index]
                                            .adicionado
                                        ? Image.network(widget
                                            .controller
                                            .pokemons![index]
                                            .spritePokemon!
                                            .frontdefault!)
                                        : SizedBox(
                                            height: width * 0.45,
                                            width: width * 0.35,
                                            child: Image.file(widget.controller
                                                .pokemonCriado!.FotoPokemon!),
                                          ),
                                    trailing: Icon(
                                      Icons.star_rate,
                                      color: widget.controller.pokemons![index]
                                                  .favorito ==
                                              true
                                          ? Colors.amber
                                          : Colors.grey,
                                    )),
                              ));
                            }),
                      )
                    : Padding(
                        padding: const EdgeInsets.only(bottom: 50.0),
                        child: ListView.builder(
                            itemCount:
                                widget.controller.pokemonsFavoritos!.length,
                            itemBuilder: (context, index) {
                              return Card(
                                  child: GestureDetector(
                                onTap: () {
                                  // controller.carregarInformacoesExtras(
                                  //     controller.pokemons![index],
                                  //     controller.pokemons![index].id!);
                                  // controller.isLoadingModal == true
                                  //     ?AlertDialog(
                                  //     content: SingleChildScrollView(
                                  //         child: Column(
                                  //       children: const [
                                  //         CircularProgressIndicator(),
                                  //         Text('Loading..'),
                                  //       ],
                                  //     )),
                                  //   )
                                  // :
                                  showModalBottomSheet<void>(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return Container(
                                        height: 300,
                                        color: Colors.white,
                                        child: Center(
                                          child: Column(
                                            children: <Widget>[
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Row(
                                                    children: [
                                                      !widget
                                                              .controller
                                                              .pokemonsFavoritos![
                                                                  index]
                                                              .adicionado
                                                          ? Image.network(widget
                                                              .controller
                                                              .pokemonsFavoritos![
                                                                  index]
                                                              .spritePokemon!
                                                              .frontdefault!)
                                                          : SizedBox(
                                                              height:
                                                                  width * 0.45,
                                                              width:
                                                                  width * 0.35,
                                                              child: Image.file(widget
                                                                  .controller
                                                                  .pokemonsFavoritos![
                                                                      index]
                                                                  .FotoPokemon!),
                                                            ),
                                                      widget
                                                              .controller
                                                              .pokemonsFavoritos![
                                                                  index]
                                                              .adicionado
                                                          ? Column(
                                                              children: [
                                                                Text(widget
                                                                    .controller
                                                                    .pokemonsFavoritos![
                                                                        index]
                                                                    .name!),
                                                                Text(widget
                                                                    .controller
                                                                    .pokemonsFavoritos![
                                                                        index]
                                                                    .tipo![0]
                                                                    .name!),
                                                                Text(widget
                                                                    .controller
                                                                    .pokemonsFavoritos![
                                                                        index]
                                                                    .Categorias![
                                                                        0]
                                                                    .nomeCategoria!),
                                                                Text(widget
                                                                    .controller
                                                                    .pokemonsFavoritos![
                                                                        index]
                                                                    .habilidades![
                                                                        0]
                                                                    .name!),
                                                              ],
                                                            )
                                                          : Text(widget
                                                              .controller
                                                              .pokemonsFavoritos![
                                                                  index]
                                                              .name!),
                                                    ],
                                                  ),
                                                  IconButton(
                                                    onPressed: () {
                                                      widget.controller
                                                          .FavoritarPokemon(
                                                              index, false);
                                                    },
                                                    icon: const Icon(
                                                      Icons.star_outline,
                                                      color: Colors.grey,
                                                    ),
                                                  )
                                                ],
                                              ),
                                              ElevatedButton(
                                                child:
                                                    const Text('Gotta Catch'),
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
                                    title: Text(widget.controller
                                        .pokemonsFavoritos![index].name!),
                                    subtitle: Text(widget
                                        .controller.pokemonsFavoritos![index].id
                                        .toString()),
                                    leading: !widget
                                            .controller
                                            .pokemonsFavoritos![index]
                                            .adicionado
                                        ? Image.network(widget
                                            .controller
                                            .pokemonsFavoritos![index]
                                            .spritePokemon!
                                            .frontdefault!)
                                        : SizedBox(
                                            height: width * 0.45,
                                            width: width * 0.35,
                                            child: Image.file(widget
                                                .controller
                                                .pokemonsFavoritos![index]
                                                .FotoPokemon!),
                                          ),
                                    trailing: Icon(
                                      Icons.star_rate,
                                      color: widget
                                                  .controller
                                                  .pokemonsFavoritos![index]
                                                  .favorito ==
                                              true
                                          ? Colors.amber
                                          : Colors.grey,
                                    )),
                              ));
                            }),
                      ),
            bottomSheet: Container(
              height: 60,
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
                        Get.to(CadastroPokemonsPage(
                            controller: widget.controller));
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
          ),
        ),
      ),
    );
  }
}
