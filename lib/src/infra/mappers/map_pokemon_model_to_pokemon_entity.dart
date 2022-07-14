import 'package:minha_pokedex/src/domain/entities/pokemon.dart';
import 'package:minha_pokedex/src/infra/models/pokemon_model.dart';

extension MapPokemonModelToPokemonEntity on PokemonModel {
  Pokemon mapToPokemonEntity() {
    return Pokemon(
      id: id,
      name: name,
      imageUrl: imageUrl,
      pokedexNumber: pokedexNumber,
      types: types,
    );
  }
}
