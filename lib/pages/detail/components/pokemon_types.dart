import 'package:flutter/material.dart';
import 'package:pokemon_app/helper/helper.dart';
import 'package:pokemon_app/models/pokemon.dart';

class PokemonTypes extends StatelessWidget {
  const PokemonTypes({
    Key? key,
    required this.pokemon,
  }) : super(key: key);

  final Pokemon? pokemon;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: pokemon?.types
              ?.map(
                (type) => Row(
                  children: [
                    Chip(
                      label: Text(
                        capitalize(type.type?.name ?? ''),
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ),
                    const SizedBox(width: 8),
                  ],
                ),
              )
              .toList() ??
          [],
    );
  }
}
