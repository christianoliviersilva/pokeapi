import 'package:flutter/cupertino.dart';
import 'package:minha_pokedex/src/application/pages/fav_pokemons/fav_pokemons_page.dart';
import 'package:minha_pokedex/src/application/pages/pokedex_home/pokedex_home_page.dart';
import 'package:minha_pokedex/src/application/pages/pokedex_pokemon_details/pokedex_pokemon_details_page.dart';
import 'package:minha_pokedex/src/application/routes/routes_names.dart';

class AppRouter {
  // static Map<String, Widget Function(BuildContext)> routes = {
  //   RoutesNames.homePage: (context) => PokedexHomePage(),
  //   RoutesNames.pokemonDetailsPage: (context) => PokedexPokemonDetailsPage(),
  //   RoutesNames.favPokemonsPage: (context) => FavPokemonsPage(),
  // };

  static Route generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case RoutesNames.homePage:
        return CupertinoPageRoute(
          settings: settings,
          builder: (context) => PokedexHomePage(),
        );
      case RoutesNames.pokemonDetailsPage:
        final pokemonIdArg = settings.arguments as int?;

        return CupertinoPageRoute(
          settings: settings,
          builder: (context) => PokedexPokemonDetailsPage(
            pokemonId: pokemonIdArg,
          ),
        );
      case RoutesNames.favPokemonsPage:
        return CupertinoPageRoute(
          settings: settings,
          builder: (context) => FavPokemonsPage(),
        );
      default:
        return CupertinoPageRoute(
          settings: settings,
          builder: (context) => PokedexHomePage(),
        );
    }
  }
}
