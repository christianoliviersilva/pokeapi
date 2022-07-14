abstract class PokemonsStorageExceptions implements Exception {
  final String message;
  PokemonsStorageExceptions(this.message) : super();
}

class CouldNotGetFavPokemons extends PokemonsStorageExceptions {
  CouldNotGetFavPokemons() : super('CouldNotGetAllPokemons');
}

class CouldNotGetFavPokemon extends PokemonsStorageExceptions {
  CouldNotGetFavPokemon() : super('CouldNotGetPokemon with details');
}

class CouldNotAddFavPokemon extends PokemonsStorageExceptions {
  CouldNotAddFavPokemon() : super('CouldNotAddFavPokemon to fav list');
}

class CouldNotUpdateFavPokemon extends PokemonsStorageExceptions {
  CouldNotUpdateFavPokemon()
      : super(
          'CouldNotUpdateFavPokemon to add or remove from fav list',
        );
}

class CouldNotDeleteFavPokemon extends PokemonsStorageExceptions {
  CouldNotDeleteFavPokemon() : super('CouldNotDeletePokemonFromFav');
}

class CouldNotDeleteFavPokemons extends PokemonsStorageExceptions {
  CouldNotDeleteFavPokemons()
      : super(
          'CouldNotDeleteAllPokemons from fav storage',
        );
}
