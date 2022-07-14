// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_indice.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GameIndice _$GameIndiceFromJson(Map<String, dynamic> json) => GameIndice(
      gameIndex: json['gameIndex'] as int?,
      version: json['version'] == null
          ? null
          : Version.fromJson(json['version'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GameIndiceToJson(GameIndice instance) =>
    <String, dynamic>{
      'gameIndex': instance.gameIndex,
      'version': instance.version,
    };
