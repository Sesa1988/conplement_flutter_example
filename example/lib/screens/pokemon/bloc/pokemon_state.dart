part of 'pokemon_bloc.dart';

abstract class PokemonState extends Equatable {
  const PokemonState();

  @override
  List<Object> get props => [];
}

class PokemonInitial extends PokemonState {}

class PokemonsLoading extends PokemonState {}

class PokemonsLoaded extends PokemonState {
  final List<Pokemon> _pokemons;

  const PokemonsLoaded(this._pokemons);

  @override
  List<Object> get props => [_pokemons];
}
