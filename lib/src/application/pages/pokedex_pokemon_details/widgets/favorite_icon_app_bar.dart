import 'package:flutter/material.dart';
import 'package:minha_pokedex/src/application/app_widget.dart';
import 'package:minha_pokedex/src/domain/entities/pokemon_details.dart';
import 'package:minha_pokedex/src/setup.dart';

class FavoriteIconAppBar extends StatelessWidget {
  const FavoriteIconAppBar({
    Key? key,
    required this.onIconTap,
    required this.isFavorite,
    required this.pokemon,
  }) : super(key: key);

  final bool isFavorite;
  final PokemonDetails pokemon;
  final VoidCallback onIconTap;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      leading: GestureDetector(
        onTap: () => Navigator.of(context)
    .pushNamedAndRemoveUntil('/pokedex-home', (Route<dynamic> route) => false),
        child: Icon(Icons.arrow_back),),
      actions: [
        IconButton(
          splashRadius: 20.0,
          onPressed: onIconTap,
          icon:
          /* Icon(
            isFavorite ? Icons.favorite_rounded : Icons.favorite_border_rounded,
          ), */
          isFavorite 
          ? Icon(Icons.favorite_rounded, color: Color.fromARGB(255, 226, 20, 5), size: 32,)
          : Icon(Icons.favorite_border_rounded, size: 32,)
        ),
        SizedBox(width: 16.0),
      ],
    );
  }
}
