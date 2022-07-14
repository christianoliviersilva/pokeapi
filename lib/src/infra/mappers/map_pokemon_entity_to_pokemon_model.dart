import 'package:minha_pokedex/src/domain/entities/pokemon.dart';
import 'package:minha_pokedex/src/infra/models/pokemon_model.dart';

extension MapPokemonEntityToPokemonModel on Pokemon {
  PokemonModel mapPokemonEntityToModel() {
    return PokemonModel(
      id: id,
      name: name,
      imageUrl: imageUrl,
      pokedexNumber: pokedexNumber,
      types: types,
    );
  }
}
