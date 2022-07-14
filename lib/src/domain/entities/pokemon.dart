class Pokemon {
  final int? id;
  final String name;
  final String imageUrl;
  final int pokedexNumber;
  final List<String> types;

  const Pokemon({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.pokedexNumber,
    required this.types,
  });
}
