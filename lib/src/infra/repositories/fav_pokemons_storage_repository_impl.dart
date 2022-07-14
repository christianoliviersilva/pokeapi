import 'package:minha_pokedex/src/domain/entities/pokemon.dart';
import 'package:minha_pokedex/src/domain/exceptions/pokemon_storage_exceptions.dart';
import 'package:minha_pokedex/src/domain/repositories/fav_pokemons_storage_repository.dart';
import 'package:minha_pokedex/src/external/local_storage/pokemons/fav_pokemons_db_fields.dart';
import 'package:minha_pokedex/src/infra/contracts/local_storage_provider.dart';
import 'package:minha_pokedex/src/infra/mappers/map_pokemon_entity_to_pokemon_model.dart';
import 'package:minha_pokedex/src/infra/models/pokemon_model.dart';

class FavPokemonsStorageRepositoryImpl implements FavPokemonsStorageRepository {
  final LocalStorageProvider localStorage;

  const FavPokemonsStorageRepositoryImpl({
    required this.localStorage,
  });

  Future<Pokemon> insertPokemon({
    required Pokemon pokemon,
  }) async {
    final pokemonModel = pokemon.mapPokemonEntityToModel();
    try {
      await localStorage.insertItem(
        favPokemonsTable,
        pokemonModel.toMap(),
      );

      return pokemonModel;
    } catch (_) {
      throw CouldNotAddFavPokemon();
    }
  }

  Future<Pokemon> getPokemon(int itemId) async {
    try {
      final pokemonMap = await localStorage.getItem(
        tableName: favPokemonsTable,
        values: FavPokemonsFields.values,
        itemId: itemId,
      );

      return PokemonModel.fromMap(pokemonMap);
    } catch (_) {
      throw CouldNotGetFavPokemon();
    }
  }

  Future<List<Pokemon>> getAllPokemons() async {
    try {
      final allPokemons = await localStorage.getAllItems(favPokemonsTable);

      return allPokemons
          .map(
            (json) => PokemonModel.fromMap(json),
          )
          .toList();
    } catch (_) {
      throw CouldNotGetFavPokemons();
    }
  }

  Future<int> updatePokemon({
    required int id,
    required Pokemon pokemon,
  }) async {
    try {
      final pokemonModel = pokemon.mapPokemonEntityToModel();

      final updatedPokemon = await localStorage.updateItem(
        tableName: favPokemonsTable,
        values: pokemonModel.toMap(),
        itemId: id,
      );

      return updatedPokemon;
    } catch (_) {
      throw CouldNotUpdateFavPokemon();
    }
  }

  Future<int> deletePokemon(int id) async {
    try {
      return await localStorage.deleteItem(
        favPokemonsTable,
        id,
      );
    } catch (_) {
      throw CouldNotDeleteFavPokemon();
    }
  }

  @override
  Future<int> deletePokemons() async {
    try {
      return await localStorage.deleteTable(favPokemonsTable);
    } catch (_) {
      throw CouldNotDeleteFavPokemons();
    }
  }
}
