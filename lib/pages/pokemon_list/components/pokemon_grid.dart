import 'package:flutter/widgets.dart';
import 'package:pokemon_app/models/pokemon.dart';
import 'package:pokemon_app/pages/pokemon_list/components/pokemon_card_item.dart';

class PokemonGrid extends StatelessWidget {
  final List<Pokemon>? pokemonList;
  final Function(BuildContext, Pokemon?) onTapItem;

  const PokemonGrid({
    Key? key,
    this.pokemonList = const [],
    required this.onTapItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return GridView.builder(
          shrinkWrap: true,
          itemCount: pokemonList?.length,
          itemBuilder: (context, index) => PokemonCardItem(
            index: index,
            pokemon: pokemonList?[index],
            onTapPokemon: onTapItem,
          ),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: constraints.maxWidth > 700 ? 4 : 2,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
          ),
        );
      },
    );
  }
}
