import 'package:minha_pokedex/src/domain/entities/pokemon.dart';
import 'package:minha_pokedex/src/domain/exceptions/pokemon_storage_exceptions.dart';
import 'package:minha_pokedex/src/domain/repositories/fav_pokemons_storage_repository.dart';

class GetFavPokemonUsecase {
  final FavPokemonsStorageRepository favPokemonsStorageRepository;

  GetFavPokemonUsecase({
    required this.favPokemonsStorageRepository,
  });

  Future<Pokemon> call(int pokemonId) async {
    try {
      return await favPokemonsStorageRepository.getPokemon(pokemonId);
    } on CouldNotGetFavPokemon {
      rethrow;
    } catch (e) {
      throw Exception('Unexpected error: ${e.toString()}');
    }
  }
}
