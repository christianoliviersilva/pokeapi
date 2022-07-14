import 'package:dio/dio.dart';
import 'package:minha_pokedex/src/domain/entities/pokemon.dart';
import 'package:minha_pokedex/src/domain/entities/pokemon_details.dart';
import 'package:minha_pokedex/src/domain/exceptions/pokemon_api_exceptions.dart';
import 'package:minha_pokedex/src/external/global_http_client.dart';
import 'package:minha_pokedex/src/external/poke_api/api_models/pokemon_details_api.dart';
import 'package:minha_pokedex/src/external/poke_api/api_models/pokemon_list_response.dart';
import 'package:minha_pokedex/src/infra/contracts/poke_api_provider.dart';
import 'package:minha_pokedex/src/infra/mappers/map_pokemon_details_api_to_entities.dart';

class PokeApiProviderImpl implements PokeApiProvider {
  final GlobalHttpClient client;

  const PokeApiProviderImpl({
    required this.client,
  });

  @override
  Future<PokemonListResponse> getPokemonsSimpleList({
    required int pageOffset,
    required int pageLimit,
  }) async {
    try {
      final pokemonListData = await client.http.get(
        'pokemon/?offset=$pageOffset&limit=$pageLimit',
      );

      if (pokemonListData.data == null) throw CouldNotGetPokemonsList();

      return PokemonListResponse.fromJson(pokemonListData.data);
    } on DioError catch (_) {
      throw CouldNotGetPokemonsList();
    }
  }

  @override
  Future<List<Pokemon>> getAllPokemonsFullList({
    required int pageOffset,
    required int pageLimit,
  }) async {
    try {
      final pokemonFromApi = await getPokemonsSimpleList(
        pageOffset: pageOffset,
        pageLimit: pageLimit,
      );

      var apiList = <PokemonDetailsApi>[];
      var pokemonList = <Pokemon>[];

      for (var pokemonFromList in pokemonFromApi.pokemonsFromList!) {
        final pokemonDetailsResponse = await client.http.get(
          '${pokemonFromList!.url}/',
        );
        final pokemonDetails = PokemonDetailsApi.fromJson(
          pokemonDetailsResponse.data,
        );
        apiList.add(pokemonDetails);
      }

      for (var pokemonDetails in apiList) {
        final pokemon = pokemonDetails.mapPokemonDetailApiToPokemonEntity();
        pokemonList.add(pokemon);
      }

      return pokemonList;
    } catch (e) {
      throw CouldNotGetAllPokemons();
    }
  }

  @override
  Future<PokemonDetails> getPokemonDetails(int pokemonId) async {
    try {
      final pokemonDetailsData = await client.http.get('pokemon/$pokemonId');
      final pokemonDetails = PokemonDetailsApi.fromJson(
        pokemonDetailsData.data,
      );

      return pokemonDetails.mapPokemonDetailApiToPokemonDetails();
    } on DioError catch (_) {
      throw CouldNotGetPokemonDetails();
    }
  }
}
