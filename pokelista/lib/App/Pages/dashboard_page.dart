import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokelista/App/Pages/pokelista_page.dart';
import 'package:pokelista/App/controllers/pokelista_controllers.dart';

import 'cadastropokemon_page.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  late PokelistaController controller;

  @override
  void initState() {
    controller = Get.put(PokelistaController());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Material(
        child: Scaffold(
          appBar: AppBar(
            title: const Text(
              "DashBoard PokeLista",
            ),
            backgroundColor: Colors.red,
          ),
          body: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Get.to(PokelistaPage(
                            controller: controller,
                          ));
                        },
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text('Lista de Pokemons'),
                                Text('Ver Lista'),
                              ],
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.to(CadastroPokemonsPage(controller: controller));
                        },
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text('Sempre quis ter seu pokemon ?'),
                                Text('Cadastre seu pokemon aqui'),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
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
                            child: Column(
                              children: const [
                                Icon(
                                  Icons.home,
                                  color: Colors.black,
                                ),
                                Text(
                                  'DashBoard',
                                  style: TextStyle(color: Colors.black),
                                ),
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.back();
                              Get.to(PokelistaPage(
                                controller: controller,
                              ));
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
                            onTap: () {
                              Get.back();
                              Get.to(CadastroPokemonsPage(
                                controller: controller,
                              ));
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
      ),
    );
  }
}
