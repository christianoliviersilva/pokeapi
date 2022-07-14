import 'package:minha_pokedex/src/domain/exceptions/pokemon_storage_exceptions.dart';
import 'package:minha_pokedex/src/domain/repositories/fav_pokemons_storage_repository.dart';

class DeleteFavPokemonsUsecase {
  final FavPokemonsStorageRepository favPokemonsStorageRepository;

  DeleteFavPokemonsUsecase({
    required this.favPokemonsStorageRepository,
  });

  Future<int> call() async {
    try {
      return await favPokemonsStorageRepository.deletePokemons();
    } on CouldNotDeleteFavPokemons {
      rethrow;
    } catch (e) {
      throw Exception('Unexpected error: ${e.toString()}');
    }
  }
}
