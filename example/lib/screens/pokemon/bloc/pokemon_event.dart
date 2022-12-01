part of 'pokemon_bloc.dart';

abstract class PokemonEvent extends Equatable {
  const PokemonEvent();

  @override
  List<Object> get props => [];
}

class GetPokemons extends PokemonEvent {
  final bool forceRefresh;

  const GetPokemons({this.forceRefresh = false});

  @override
  List<Object> get props => [forceRefresh];
}
