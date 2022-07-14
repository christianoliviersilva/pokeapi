import 'package:minha_pokedex/src/domain/entities/pokemon.dart';
import 'package:minha_pokedex/src/domain/exceptions/pokemon_api_exceptions.dart';
import 'package:minha_pokedex/src/domain/repositories/poke_api_repository.dart';

class GetPokemonsUseCase {
  final PokeApiRepository pokeApiRepository;

  GetPokemonsUseCase({
    required this.pokeApiRepository,
  });

  Future<List<Pokemon>> call({
    required int pageOffset,
  }) async {
    try {
      return await pokeApiRepository.getAllPokemons(
        pageOffset: pageOffset,
      );
    } on CouldNotGetAllPokemons {
      rethrow;
    } catch (e) {
      throw Exception('Unexpected error: ${e.toString()}');
    }
  }
}
