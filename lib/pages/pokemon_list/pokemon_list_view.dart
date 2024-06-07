import 'package:flutter/material.dart';
import 'package:pokemon_app/helper/helper.dart';
import 'package:pokemon_app/pages/pokemon_list/components/pokemon_grid.dart';
import 'package:pokemon_app/pages/pokemon_list/pokemon_list_viewmodel.dart';
import 'package:provider/provider.dart';

class PokemonListView extends StatelessWidget {
  const PokemonListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Title
              Text(
                capitalize('PokeDex'),
                style: Theme.of(context).textTheme.headline4?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
              ),
              const SizedBox(height: 16),

              // Grid
              ChangeNotifierProvider(
                create: (_) => PokemonListViewmodel()..init(),
                child: Consumer<PokemonListViewmodel>(
                  builder: (context, viewmodel, _) {
                    return Expanded(
                      child: viewmodel.isLoading
                          ? const Center(
                              child: CircularProgressIndicator(),
                            )
                          : PokemonGrid(
                              pokemonList: viewmodel.pokemonList,
                              onTapItem: viewmodel.onTapItem,
                            ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
