import 'package:minha_pokedex/src/domain/entities/pokemon.dart';
import 'package:minha_pokedex/src/domain/entities/pokemon_details.dart';
import 'package:minha_pokedex/src/domain/entities/pokemon_stats.dart';
import 'package:minha_pokedex/src/external/poke_api/api_models/pokemon_details_api.dart';

extension MapPokemonDetailsApiToEnties on PokemonDetailsApi {
  Pokemon mapPokemonDetailApiToPokemonEntity() {
    return Pokemon(
      id: id,
      name: name!,
      imageUrl: sprites!.frontDefault!,
      pokedexNumber: id!,
      types: types!
          .map(
            (typeInfo) => typeInfo!.type!.name!,
          )
          .toList(),
    );
  }

  PokemonDetails mapPokemonDetailApiToPokemonDetails() {
    return PokemonDetails(
      name: name!,
      imageUrl: sprites!.frontDefault!,
      pokedexNumber: id!,
      types: types!
          .map(
            (type) => type!.type!.name!,
          )
          .toList(),
      weight: weight!,
      height: height!,
      stats: stats!
          .map(
            (stat) => PokemonStats(
              baseStat: stat!.baseStat!,
              effort: stat.effort!,
              name: stat.stat!.name!,
            ),
          )
          .toList(),
    );
  }
}
