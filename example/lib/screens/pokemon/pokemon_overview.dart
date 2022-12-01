import 'package:example/screens/pokemon/bloc/pokemon_bloc.dart';
import 'package:example/screens/pokemon/widgets/pokemon_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PokemonOverview extends StatefulWidget {
  static const String routeName = "/pokemons";

  const PokemonOverview({Key? key}) : super(key: key);

  @override
  State<PokemonOverview> createState() => _PokemonOverviewState();
}

class _PokemonOverviewState extends State<PokemonOverview> {
  @override
  void initState() {
    super.initState();
    context.read<PokemonBloc>().add(GetPokemons());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pokemons')),
      body: BlocBuilder<PokemonBloc, PokemonState>(
        builder: (context, state) {
          if (state is PokemonsLoading) {
            return const CircularProgressIndicator();
          }
          if (state is PokemonsLoaded) {
            return ListView.separated(
              separatorBuilder: (context, index) {
                return const Divider(height: 1);
              },
              itemCount: state.pokemons.length,
              itemBuilder: (context, index) {
                var pokemon = state.pokemons[index];
                return PokemonCard(pokemon.name, pokemon.url);
              },
            );
          }
          return Container();
        },
      ),
    );
  }
}
