import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:example/models/pokemon.dart';
import 'package:example/services/pokemon/pokemon_service.dart';

part 'pokemon_event.dart';
part 'pokemon_state.dart';

class PokemonBloc extends Bloc<PokemonEvent, PokemonState> {
  final IPokemonService _pokemonService;

  List<Pokemon> _pokemons = [];

  PokemonBloc(this._pokemonService) : super(PokemonInitial()) {
    on<GetPokemons>((event, emit) => _getPokemons(event, emit));
  }

  Future<void> _getPokemons(
      GetPokemons event, Emitter<PokemonState> emit) async {
    emit(PokemonsLoading());

    if (_pokemons.isEmpty) {
      _pokemons = await _pokemonService.getAll();
    }

    emit(PokemonsLoaded(_pokemons));
  }
}
