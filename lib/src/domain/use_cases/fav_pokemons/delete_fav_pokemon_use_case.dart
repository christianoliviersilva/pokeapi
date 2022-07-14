import 'package:minha_pokedex/src/domain/exceptions/pokemon_storage_exceptions.dart';
import 'package:minha_pokedex/src/domain/repositories/fav_pokemons_storage_repository.dart';

class DeleteFavPokemonUsecase {
  final FavPokemonsStorageRepository favPokemonsStorageRepository;

  DeleteFavPokemonUsecase({
    required this.favPokemonsStorageRepository,
  });

  Future<int> call(int pokemonId) async {
    try {
      return await favPokemonsStorageRepository.deletePokemon(pokemonId);
    } on CouldNotDeleteFavPokemon {
      rethrow;
    } catch (e) {
      throw Exception('Unexpected error: ${e.toString()}');
    }
  }
}
