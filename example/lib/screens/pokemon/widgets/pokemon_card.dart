import 'package:flutter/material.dart';

class PokemonCard extends StatelessWidget {
  final String name;
  final String url;

  const PokemonCard(this.name, this.url);

  @override
  Widget build(BuildContext context) {
    return Card(child: Text(name));
  }
}
