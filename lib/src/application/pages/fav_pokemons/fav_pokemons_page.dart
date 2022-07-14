import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:minha_pokedex/src/application/pages/fav_pokemons/bloc/fav_pokemons_list_bloc.dart';
import 'package:minha_pokedex/src/application/widgets/pokemon_list.dart';
import 'package:minha_pokedex/src/application/widgets/loading_indicator.dart';
import 'package:minha_pokedex/src/application/widgets/reload_content_button.dart';
import 'package:minha_pokedex/src/utils/strings.dart';

class FavPokemonsPage extends StatefulWidget {
  @override
  State<FavPokemonsPage> createState() => _FavPokemonsPageState();
}

class _FavPokemonsPageState extends State<FavPokemonsPage> {
  final favPokemonsBloc = GetIt.I.get<FavPokemonsListBloc>();

  @override
  void initState() {
    favPokemonsBloc.add(
      FavPokemonsListReceived(),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        centerTitle: false,
        title: Text(
          Strings.favoritesTitle,
          style: TextStyle(
            letterSpacing: 2.8,
            color: Colors.white,
            fontSize: 18,
            fontFamily: 'Ardela'
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.fromLTRB(
            16.0,
            12.0,
            16.0,
            0.0,
          ),
          child: _buildFavPokemonsList(),
        ),
      ),
    );
  }

  Widget _buildFavPokemonsList() {
    return BlocBuilder(
      bloc: favPokemonsBloc,
      builder: (context, state) {
        if (state is FavPokemonsListLoadSuccess) {
          final pokemonsList = state.favoritePokemons;

          return PokemonList(
            pokemons: pokemonsList,
          );
        }

        if (state is FavPokemonsListEmpty) {
          return Center(
            child: Text(Strings.favoritesDoesNotExist),
          );
        }

        if (state is FavPokemonsListLoadFailure) {
          return ReloadContentButton(
            onReload: () => favPokemonsBloc.add(
              FavPokemonsListReceived(),
            ),
            reloadText: Strings.reloadFavPokemons,
          );
        }

        return Center(
          child: LoadingIndicator(),
        );
      },
    );
  }
}
