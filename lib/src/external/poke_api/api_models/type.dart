import 'package:json_annotation/json_annotation.dart';
import 'package:minha_pokedex/src/external/poke_api/api_models/pokemon_type.dart';

part 'type.g.dart';

@JsonSerializable()
class TypeInfo {
  final int? slot;
  final PokemonType? type;

  TypeInfo({
    this.slot,
    this.type,
  });

  factory TypeInfo.fromJson(Map<String, dynamic> json) =>
      _$TypeInfoFromJson(json);

  Map<String, dynamic> toJson() => _$TypeInfoToJson(this);
}
