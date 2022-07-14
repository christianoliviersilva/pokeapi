import 'package:flutter/material.dart';
import 'package:minha_pokedex/src/application/pages/pokedex_pokemon_details/widgets/pokemon_circular_stat.dart';
import 'package:minha_pokedex/src/domain/entities/pokemon_details.dart';
import 'package:minha_pokedex/src/utils/element_types.dart';
import 'package:minha_pokedex/src/utils/stats_abbreviations.dart';

class PokemonGridStatus extends StatelessWidget {
  const PokemonGridStatus({
    Key? key,
    required this.pokemon,
  }) : super(key: key);

  final PokemonDetails pokemon;

  @override
  Widget build(BuildContext context) {
    final stats = pokemon.stats.map((stat) {
      final pokemonStatColor = stat.baseStat <= 46
          ? Colors.red[400]
          : elementTypesColors[pokemon.types[0]];

      return PokemonCircularStat(
        pokemonStatColor: pokemonStatColor!,
        baseStat: stat.baseStat,
        statName: statsAbbr[stat.name]!,
      );
    }).toList();

    return GridView.count(
      shrinkWrap: true,
      crossAxisSpacing: 8.0,
      mainAxisSpacing: 12.0,
      padding: const EdgeInsets.symmetric(
        horizontal: 16.0,
      ),
      physics: NeverScrollableScrollPhysics(),
      crossAxisCount: 3,
      children: stats,
    );
  }
}
