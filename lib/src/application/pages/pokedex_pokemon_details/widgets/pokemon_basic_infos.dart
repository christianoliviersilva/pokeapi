import 'package:flutter/material.dart';
import 'package:minha_pokedex/src/domain/entities/pokemon_details.dart';
import 'package:minha_pokedex/src/utils/element_types.dart';
import 'package:minha_pokedex/src/utils/formatters.dart';
import 'package:minha_pokedex/src/utils/strings.dart';

class PokemonBasicInfos extends StatelessWidget {
  const PokemonBasicInfos({
    Key? key,
    required this.pokemon,
  }) : super(key: key);

  final PokemonDetails pokemon;

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              Text(
                '${pokemon.height / 10} M',
                style: TextStyle(
                  letterSpacing: 1.4,
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                Strings.height,
                style: TextStyle(
                  color: Colors.grey[400],
                ),
              ),
            ],
          ),
          VerticalDivider(
            color: elementTypesColors[pokemon.types[0]],
            thickness: 2.4,
          ),
          Column(
            children: [
              Text(
                '${pokemon.weight / 10} KG',
                style: TextStyle(
                  letterSpacing: 1.4,
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                Strings.weight,
                style: TextStyle(
                  color: Colors.grey[400],
                ),
              ),
            ],
          ),
          VerticalDivider(
            color: elementTypesColors[pokemon.types[0]],
            thickness: 2.4,
          ),
          Column(
            children: [
              Text(
                getFullPokemonId(pokemon.pokedexNumber),
                style: TextStyle(
                  letterSpacing: 1.4,
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                Strings.pokedex,
                style: TextStyle(
                  color: Colors.grey[400],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
