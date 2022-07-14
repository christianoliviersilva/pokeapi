import 'package:minha_pokedex/src/domain/entities/pokemon_stats.dart';

class PokemonDetails {
  final String name;
  final String imageUrl;
  final int pokedexNumber;
  final List<String> types;
  final int weight;
  final int height;
  final List<PokemonStats> stats;

  const PokemonDetails({
    required this.name,
    required this.imageUrl,
    required this.pokedexNumber,
    required this.types,
    required this.weight,
    required this.height,
    required this.stats,
  });
}
