import 'package:flutter/material.dart';
import 'package:pokemon_app/model/pokemon.dart';

class PokemonCardItem extends StatelessWidget {
  final int index;
  final Pokemon? pokemon;
  final Function(Pokemon?) onTapPokemon;

  const PokemonCardItem({
    Key? key,
    this.index = 0,
    this.pokemon,
    required this.onTapPokemon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black12),
        borderRadius: const BorderRadius.all(Radius.circular(18)),
      ),
      child: InkWell(
        borderRadius: const BorderRadius.all(Radius.circular(18)),
        onTap: () => onTapPokemon(pokemon),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                  "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/${index + 1}.png"),
              const SizedBox(height: 8),
              Text(pokemon?.name ?? ''),
            ],
          ),
        ),
      ),
    );
  }
}
