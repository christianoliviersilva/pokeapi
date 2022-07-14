import 'package:minha_pokedex/src/external/poke_api/api_models/stat.dart';
import 'package:json_annotation/json_annotation.dart';

part 'stats.g.dart';

@JsonSerializable()
class Stats {
  @JsonKey(name: 'base_stat')
  final int? baseStat;
  final int? effort;
  final Stat? stat;

  Stats({
    this.baseStat,
    this.effort,
    this.stat,
  });

  factory Stats.fromJson(Map<String, dynamic> json) => _$StatsFromJson(json);

  Map<String, dynamic> toJson() => _$StatsToJson(this);
}
