import 'package:flutter/foundation.dart';
import 'package:pokemon_app/models/pokemon.dart';
import 'package:pokemon_app/services/api.dart';

class PokemonDetailViewmodel extends ChangeNotifier {
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

  Pokemon? _pokemon;
  Pokemon? get pokemon => _pokemon;
  set pokemon(Pokemon? value) {
    _pokemon = value;
    notifyListeners();
  }

  ///
  /// Public Methods
  ///
  Future<void> init(Pokemon? pokemon) async {
    isLoading = true;
    await _getDetailPokemon(pokemon);
    isLoading = false;
  }

  ///
  /// Private Methods
  ///

  Future<void> _getDetailPokemon(Pokemon? data) async {
    try {
      pokemon = await services.getDetailPokemon(data?.url ?? '');
    } catch (e) {
      if (kDebugMode) {
        print('Error: $e');
      }
    }
  }
}
