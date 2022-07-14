part of 'pokemon_details_bloc.dart';

@immutable
abstract class PokemonDetailsState extends Equatable {
  @override
  List<Object?> get props => [];
}

class PokemonDetailsInitial extends PokemonDetailsState {}

class PokemonDetailsLoadInProgress extends PokemonDetailsState {}

class PokemonDetailsLoadSuccess extends PokemonDetailsState {
  final PokemonDetails pokemon;

  PokemonDetailsLoadSuccess({
    required this.pokemon,
  });

  @override
  List<Object> get props => [pokemon];
}

class PokemonDetailsLoadFailed extends PokemonDetailsState {}

// class PokemonDetailsState extends Equatable {
//   final PokemonDetails pokemon;
//   final int pokemonId;
//   final bool isFavorite;
//   final PokemonDetailsStatus status;

//   const PokemonDetailsState({
//     required this.status,
//     required this.pokemon,
//     required this.pokemonId,
//     this.isFavorite = false,
//   });

//   PokemonDetailsState copyWith({
//     PokemonDetails? pokemon,
//     int? pokemonId,
//     bool? isFavorite,
//     PokemonDetailsStatus? status,
//   }) {
//     return PokemonDetailsState(
//       pokemonId: pokemonId ?? this.pokemonId,
//       pokemon: pokemon ?? this.pokemon,
//       status: status ?? this.status,
//     );
//   }

//   @override
//   List<Object?> get props => [];
// }
