import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pokemon_app/models/pokemon.dart';

class PokemonAPI {
  Future<List<Pokemon>?> getPokemonList() async {
    List<Pokemon> pokemonList = [];

    final response =
        await http.get(Uri.parse("https://pokeapi.co/api/v2/pokemon"));

    if (response.statusCode == 200) {
      Map<String, dynamic> jsonResponse = jsonDecode(response.body);

      for (var pokemon in jsonResponse['results']) {
        pokemonList.add(Pokemon.fromJson(pokemon));
      }

      return pokemonList;
    } else {
      throw Exception('Failed to load pokemon list');
    }
  }

  Future<Pokemon?> getDetailPokemon(String url) async {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      Map<String, dynamic> jsonResponse = jsonDecode(response.body);
      return Pokemon.fromJson(jsonResponse);
    } else {
      throw Exception('Failed to load pokemon');
    }
  }
}
