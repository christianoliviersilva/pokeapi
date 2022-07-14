import 'package:minha_pokedex/src/domain/entities/pokemon.dart';

abstract class FavPokemonsStorageRepository {
  Future<Pokemon> insertPokemon({
    required Pokemon pokemon,
  });

  Future<Pokemon> getPokemon(int itemId);

  Future<List<Pokemon>> getAllPokemons();

  Future<int> updatePokemon({
    required int id,
    required Pokemon pokemon,
  });

  Future<int> deletePokemon(int id);

  Future<int> deletePokemons();
}
