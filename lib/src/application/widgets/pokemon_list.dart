import 'package:flutter/material.dart';
import 'package:minha_pokedex/src/application/routes/routes_names.dart';
import 'package:minha_pokedex/src/application/widgets/loading_indicator.dart';
import 'package:minha_pokedex/src/application/widgets/pokemon_card.dart';
import 'package:minha_pokedex/src/domain/entities/pokemon.dart';
import 'package:minha_pokedex/src/utils/strings.dart';

class PokemonList extends StatelessWidget {
  const PokemonList({
    Key? key,
    required this.pokemons,
    this.controller,
    this.isLoadingPokemons = false,
    this.canLoadMore = false,
  }) : super(key: key);

  final List<Pokemon> pokemons;
  final ScrollController? controller;
  final bool isLoadingPokemons;
  final bool canLoadMore;

  int get loadingPokemonsLenght => isLoadingPokemons || canLoadMore ? 1 : 0;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: AlwaysScrollableScrollPhysics(),
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      controller: controller,
      slivers: [
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) => index < pokemons.length
                ? Padding(
                    padding: const EdgeInsets.only(
                      bottom: 8.0,
                      top: 8.0,
                    ),
                    child: PokemonCard(
                      pokemon: pokemons[index],
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          RoutesNames.pokemonDetailsPage,
                          arguments: pokemons[index].pokedexNumber,
                        );
                      },
                    ),
                  )
                : canLoadMore
                    ? Text(
                        Strings.loadMore,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey[400],
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    : Padding(
                        padding: const EdgeInsets.only(
                          top: 12.0,
                          bottom: 16,
                        ),
                        child: LoadingIndicator(),
                      ),
            childCount: pokemons.length + loadingPokemonsLenght,
          ),
        ),
      ],
    );
  }
}
