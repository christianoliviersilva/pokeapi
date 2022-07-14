import 'package:flutter/material.dart';
import 'package:minha_pokedex/src/application/routes/routes_names.dart';
import 'package:minha_pokedex/src/utils/assets.dart';

class BottomNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(
          40.0,
        ),
        topRight: Radius.circular(
          40.0,
        ),
      ),
      color: Colors.red[600],
      child: SafeArea(
        top: false,
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: 8.0,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                onPressed: null,
                icon: Icon(
                  Icons.home_filled,
                ),
              ),
              IconButton(
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    RoutesNames.pokemonDetailsPage,
                  );
                },
                icon: Image.asset(
                  Assets.pokeball,
                  height: 22,
                  width: 22,
                ),
              ),
              IconButton(
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    RoutesNames.favPokemonsPage,
                  );
                },
                icon: Icon(
                  Icons.favorite_rounded,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
