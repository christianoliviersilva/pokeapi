import 'package:json_annotation/json_annotation.dart';

part 'pokemon_from_api_list.g.dart';

@JsonSerializable()
class PokemonFromApiList {
  final String? name;
  final String? url;

  PokemonFromApiList({
    this.name,
    this.url,
  });

  factory PokemonFromApiList.fromJson(Map<String, dynamic> json) =>
      _$PokemonFromApiListFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonFromApiListToJson(this);
}
