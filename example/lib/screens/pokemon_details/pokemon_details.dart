import 'package:flutter/material.dart';

class PokemonDetails extends StatelessWidget {
  static const String routeName = "/pokemons/details";

  const PokemonDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Details')),
      body: const Center(child: Text('hello')),
    );
  }
}
