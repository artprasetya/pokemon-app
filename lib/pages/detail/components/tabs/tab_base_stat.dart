import 'package:flutter/material.dart';
import 'package:pokemon_app/helper/helper.dart';
import 'package:pokemon_app/models/pokemon.dart';

class TabBaseStat extends StatelessWidget {
  final Pokemon? pokemon;

  const TabBaseStat({
    Key? key,
    this.pokemon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          for (var stat in pokemon?.stats ?? []) _buildItem(stat, context),
        ],
      ),
    );
  }

  Column _buildItem(stat, BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                capitalize(stat.stat?.name ?? ''),
                style: Theme.of(context).textTheme.bodyText1?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
              ),
            ),
            const SizedBox(width: 8),
            Text(
              '${stat.baseStat}',
              style: Theme.of(context).textTheme.bodyText1?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: LinearProgressIndicator(
                minHeight: 4,
                value: (stat.baseStat ?? 0) / 100,
                color: stat.baseStat <= 50 ? Colors.red : Colors.green,
                backgroundColor: Colors.grey.shade300,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
      ],
    );
  }
}
