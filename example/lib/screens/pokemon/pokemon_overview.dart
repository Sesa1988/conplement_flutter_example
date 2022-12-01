import 'package:flutter/material.dart';

class PokemonOverview extends StatelessWidget {
  static const String routeName = "/home";

  const PokemonOverview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pokemons')),
      body: const Center(child: Text('hello')),
    );
  }
}
