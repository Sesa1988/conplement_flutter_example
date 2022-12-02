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
      body: BlocConsumer<PokemonBloc, PokemonState>(
        listener: (context, state) {
          if (state is PokemonsError) {
            const snackBar = SnackBar(content: Text('Oh no :('));
            ScaffoldMessenger.of(context).clearSnackBars();
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          }
        },
        builder: (context, state) {
          if (state is PokemonsLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is PokemonsError) {
            if (state.pokemons.isEmpty) return _retry();
            return PokemonCollection(state.pokemons);
          }
          if (state is PokemonsLoaded) {
            return PokemonCollection(state.pokemons);
          }
          return Container();
        },
      ),
    );
  }

  Widget _retry() {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Icon(Icons.sentiment_dissatisfied_outlined, size: 64),
          const SizedBox(height: 5),
          TextButton(
            onPressed: () => context.read<PokemonBloc>().add(
                  const GetPokemons(forceRefresh: true),
                ),
            child: const Text('Retry'),
          ),
        ],
      ),
    );
  }
}
