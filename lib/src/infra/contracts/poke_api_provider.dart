import 'package:minha_pokedex/src/domain/entities/pokemon.dart';
import 'package:minha_pokedex/src/domain/entities/pokemon_details.dart';
import 'package:minha_pokedex/src/external/poke_api/api_models/pokemon_list_response.dart';

abstract class PokeApiProvider {
  Future<PokemonListResponse> getPokemonsSimpleList({
    required int pageOffset,
    required int pageLimit,
  });

  Future<List<Pokemon>> getAllPokemonsFullList({
    required int pageOffset,
    required int pageLimit,
  });

  Future<PokemonDetails> getPokemonDetails(int pokemonId);
}
