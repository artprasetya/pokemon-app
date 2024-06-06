import 'package:flutter/widgets.dart';
import 'package:pokemon_app/model/pokemon.dart';
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

  void onTapItem(Pokemon? pokemon) {
    // TODO: Navigate to detail
  }

  ///
  /// Private Methods
  ///

  Future<void> _getPokemonList() async {
    pokemonList = await services.getPokemonList();
  }
}
