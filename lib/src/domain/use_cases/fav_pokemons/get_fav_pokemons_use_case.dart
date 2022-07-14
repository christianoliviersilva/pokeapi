import 'package:minha_pokedex/src/domain/entities/pokemon.dart';
import 'package:minha_pokedex/src/domain/exceptions/pokemon_storage_exceptions.dart';
import 'package:minha_pokedex/src/domain/repositories/fav_pokemons_storage_repository.dart';

class GetFavPokemonsUsecase {
  final FavPokemonsStorageRepository favPokemonsStorageRepository;

  GetFavPokemonsUsecase({
    required this.favPokemonsStorageRepository,
  });

  Future<List<Pokemon>> call() async {
    try {
      return await favPokemonsStorageRepository.getAllPokemons();
    } on CouldNotGetFavPokemons {
      rethrow;
    } catch (e) {
      throw Exception('Unexpected error: ${e.toString()}');
    }
  }
}
