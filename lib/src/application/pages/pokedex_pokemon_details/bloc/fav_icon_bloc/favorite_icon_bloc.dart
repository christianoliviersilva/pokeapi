import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:minha_pokedex/src/domain/entities/pokemon_details.dart';
import 'package:minha_pokedex/src/domain/exceptions/pokemon_storage_exceptions.dart';
import 'package:minha_pokedex/src/domain/use_cases/fav_pokemons/add_fav_pokemon_use_case.dart';
import 'package:minha_pokedex/src/domain/use_cases/fav_pokemons/delete_fav_pokemon_use_case.dart';
import 'package:minha_pokedex/src/domain/use_cases/fav_pokemons/get_fav_pokemon_use_case.dart';
import 'package:minha_pokedex/src/infra/mappers/map_pokemon_details_entity_to_pokemon_entity.dart';

part 'favorite_icon_event.dart';
part 'favorite_icon_state.dart';

class FavoriteIconBloc
    extends Bloc<FavoriteIconEvent, FavoriteIconCheckFavState> {
  final AddFavPokemonUsecase addFavPokemon;
  final DeleteFavPokemonUsecase deleteFavPokemon;
  final GetFavPokemonUsecase getFavPokemon;

  FavoriteIconBloc({
    required this.addFavPokemon,
    required this.deleteFavPokemon,
    required this.getFavPokemon,
  }) : super(FavoriteIconCheckFavState(isFavorite: false)) {
    on<FavoriteIconRetrieveIsFavorite>(_onFavoriteIconCheckFavorite);
    on<FavoriteIconChangeIsFavorite>(_onFavoriteIconChangeIsFavorite);
  }

  Future<void> _onFavoriteIconChangeIsFavorite(
    FavoriteIconChangeIsFavorite event,
    Emitter<FavoriteIconCheckFavState> emit,
  ) async {
    final pokemonDetails = event.pokemon;

    try {
      final favoritePokemon = await getFavPokemon(pokemonDetails.pokedexNumber);

      await deleteFavPokemon(favoritePokemon.id!);

      return emit(
        FavoriteIconCheckFavState(
          isFavorite: false,
        ),
      );
    } on CouldNotGetFavPokemon {
      final pokemon = pokemonDetails.mapPokemonDetailsToPokemon();

      await addFavPokemon(pokemon);

      emit(
        FavoriteIconCheckFavState(
          isFavorite: true,
        ),
      );
    } catch (_) {
      emit(
        FavoriteIconCheckFavState(
          isFavorite: false,
        ),
      );
    }
  }

  Future<void> _onFavoriteIconCheckFavorite(
    FavoriteIconRetrieveIsFavorite event,
    Emitter<FavoriteIconCheckFavState> emit,
  ) async {
    final pokemonId = event.pokemonId;

    try {
      if (pokemonId == null) {
        return emit(
          FavoriteIconCheckFavState(
            isFavorite: false,
          ),
        );
      }

      await getFavPokemon(pokemonId);

      return emit(
        FavoriteIconCheckFavState(
          isFavorite: true,
        ),
      );
    } catch (_) {
      emit(
        FavoriteIconCheckFavState(
          isFavorite: false,
        ),
      );
    }
  }
}
