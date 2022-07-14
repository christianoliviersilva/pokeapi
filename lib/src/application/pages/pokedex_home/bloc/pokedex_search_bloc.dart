import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:minha_pokedex/src/domain/entities/pokemon.dart';
import 'package:minha_pokedex/src/domain/use_cases/poke_api/get_pokemons_use_case.dart';
import 'package:minha_pokedex/src/domain/use_cases/poke_api/search_pokemons_use_case.dart';

part 'pokedex_search_event.dart';
part 'pokedex_search_state.dart';

class PokedexSearchBloc
    extends Bloc<PokedexSearchEvent, PokedexSearchState> {
  final GetPokemonsUseCase getPokemons;
  final SearchPokemonsUseCase searchPokemons;

  PokedexSearchBloc({
    required this.getPokemons,
    required this.searchPokemons,
  }) : super(PokedexSearchState()) {
    on<PokedexSearchPageOpened>(_onGetPokemonsCalled);
    on<PokedexSearchNextPageFetched>(_onNextPokemonPageFetched);
    on<PokedexSearchPokemonFetched>(_onSearchPokemon);
    on<PokedexSearchMorePokemonsFetched>(
        _onSearchMorePokemonsFetched);
  }

  bool _isFetching = false;

  Future<void> _onGetPokemonsCalled(
    PokedexSearchPageOpened event,
    Emitter<PokedexSearchState> emit,
  ) async {
    emit(
      state.copyWith(
        status: SearchStatus.firstPageLoading,
      ),
    );

    try {
      final pokemons = await getPokemons(
        pageOffset: 0,
      );

      return emit(
        state.copyWith(
          status: SearchStatus.success,
          pokemons: pokemons,
        ),
      );
    } catch (_) {
      emit(
        state.copyWith(
          status: SearchStatus.failure,
        ),
      );
    }
  }

  Future<void> _onNextPokemonPageFetched(
    PokedexSearchNextPageFetched event,
    Emitter<PokedexSearchState> emit,
  ) async {
    emit(
      state.copyWith(
        status: SearchStatus.nextPageLoading,
      ),
    );

    final pageOffset = state.currentPageOffset + 30;

    try {
      if (!_isFetching) {
        _isFetching = true;

        final pokemons = await getPokemons(
          pageOffset: pageOffset,
        );

        final pokemonList = state.pokemons + pokemons;

        emit(
          state.copyWith(
            status: SearchStatus.success,
            pokemons: pokemonList,
            searchPokemons: [],
            currentPageOffset: pageOffset,
          ),
        );
        _isFetching = false;
      }
    } catch (_) {
      emit(
        state.copyWith(
          status: SearchStatus.failure,
        ),
      );
    }
  }

  Future<void> _onSearchPokemon(
    PokedexSearchPokemonFetched event,
    Emitter<PokedexSearchState> emit,
  ) async {
    emit(
      state.copyWith(
        status: SearchStatus.filterLoading,
      ),
    );

    try {
      if (event.searchTerm.isEmpty) {
        return emit(
          state.copyWith(
            status: SearchStatus.success,
            searchPokemons: [],
            searchedPokemon: event.searchTerm,
          ),
        );
      }

      // Local search
      final pokemons = await searchPokemons(
        pokemons: state.pokemons,
        searchTerm: event.searchTerm,
      );

      emit(
        state.copyWith(
          status: SearchStatus.filterSuccess,
          searchPokemons: pokemons,
          searchedPokemon: event.searchTerm,
        ),
      );
    } catch (_) {
      emit(
        state.copyWith(
          status: SearchStatus.failure,
        ),
      );
    }
  }

  Future<void> _onSearchMorePokemonsFetched(
    PokedexSearchMorePokemonsFetched event,
    Emitter<PokedexSearchState> emit,
  ) async {
    emit(
      state.copyWith(
        status: SearchStatus.nextPageLoading,
      ),
    );

    final pageOffset = state.currentPageOffset + 30;

    try {
      if (!_isFetching) {
        _isFetching = true;

        final pokemons = await getPokemons(
          pageOffset: pageOffset,
        );

        final pokemonList = state.pokemons + pokemons;

        final searchedPokemons = await searchPokemons(
          pokemons: pokemonList,
          searchTerm: state.searchedPokemon,
        );

        emit(
          state.copyWith(
            status: SearchStatus.filterSuccess,
            pokemons: pokemonList,
            searchPokemons: searchedPokemons,
            currentPageOffset: pageOffset,
          ),
        );
        _isFetching = false;
      }
    } catch (_) {
      emit(
        state.copyWith(
          status: SearchStatus.failure,
        ),
      );
    }
  }
}
