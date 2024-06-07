import 'package:flutter/material.dart';
import 'package:pokemon_app/helper/helper.dart';
import 'package:pokemon_app/models/pokemon.dart';

class PokemonCardItem extends StatelessWidget {
  final int index;
  final Pokemon? pokemon;
  final Function(BuildContext, Pokemon?) onTapPokemon;

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
        onTap: () => onTapPokemon(context, pokemon),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/${index + 1}.png",
                height: 100,
                fit: BoxFit.fitHeight,
              ),
              const SizedBox(height: 8),
              Text(capitalize(pokemon?.name ?? '')),
            ],
          ),
        ),
      ),
    );
  }
}
