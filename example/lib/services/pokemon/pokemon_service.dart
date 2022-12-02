import 'dart:async';
import 'dart:convert';

import 'package:example/models/pokemon.dart';
import 'package:http/http.dart';
import 'package:retry/retry.dart';

abstract class IPokemonService {
  Future<List<Pokemon>> getAll();
}

class PokemonService implements IPokemonService {
  @override
  Future<List<Pokemon>> getAll() async {
    final response = await retry(
      () => Client()
          .get(Uri.https(
            'pokeapi.co',
            '/api/v2/pokemon',
            {
              'limit': '100',
              'offset': '0',
            },
          ))
          .timeout(const Duration(seconds: 15)),
      retryIf: (e) => e is TimeoutException,
      maxAttempts: 3,
    );

    if (response.statusCode == 200) {
      var bodyResponse = json.decode(response.body);
      Iterable data = bodyResponse['results'];

      return List<Pokemon>.from(
        data.map((model) => Pokemon.fromMap(model)),
      );
    }
    throw Exception("Error while pokemons");
  }
}
