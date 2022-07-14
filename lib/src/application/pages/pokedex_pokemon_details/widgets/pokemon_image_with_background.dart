import 'package:flutter/material.dart';
import 'package:minha_pokedex/src/application/pages/pokedex_pokemon_details/pokedex_pokemon_details_page.dart';
import 'package:minha_pokedex/src/utils/assets.dart';
import 'package:minha_pokedex/src/utils/element_types.dart';

class PokemonImageWithBackground extends StatelessWidget {
  const PokemonImageWithBackground({
    Key? key,
    required this.types,
    required this.imageUrl,
  }) : super(key: key);

  final String imageUrl;
  final List<String> types;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Align(
          alignment: Alignment.topCenter,
          child: ShaderMask(
            shaderCallback: (bounds) {
              return LinearGradient(
                colors: [
                  Colors.white,
                  elementTypesColors[types[0]]!,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops: [0.2, 1.2],
              ).createShader(bounds);
            },
            child: Image.asset(
              Assets.pokeball2x,
              scale: 0.8,
              color: Color.fromARGB(255, 255, 255, 255).withOpacity(0.68),
            ),
          ),
        ),
        GestureDetector(
          onTap: () => Navigator.push(context, MaterialPageRoute(
            builder: (_) => PokedexPokemonDetailsPage())),
          child: Container(
            child: Transform.scale(
              scale: 2.0,
              origin: Offset(0, -4.4),
              child: Image.network(
                imageUrl,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
