part of 'fav_pokemons_list_bloc.dart';

@immutable
abstract class FavPokemonsListState extends Equatable {
  @override
  List<Object> get props => [];
}

class FavPokemonsListInitial extends FavPokemonsListState {}

class FavPokemonsListEmpty extends FavPokemonsListState {}

class FavPokemonsListLoadInProgress extends FavPokemonsListState {}

class FavPokemonsListLoadSuccess extends FavPokemonsListState {
  final List<Pokemon> favoritePokemons;

  FavPokemonsListLoadSuccess({
    required this.favoritePokemons,
  });

  @override
  List<Object> get props => [favoritePokemons];
}

class FavPokemonsListLoadFailure extends FavPokemonsListState {}
