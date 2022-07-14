// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_details_api.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PokemonDetailsApi _$PokemonDetailsApiFromJson(Map<String, dynamic> json) =>
    PokemonDetailsApi(
      abilities: (json['abilities'] as List<dynamic>?)
          ?.map((e) =>
              e == null ? null : Ability.fromJson(e as Map<String, dynamic>))
          .toList(),
      baseExperience: json['baseExperience'] as int?,
      gameIndices: (json['gameIndices'] as List<dynamic>?)
          ?.map((e) =>
              e == null ? null : GameIndice.fromJson(e as Map<String, dynamic>))
          .toList(),
      height: json['height'] as int?,
      heldItems: (json['heldItems'] as List<dynamic>?)
          ?.map((e) =>
              e == null ? null : Item.fromJson(e as Map<String, dynamic>))
          .toList(),
      id: json['id'] as int?,
      isDefault: json['isDefault'] as bool?,
      locationAreaEncounters: json['locationAreaEncounters'] as String?,
      moves: (json['moves'] as List<dynamic>?)
          ?.map((e) =>
              e == null ? null : Move.fromJson(e as Map<String, dynamic>))
          .toList(),
      name: json['name'] as String?,
      order: json['order'] as int?,
      species: json['species'] == null
          ? null
          : Species.fromJson(json['species'] as Map<String, dynamic>),
      sprites: json['sprites'] == null
          ? null
          : Sprites.fromJson(json['sprites'] as Map<String, dynamic>),
      stats: (json['stats'] as List<dynamic>?)
          ?.map((e) =>
              e == null ? null : Stats.fromJson(e as Map<String, dynamic>))
          .toList(),
      types: (json['types'] as List<dynamic>?)
          ?.map((e) =>
              e == null ? null : TypeInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
      weight: json['weight'] as int?,
    );

Map<String, dynamic> _$PokemonDetailsApiToJson(PokemonDetailsApi instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'baseExperience': instance.baseExperience,
      'height': instance.height,
      'weight': instance.weight,
      'isDefault': instance.isDefault,
      'order': instance.order,
      'locationAreaEncounters': instance.locationAreaEncounters,
      'sprites': instance.sprites,
      'species': instance.species,
      'abilities': instance.abilities,
      'gameIndices': instance.gameIndices,
      'heldItems': instance.heldItems,
      'moves': instance.moves,
      'types': instance.types,
      'stats': instance.stats,
    };
