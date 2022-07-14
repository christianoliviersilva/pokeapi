import 'package:json_annotation/json_annotation.dart';

part 'pokemon_type.g.dart';

@JsonSerializable()
class PokemonType {
  final String? name;
  final String? url;

  PokemonType({
    this.name,
    this.url,
  });

  factory PokemonType.fromJson(Map<String, dynamic> json) =>
      _$PokemonTypeFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonTypeToJson(this);
}
