import 'package:flutter/material.dart';
import 'package:minha_pokedex/src/application/widgets/pokemon_type_widget.dart';
import 'package:minha_pokedex/src/domain/entities/pokemon_details.dart';
import 'package:minha_pokedex/src/utils/element_types.dart';
import 'package:minha_pokedex/src/utils/string_extension.dart';

class PokemonTypesTitle extends StatelessWidget {
  const PokemonTypesTitle({
    Key? key,
    required this.pokemon,
  }) : super(key: key);

  final PokemonDetails pokemon;

  @override
  Widget build(BuildContext context) {
    final types = pokemon.types.map((type) {
      final color = elementTypesColors[type];

      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: PokemonTypeWidget(
          name: type.toCapitalized(),
          color: color!,
        ),
      );
    }).toList();

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: types,
    );
  }
}
