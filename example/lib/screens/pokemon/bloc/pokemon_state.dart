part of 'pokemon_bloc.dart';

abstract class PokemonState extends Equatable {
  const PokemonState();

  @override
  List<Object> get props => [];
}

class PokemonInitial extends PokemonState {}

class PokemonsLoading extends PokemonState {}

class PokemonsError extends PokemonState {
  final List<Pokemon> pokemons;

  const PokemonsError(this.pokemons);

  @override
  List<Object> get props => [pokemons];
}

class PokemonsLoaded extends PokemonState {
  final List<Pokemon> pokemons;

  const PokemonsLoaded(this.pokemons);

  @override
  List<Object> get props => [pokemons];
}
