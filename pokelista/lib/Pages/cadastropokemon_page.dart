import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:pokelista/Pages/dashboard_page.dart';
import 'package:pokelista/Pages/pokelista_page.dart';

class CadastroPokemonsPage extends StatefulWidget {
  const CadastroPokemonsPage({Key? key}) : super(key: key);

  @override
  _CadastroPokemonsPageState createState() => _CadastroPokemonsPageState();
}

class _CadastroPokemonsPageState extends State<CadastroPokemonsPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Material(
        child: Scaffold(
          appBar: AppBar(
            title: const Text(
              "Cadastro de Pokemons",
            ),
            backgroundColor: Colors.red,
          ),
          body: Stack(
            children: [
              Center(
                child: Text('Cadastro'),
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
                              Get.to(const PokelistaPage());
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
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
