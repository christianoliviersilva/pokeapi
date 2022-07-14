part of 'pokedex_search_bloc.dart';

@immutable
abstract class PokedexSearchEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class PokedexSearchPageOpened extends PokedexSearchEvent {}

class PokedexSearchNextPageFetched extends PokedexSearchEvent {}

class PokedexSearchMorePokemonsFetched extends PokedexSearchEvent {}

class PokedexSearchPokemonFetched extends PokedexSearchEvent {
  final String searchTerm;

  PokedexSearchPokemonFetched({
    required this.searchTerm,
  });

  @override
  List<Object> get props => [
        searchTerm,
      ];
}
