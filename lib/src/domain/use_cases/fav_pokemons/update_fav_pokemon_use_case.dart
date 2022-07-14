import 'package:minha_pokedex/src/domain/entities/pokemon.dart';
import 'package:minha_pokedex/src/domain/exceptions/pokemon_storage_exceptions.dart';
import 'package:minha_pokedex/src/domain/repositories/fav_pokemons_storage_repository.dart';

class UpdateFavPokemonUsecase {
  final FavPokemonsStorageRepository favPokemonsStorageRepository;

  UpdateFavPokemonUsecase({
    required this.favPokemonsStorageRepository,
  });

  Future<int> call(Pokemon pokemon) async {
    try {
      return await favPokemonsStorageRepository.updatePokemon(
        id: pokemon.id!,
        pokemon: pokemon,
      );
    } on CouldNotUpdateFavPokemon {
      rethrow;
    } catch (e) {
      throw Exception('Unexpected error: ${e.toString()}');
    }
  }
}
