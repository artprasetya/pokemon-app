import 'package:flutter/material.dart';
import 'package:pokemon_app/helper/helper.dart';
import 'package:pokemon_app/models/key_value.dart';
import 'package:pokemon_app/models/pokemon.dart';

class TabAbout extends StatelessWidget {
  final Pokemon? pokemon;

  const TabAbout({
    Key? key,
    this.pokemon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<KeyValue> values = [
      KeyValue(
        key: 'Height',
        value: '${pokemon?.height} m',
      ),
      KeyValue(
        key: 'Weight',
        value: '${pokemon?.weight} kg',
      ),
      KeyValue(
        key: 'Abilities',
        value: pokemon?.abilities?.map((e) => e.ability?.name).join(', '),
      ),
    ];

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          for (var value in values) _buildItem(value, context),
        ],
      ),
    );
  }

  Column _buildItem(KeyValue value, BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            SizedBox(
              width: 80,
              child: Text(
                value.key ?? '',
                style: Theme.of(context).textTheme.bodyText1?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                capitalize(value.value ?? ''),
                style: Theme.of(context).textTheme.bodyText1?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
      ],
    );
  }
}
