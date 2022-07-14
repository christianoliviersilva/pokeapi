import 'package:minha_pokedex/src/domain/entities/pokemon.dart';
import 'package:minha_pokedex/src/domain/exceptions/pokemon_api_exceptions.dart';

class SearchPokemonsUseCase {
  Future<List<Pokemon>> call({
    required String searchTerm,
    required List<Pokemon> pokemons,
  }) async {
    try {
      return pokemons.where((pokemon) {
        final nameLower = pokemon.name.toLowerCase();
        final idToString = pokemon.pokedexNumber.toString();
        final searchLower = searchTerm.toLowerCase();

        return nameLower.contains(searchLower) ||
            idToString.contains(searchLower);
      }).toList();

      // TODO: Criar no repository e na api para retornar os pokemons filtrados
      // TODO: https://www.youtube.com/watch?v=oFZIwBudIj0&t=31s
      // TODO: https://github.com/JohannesMilke/filter_listview_example/blob/master/lib/page/filter_local_list_page.dart
      // TODO: https://github.com/JohannesMilke/filter_listview_example/blob/master/lib/api/books_api.dart

    } on CouldNotSearchPokemon {
      rethrow;
    } catch (e) {
      throw Exception('Unexpected error: ${e.toString()}');
    }
  }
}
