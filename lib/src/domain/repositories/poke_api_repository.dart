import 'package:minha_pokedex/src/domain/entities/pokemon.dart';
import 'package:minha_pokedex/src/domain/entities/pokemon_details.dart';

abstract class PokeApiRepository {
  Future<List<Pokemon>> getAllPokemons({
    required int pageOffset,
    int pageLimit,
  });

  Future<PokemonDetails> getPokemonDetails(int pokemonId);
}
