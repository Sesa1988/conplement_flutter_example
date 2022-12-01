import 'package:example/screens/pokemon_details/pokemon_details.dart';
import 'package:flutter/material.dart';

class PokemonCard extends StatelessWidget {
  final String name;

  const PokemonCard(this.name);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context).pushNamed(PokemonDetails.routeName),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Text(name),
      ),
    );
  }
}
