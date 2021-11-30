import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:pokelista/App/Pages/pokelista_page.dart';

import 'package:pokelista/App/controllers/pokelista_controllers.dart';
import 'package:pokelista/Base/models/categoria_modal.dart';
import 'package:pokelista/Base/models/habilidades_model.dart';
import 'package:pokelista/Base/models/tipo_model.dart';

class CadastroPokemonsPage extends StatefulWidget {
  final PokelistaController controller;
  const CadastroPokemonsPage({Key? key, required this.controller})
      : super(key: key);
  @override
  _CadastroPokemonsPageState createState() => _CadastroPokemonsPageState();
}

class _CadastroPokemonsPageState extends State<CadastroPokemonsPage> {
  @override
  void initState() {
    super.initState();
    widget.controller.carregarListaCadastro();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Obx(
      () => SafeArea(
        child: Material(
          child: Scaffold(
            appBar: AppBar(
              title: const Text(
                "Cadastro Pokemon",
              ),
              backgroundColor: Colors.red,
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  widget.controller.isLoading == true
                      ? AlertDialog(
                          content: SingleChildScrollView(
                              child: Column(
                            children: const [
                              CircularProgressIndicator(),
                              Text('Loading..'),
                            ],
                          )),
                        )
                      : Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SizedBox(
                                  width: width / 2.2,
                                  child: DropdownButton<String>(
                                    hint: const Text('Categoria'),
                                    value: widget
                                        .controller
                                        .categoriaPokemonSelecionado!
                                        .value
                                        .nomeCategoria,
                                    icon: const Icon(
                                      Icons.arrow_downward,
                                    ),
                                    iconSize: 24,
                                    elevation: 16,
                                    style: const TextStyle(color: Colors.red),
                                    underline: Container(
                                      height: 2,
                                      color: Colors.redAccent,
                                    ),
                                    onChanged: (String? newValue) {
                                      widget.controller
                                          .selecionarPicker(newValue, 0);
                                    },
                                    items: widget.controller.categoriasPokemon!
                                        .map((Categoria categoria) {
                                      return DropdownMenuItem<String>(
                                        value: categoria.nomeCategoria,
                                        child: Text(categoria.nomeCategoria!),
                                      );
                                    }).toList(),
                                  ),
                                ),
                                SizedBox(
                                  width: width / 2.2,
                                  child: DropdownButton<String>(
                                    hint: const Text('Tipo'),
                                    value: widget.controller
                                        .tipoPokemonSelecionado!.value.name,
                                    icon: const Icon(Icons.arrow_downward),
                                    iconSize: 24,
                                    elevation: 16,
                                    style: const TextStyle(color: Colors.red),
                                    underline: Container(
                                      height: 2,
                                      color: Colors.redAccent,
                                    ),
                                    onChanged: (String? newValue) {
                                      widget.controller
                                          .selecionarPicker(newValue, 1);
                                    },
                                    items: widget.controller.tiposPokemon!
                                        .map((TipoPokemon tipoPokemon) {
                                      return DropdownMenuItem<String>(
                                        value: tipoPokemon.name,
                                        child: Text(tipoPokemon.name!),
                                      );
                                    }).toList(),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: width * 0.95,
                              child: DropdownButton<String>(
                                hint: const Text('Habilidade'),
                                value: widget.controller
                                    .habilidadePokemonSelecionado!.value.name,
                                icon: const Icon(Icons.arrow_downward),
                                iconSize: 24,
                                elevation: 16,
                                style: const TextStyle(color: Colors.red),
                                underline: Container(
                                  height: 2,
                                  color: Colors.redAccent,
                                ),
                                onChanged: (String? newValue) {
                                  widget.controller
                                      .selecionarPicker(newValue, 2);
                                },
                                items: widget.controller.habilidadesPokemon!
                                    .map((Habilidades habilidades) {
                                  return DropdownMenuItem<String>(
                                    value: habilidades.name,
                                    child: Text(habilidades.name!),
                                  );
                                }).toList(),
                              ),
                            ),
                          ],
                        ),
                ],
              ),
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
                      onTap: () {
                        Get.back();
                        Get.to(PokelistaPage(controller: widget.controller));
                      },
                      child: Column(
                        children: const [
                          Icon(
                            Icons.list,
                            color: Colors.white,
                          ),
                          Text(
                            'Pokelista',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      child: Column(
                        children: const [
                          Icon(
                            Icons.add,
                            color: Colors.black,
                          ),
                          Text(
                            'Cadastro',
                            style: TextStyle(color: Colors.black),
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
