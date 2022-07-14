import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:minha_pokedex/src/domain/entities/pokemon_details.dart';
import 'package:minha_pokedex/src/domain/use_cases/poke_api/get_pokemon_details_use_case.dart';

part 'pokemon_details_event.dart';
part 'pokemon_details_state.dart';

class PokemonDetailsBloc
    extends Bloc<PokemonDetailsEvent, PokemonDetailsState> {
  final GetPokemonDetailsUseCase getPokemonDetails;

  PokemonDetailsBloc({
    required this.getPokemonDetails,
  }) : super(PokemonDetailsInitial()) {
    on<PokemonDetailsReceived>(_onPokemonDetailsFecthed);
  }

  Future<void> _onPokemonDetailsFecthed(
    PokemonDetailsReceived event,
    Emitter<PokemonDetailsState> emit,
  ) async {
    emit(PokemonDetailsLoadInProgress());

    try {
      final id = pokemonCurrentId(event.pokemonId);

      final pokemon = await getPokemonDetails(id);

      return emit(
        PokemonDetailsLoadSuccess(
          pokemon: pokemon,
        ),
      );
    } catch (_) {
      emit(PokemonDetailsLoadFailed());
    }
  }

  int pokemonCurrentId(int? currentId) {
    if (currentId == null) {
      final min = 1;
      final max = 899;

      return min + Random().nextInt(max - min);
    }

    return currentId;
  }
}
