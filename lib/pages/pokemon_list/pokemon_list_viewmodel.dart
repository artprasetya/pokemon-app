import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pokemon_app/models/pokemon.dart';
import 'package:pokemon_app/pages/detail/pokemon_detail_view.dart';
import 'package:pokemon_app/services/api.dart';

class PokemonListViewmodel extends ChangeNotifier {
  PokemonAPI services = PokemonAPI();

  ///
  /// Getters and Setters
  ///

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  List<Pokemon>? _pokemonList = [];
  List<Pokemon>? get pokemonList => _pokemonList;
  set pokemonList(List<Pokemon>? value) {
    _pokemonList = value;
    notifyListeners();
  }

  ///
  /// Public Methods
  ///

  Future<void> init() async {
    isLoading = true;
    await _getPokemonList();
    isLoading = false;
  }

  void onTapItem(BuildContext context, Pokemon? pokemon) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => PokemonDetailView(pokemon: pokemon)),
    );
  }

  ///
  /// Private Methods
  ///

  Future<void> _getPokemonList() async {
    try {
      pokemonList = await services.getPokemonList();
    } catch (e) {
      if (kDebugMode) {
        print('Error: $e');
      }
    }
  }
}
