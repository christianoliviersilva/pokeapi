// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'type.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TypeInfo _$TypeInfoFromJson(Map<String, dynamic> json) => TypeInfo(
      slot: json['slot'] as int?,
      type: json['type'] == null
          ? null
          : PokemonType.fromJson(json['type'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TypeInfoToJson(TypeInfo instance) => <String, dynamic>{
      'slot': instance.slot,
      'type': instance.type,
    };
