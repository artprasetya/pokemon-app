import 'package:flutter/material.dart';
import 'package:pokemon_app/models/pokemon.dart';
import 'package:pokemon_app/pages/detail/components/tabs/tab_about.dart';
import 'package:pokemon_app/pages/detail/components/tabs/tab_base_stat.dart';

class PokemonTabs extends StatelessWidget {
  final Pokemon? pokemon;

  const PokemonTabs({
    Key? key,
    this.pokemon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const TabBar(
            labelColor: Colors.black,
            labelStyle: TextStyle(
              fontWeight: FontWeight.bold,
            ),
            indicatorColor: Colors.black,
            indicatorWeight: 2,
            indicatorPadding: EdgeInsets.symmetric(horizontal: 24),
            unselectedLabelColor: Colors.grey,
            tabs: [
              Tab(text: 'About'),
              Tab(text: 'Base Stats'),
            ],
          ),
          SizedBox(
            height: 200,
            child: TabBarView(
              children: [
                TabAbout(pokemon: pokemon),
                TabBaseStat(pokemon: pokemon),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
