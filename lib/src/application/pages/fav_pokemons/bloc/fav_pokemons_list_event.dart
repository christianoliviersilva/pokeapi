part of 'fav_pokemons_list_bloc.dart';

abstract class FavPokemonsListEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FavPokemonsListReceived extends FavPokemonsListEvent {}
