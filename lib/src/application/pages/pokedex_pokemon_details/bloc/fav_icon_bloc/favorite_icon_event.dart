part of 'favorite_icon_bloc.dart';

@immutable
abstract class FavoriteIconEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class FavoriteIconRetrieveIsFavorite extends FavoriteIconEvent {
  final int? pokemonId;

  FavoriteIconRetrieveIsFavorite({
    required this.pokemonId,
  });

  @override
  List<Object?> get props => [
        pokemonId,
      ];
}

class FavoriteIconChangeIsFavorite extends FavoriteIconEvent {
  final PokemonDetails pokemon;

  FavoriteIconChangeIsFavorite({
    required this.pokemon,
  });

  @override
  List<Object> get props => [
        pokemon,
      ];
}
