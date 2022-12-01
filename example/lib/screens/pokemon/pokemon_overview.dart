import 'package:example/screens/pokemon_details/pokemon_details.dart';
import 'package:flutter/material.dart';

class PokemonOverview extends StatelessWidget {
  static const String routeName = "/pokemons";

  const PokemonOverview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pokemons')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).pushNamed(PokemonDetails.routeName);
          },
          child: const Text('go details'),
        ),
      ),
    );
  }
}
