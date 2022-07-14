import 'package:flutter/material.dart';
import 'package:minha_pokedex/src/application/widgets/pokemon_card_content.dart';
import 'package:minha_pokedex/src/domain/entities/pokemon.dart';

class PokemonCard extends StatelessWidget {
  final Pokemon pokemon;
  final VoidCallback onTap;

  const PokemonCard({
    Key? key,
    required this.pokemon,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(
        Radius.circular(20),
      ),
      child: Material(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
          side: BorderSide(
            color: Colors.white,
            width: 2.0,
          ),
        ),
        // color: Colors.white,
        child: InkWell(
          onTap: onTap,
          highlightColor: Colors.red[50],
          splashColor: Colors.red[100],
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 12.0,
            ),
            child: PokemonCardContent(
              pokemon: pokemon,
            ),
          ),
        ),
      ),
    );
  }
}
