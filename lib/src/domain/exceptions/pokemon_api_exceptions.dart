abstract class PokemonApiExceptions implements Exception {
  final String message;
  PokemonApiExceptions(this.message) : super();
}

class CouldNotGetPokemonsList extends PokemonApiExceptions {
  CouldNotGetPokemonsList() : super('Could not get pokemon list from api');
}

class CouldNotGetAllPokemons extends PokemonApiExceptions {
  CouldNotGetAllPokemons() : super('Could not find all pokemons from api');
}

class CouldNotGetPokemonDetails extends PokemonApiExceptions {
  CouldNotGetPokemonDetails() : super('Could not find that pokemon details');
}

class CouldNotSearchPokemon extends PokemonApiExceptions {
  CouldNotSearchPokemon() : super('Could not find that specific pokemon');
}
