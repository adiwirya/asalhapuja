// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'region.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Region _$RegionFromJson(Map<String, dynamic> json) => Region(
      id: json['id'] as int,
      kabupaten: json['kabupaten'] as String,
      vihara: json['vihara'] as String,
      quota: json['quota'] as int,
    );

Map<String, dynamic> _$RegionToJson(Region instance) => <String, dynamic>{
      'id': instance.id,
      'kabupaten': instance.kabupaten,
      'vihara': instance.vihara,
      'quota': instance.quota,
    };
