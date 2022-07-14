part of 'pokedex_search_bloc.dart';

enum SearchStatus {
  initial,
  firstPageLoading,
  nextPageLoading,
  filterLoading,
  filterSuccess,
  success,
  failure,
}

class PokedexSearchState extends Equatable {
  const PokedexSearchState({
    this.status = SearchStatus.initial,
    this.currentPageOffset = 0,
    this.pokemons = const <Pokemon>[],
    this.searchPokemons = const <Pokemon>[],
    this.searchedPokemon = '',
  });

  final SearchStatus status;
  final List<Pokemon> pokemons;
  final List<Pokemon> searchPokemons;
  final int currentPageOffset;
  final String searchedPokemon;

  PokedexSearchState copyWith({
    SearchStatus? status,
    List<Pokemon>? pokemons,
    List<Pokemon>? searchPokemons,
    int? currentPageOffset,
    String? searchedPokemon,
  }) {
    return PokedexSearchState(
      status: status ?? this.status,
      pokemons: pokemons ?? this.pokemons,
      searchPokemons: searchPokemons ?? this.searchPokemons,
      currentPageOffset: currentPageOffset ?? this.currentPageOffset,
      searchedPokemon: searchedPokemon ?? this.searchedPokemon,
    );
  }

  @override
  List<Object> get props => [
        status,
        pokemons,
        searchPokemons,
        currentPageOffset,
        searchedPokemon,
      ];

  @override
  String toString() {
    return 'PokedexSearchState(status: $status, pokemons: $pokemons, searchPokemons: $searchPokemons, currentPageOffset: $currentPageOffset, searchedPokemon: $searchedPokemon)';
  }
}
