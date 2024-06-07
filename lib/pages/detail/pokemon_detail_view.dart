import 'package:flutter/material.dart';
import 'package:pokemon_app/helper/helper.dart';
import 'package:pokemon_app/models/pokemon.dart';
import 'package:pokemon_app/pages/detail/components/pokemon_detail_content.dart';
import 'package:pokemon_app/pages/detail/pokemon_detail_viewmodel.dart';
import 'package:provider/provider.dart';

class PokemonDetailView extends StatelessWidget {
  final Pokemon? pokemon;

  const PokemonDetailView({
    Key? key,
    this.pokemon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Button Back
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 8,
                vertical: 8,
              ),
              child: Row(
                children: [
                  IconButton(
                    padding: EdgeInsets.zero,
                    splashRadius: 16,
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.arrow_back),
                  ),
                ],
              ),
            ),

            // Title
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                capitalize(pokemon?.name ?? ''),
                style: Theme.of(context).textTheme.headline5?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
              ),
            ),
            const SizedBox(height: 16),

            // Content
            ChangeNotifierProvider(
              create: (_) => PokemonDetailViewmodel()..init(pokemon),
              child: Consumer<PokemonDetailViewmodel>(
                builder: (context, viewmodel, _) {
                  return Expanded(
                    child: viewmodel.isLoading
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        : PokemonDetailContent(pokemon: viewmodel.pokemon),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
