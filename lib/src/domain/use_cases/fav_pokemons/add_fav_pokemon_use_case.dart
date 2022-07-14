import 'package:minha_pokedex/src/domain/entities/pokemon.dart';
import 'package:minha_pokedex/src/domain/exceptions/pokemon_storage_exceptions.dart';
import 'package:minha_pokedex/src/domain/repositories/fav_pokemons_storage_repository.dart';

class AddFavPokemonUsecase {
  final FavPokemonsStorageRepository favPokemonsStorageRepository;

  AddFavPokemonUsecase({
    required this.favPokemonsStorageRepository,
  });

  Future<Pokemon> call(Pokemon pokemon) async {
    try {
      return await favPokemonsStorageRepository.insertPokemon(
        pokemon: pokemon,
      );
    } on CouldNotAddFavPokemon {
      throw CouldNotAddFavPokemon();
    } catch (e) {
      throw Exception('Unexpected error: ${e.toString()}');
    }
  }
}
