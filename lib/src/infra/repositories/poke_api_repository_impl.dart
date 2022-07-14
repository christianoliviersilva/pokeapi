import 'package:minha_pokedex/src/domain/entities/pokemon_details.dart';
import 'package:minha_pokedex/src/domain/entities/pokemon.dart';
import 'package:minha_pokedex/src/domain/repositories/poke_api_repository.dart';
import 'package:minha_pokedex/src/infra/contracts/poke_api_provider.dart';

class PokeApiRepositroyImpl implements PokeApiRepository {
  final PokeApiProvider pokeApiProvider;

  const PokeApiRepositroyImpl({
    required this.pokeApiProvider,
  });

  @override
  Future<List<Pokemon>> getAllPokemons({
    required int pageOffset,
    int pageLimit = 30,
  }) async {
    return await pokeApiProvider.getAllPokemonsFullList(
      pageOffset: pageOffset,
      pageLimit: pageLimit,
    );
  }

  @override
  Future<PokemonDetails> getPokemonDetails(int pokemonId) async {
    return await pokeApiProvider.getPokemonDetails(pokemonId);
  }
}
