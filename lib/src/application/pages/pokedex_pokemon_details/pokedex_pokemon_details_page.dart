import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:minha_pokedex/src/application/pages/pokedex_pokemon_details/bloc/fav_icon_bloc/favorite_icon_bloc.dart';
import 'package:minha_pokedex/src/application/pages/pokedex_pokemon_details/bloc/pokemon_details_bloc.dart';
import 'package:minha_pokedex/src/application/pages/pokedex_pokemon_details/widgets/favorite_icon_app_bar.dart';
import 'package:minha_pokedex/src/application/pages/pokedex_pokemon_details/widgets/pokemon_basic_infos.dart';
import 'package:minha_pokedex/src/application/pages/pokedex_pokemon_details/widgets/pokemon_grid_status.dart';
import 'package:minha_pokedex/src/application/pages/pokedex_pokemon_details/widgets/pokemon_image_with_background.dart';
import 'package:minha_pokedex/src/application/pages/pokedex_pokemon_details/widgets/pokemon_name_title.dart';
import 'package:minha_pokedex/src/application/pages/pokedex_pokemon_details/widgets/pokemon_types_title.dart';
import 'package:minha_pokedex/src/application/widgets/loading_indicator.dart';
import 'package:minha_pokedex/src/application/widgets/reload_content_button.dart';
import 'package:minha_pokedex/src/domain/entities/pokemon_details.dart';
import 'package:minha_pokedex/src/utils/strings.dart';

class PokedexPokemonDetailsPage extends StatefulWidget {
  const PokedexPokemonDetailsPage({
    Key? key,
    this.pokemonId,
  }) : super(key: key);

  final int? pokemonId;

  @override
  State<PokedexPokemonDetailsPage> createState() =>
      _PokedexPokemonDetailsPageState();
}

class _PokedexPokemonDetailsPageState extends State<PokedexPokemonDetailsPage> {
  final pokemonDetailsBloc = GetIt.I.get<PokemonDetailsBloc>();
  final favoriteIconBloc = GetIt.I.get<FavoriteIconBloc>();

  @override
  void initState() {
    pokemonDetailsBloc.add(
      PokemonDetailsReceived(
        pokemonId: widget.pokemonId,
      ),
    );

    favoriteIconBloc.add(
      FavoriteIconRetrieveIsFavorite(
        pokemonId: widget.pokemonId,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: BlocBuilder<PokemonDetailsBloc, PokemonDetailsState>(
        bloc: pokemonDetailsBloc,
        builder: (context, state) {
          if (state is PokemonDetailsLoadSuccess) {
            final pokemon = state.pokemon;

            return Scaffold(
              body: Column(
                children: [
                  _buildAppBar(pokemon),
                  ..._buildPokemonDetails(pokemon),
                ],
              ),
            );
          }

          if (state is PokemonDetailsLoadFailed) {
            return Center(
              child: ReloadContentButton(
                onReload: () => pokemonDetailsBloc.add(
                  PokemonDetailsReceived(
                    pokemonId: widget.pokemonId,
                  ),
                ),
                reloadText: Strings.reloadPokemonDetails,
              ),
            );
          }

          return Center(
            child: LoadingIndicator(),
          );
        },
      ),
    );
  }

  Widget _buildAppBar(PokemonDetails pokemon) {
    return BlocBuilder<FavoriteIconBloc, FavoriteIconCheckFavState>(
      bloc: favoriteIconBloc,
      builder: (context, state) {
        return FavoriteIconAppBar(
          onIconTap: () => favoriteIconBloc.add(
            FavoriteIconChangeIsFavorite(
              pokemon: pokemon,
            ),
          ),
          isFavorite: state.isFavorite,
          pokemon: pokemon,
        );
      },
    );
  }

  List<Widget> _buildPokemonDetails(PokemonDetails pokemon) {
    return [
      PokemonImageWithBackground(
        types: pokemon.types,
        imageUrl: pokemon.imageUrl,
      ),
      SizedBox(height: 16.0),
      Expanded(
        child: PokemonDetailsCard(
          pokemon: pokemon,
        ),
      ),
    ];
  }
}

class PokemonDetailsCard extends StatelessWidget {
  const PokemonDetailsCard({
    Key? key,
    required this.pokemon,
    this.contentPadding = const EdgeInsets.only(
      top: 8.0,
      left: 20.0,
      right: 20.0,
    ),
  }) : super(key: key);

  final PokemonDetails pokemon;
  final EdgeInsets contentPadding;

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(
          32.0,
        ),
        topRight: Radius.circular(
          32.0,
        ),
      ),
      color: Colors.grey[800],
      child: ListView(
        shrinkWrap: true,
        padding: contentPadding,
        children: [
          Column(
            children: [
              PokemonNameTitle(name: pokemon.name),
              SizedBox(height: 16.0),
              PokemonTypesTitle(pokemon: pokemon),
            ],
          ),
          SizedBox(height: 24.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PokemonBasicInfos(pokemon: pokemon),
              SizedBox(height: 24.0),
              PokemonGridStatus(pokemon: pokemon)
            ],
          ),
        ],
      ),
    );
  }
}
