part of 'pokemon_details_bloc.dart';

@immutable
abstract class PokemonDetailsEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class PokemonDetailsReceived extends PokemonDetailsEvent {
  final int? pokemonId;

  PokemonDetailsReceived({
    this.pokemonId,
  });

  @override
  List<Object?> get props => [
        pokemonId,
      ];
}
