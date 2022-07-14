import 'package:json_annotation/json_annotation.dart';

part 'sprites.g.dart';

@JsonSerializable()
class Sprites {
  final String? backDefault;
  @JsonKey(name: 'front_default')
  final String? frontDefault;
  final String? frontShiny;

  Sprites({
    this.backDefault,
    this.frontDefault,
    this.frontShiny,
  });

  factory Sprites.fromJson(Map<String, dynamic> json) =>
      _$SpritesFromJson(json);

  Map<String, dynamic> toJson() => _$SpritesToJson(this);
}
