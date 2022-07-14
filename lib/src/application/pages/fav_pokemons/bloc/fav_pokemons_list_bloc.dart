import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:minha_pokedex/src/domain/entities/pokemon.dart';
import 'package:minha_pokedex/src/domain/use_cases/fav_pokemons/get_fav_pokemons_use_case.dart';

part 'fav_pokemons_list_event.dart';
part 'fav_pokemons_list_state.dart';

class FavPokemonsListBloc
    extends Bloc<FavPokemonsListEvent, FavPokemonsListState> {
  final GetFavPokemonsUsecase getFavPokemons;
  FavPokemonsListBloc({
    required this.getFavPokemons,
  }) : super(FavPokemonsListInitial()) {
    on<FavPokemonsListReceived>(
      _onGetFavPokemonsCalled,
    );
  }

  Future<void> _onGetFavPokemonsCalled(
    FavPokemonsListReceived event,
    Emitter<FavPokemonsListState> emit,
  ) async {
    emit(FavPokemonsListLoadInProgress());

    try {
      final favoritePokemons = await getFavPokemons();

      if (favoritePokemons.isEmpty) {
        return emit(FavPokemonsListEmpty());
      }

      return emit(
        FavPokemonsListLoadSuccess(
          favoritePokemons: favoritePokemons,
        ),
      );
    } catch (_) {
      emit(FavPokemonsListLoadFailure());
    }
  }
}
