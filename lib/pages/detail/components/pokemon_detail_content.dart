import 'package:flutter/material.dart';
import 'package:pokemon_app/models/pokemon.dart';
import 'package:pokemon_app/pages/detail/components/pokemon_tabs.dart';
import 'package:pokemon_app/pages/detail/components/pokemon_types.dart';

class PokemonDetailContent extends StatelessWidget {
  final Pokemon? pokemon;

  const PokemonDetailContent({
    Key? key,
    this.pokemon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Image
            Image.network(
              'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/${pokemon?.id}.png',
              height: 200,
              fit: BoxFit.fitHeight,
            ),
            const SizedBox(height: 16),

            // Types
            PokemonTypes(pokemon: pokemon),
            const SizedBox(height: 8),

            // Tab Bar
            PokemonTabs(pokemon: pokemon),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
