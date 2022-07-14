import 'package:minha_pokedex/src/domain/entities/pokemon.dart';
import 'package:minha_pokedex/src/domain/entities/pokemon_details.dart';

extension MapPokemonDetailsToPokemon on PokemonDetails {
  Pokemon mapPokemonDetailsToPokemon() {
    return Pokemon(
      id: pokedexNumber,
      name: name,
      imageUrl: imageUrl,
      pokedexNumber: pokedexNumber,
      types: types,
    );
  }
}
