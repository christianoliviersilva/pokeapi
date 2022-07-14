import 'package:json_annotation/json_annotation.dart';
import 'package:minha_pokedex/src/external/poke_api/api_models/version.dart';

part 'game_indice.g.dart';

@JsonSerializable()
class GameIndice {
  final int? gameIndex;
  final Version? version;

  GameIndice({
    this.gameIndex,
    this.version,
  });

  factory GameIndice.fromJson(Map<String, dynamic> json) =>
      _$GameIndiceFromJson(json);

  Map<String, dynamic> toJson() => _$GameIndiceToJson(this);
}
