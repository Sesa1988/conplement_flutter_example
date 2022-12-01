import 'package:example/screens/pokemon/bloc/pokemon_bloc.dart';
import 'package:example/screens/pokemon/widgets/pokemon_collection.dart';
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
    context.read<PokemonBloc>().add(const GetPokemons());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pokemons')),
      body: BlocBuilder<PokemonBloc, PokemonState>(
        builder: (context, state) {
          if (state is PokemonsLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is PokemonsError) {
            return const Center(child: Text('Error'));
          }
          if (state is PokemonsLoaded) {
            return PokemonCollection(state.pokemons);
          }
          return Container();
        },
      ),
    );
  }
}
