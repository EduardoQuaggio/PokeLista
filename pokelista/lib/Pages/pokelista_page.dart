import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:pokelista/Pages/dashboard_page.dart';

import 'cadastropokemon_page.dart';

class PokelistaPage extends StatefulWidget {
  const PokelistaPage({Key? key}) : super(key: key);

  @override
  _PokelistaPageState createState() => _PokelistaPageState();
}

class _PokelistaPageState extends State<PokelistaPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Material(
        child: Scaffold(
          appBar: AppBar(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  "PokeLista",
                ),
                IconButton(
                  onPressed: null,
                  icon: Icon(
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
              const Center(
                child: Text('Pokelista'),
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
      ),
    );
  }
}
