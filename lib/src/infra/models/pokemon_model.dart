import 'dart:convert';

import 'package:minha_pokedex/src/domain/entities/pokemon.dart';
import 'package:minha_pokedex/src/external/local_storage/pokemons/fav_pokemons_db_fields.dart';

class PokemonModel extends Pokemon {
  final int? id;
  final String name;
  final String imageUrl;
  final int pokedexNumber;
  final List<String> types;

  const PokemonModel({
    this.id,
    required this.name,
    required this.imageUrl,
    required this.pokedexNumber,
    required this.types,
  }) : super(
          id: pokedexNumber,
          name: name,
          imageUrl: imageUrl,
          pokedexNumber: pokedexNumber,
          types: types,
        );

  PokemonModel copyWith({
    int? id,
    String? name,
    String? imageUrl,
    int? pokedexNumber,
    List<String>? types,
  }) =>
      PokemonModel(
        id: id ?? this.id,
        name: name ?? this.name,
        imageUrl: imageUrl ?? this.imageUrl,
        pokedexNumber: pokedexNumber ?? this.pokedexNumber,
        types: types ?? this.types,
      );

  Map<String, Object?> toMap() {
    return {
      FavPokemonsFields.id: id,
      FavPokemonsFields.name: name,
      FavPokemonsFields.imageUrl: imageUrl,
      FavPokemonsFields.pokedexNumber: pokedexNumber,
      FavPokemonsFields.types: types.join(','),
    };
  }

  factory PokemonModel.fromMap(Map<String, dynamic> map) {
    return PokemonModel(
      id: map['_id'] != null ? map['_id'] : null,
      name: map['name'],
      imageUrl: map['imageUrl'],
      pokedexNumber: map['pokedexNumber'],
      types: (map['types'] as String).split(','),
    );
  }

  String toJson() => json.encode(toMap());

  factory PokemonModel.fromJson(String source) =>
      PokemonModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'PokemonModel(id: $id, name: $name, imageUrl: $imageUrl, pokedexNumber: $pokedexNumber, types: $types)';
  }
}
