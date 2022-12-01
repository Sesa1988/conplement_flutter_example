import 'dart:async';

import 'package:example/models/pokemon.dart';
import 'package:example/screens/pokemon/bloc/pokemon_bloc.dart';
import 'package:example/screens/pokemon/widgets/pokemon_card.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PokemonCollection extends StatelessWidget {
  final List<Pokemon> pokemons;

  const PokemonCollection(this.pokemons);

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () {
        context.read<PokemonBloc>().add(const GetPokemons(forceRefresh: true));
        return Completer<void>().future;
      },
      child: ScrollConfiguration(
        behavior: ScrollConfiguration.of(context).copyWith(
          dragDevices: {
            PointerDeviceKind.mouse,
            PointerDeviceKind.touch,
            PointerDeviceKind.trackpad,
          },
        ),
        child: ListView.separated(
          separatorBuilder: (context, index) {
            return const Divider(height: 1);
          },
          itemCount: pokemons.length,
          itemBuilder: (context, index) {
            var pokemon = pokemons[index];
            return PokemonCard(pokemon.name);
          },
        ),
      ),
    );
  }
}
