// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      nik: json['nik'] as String,
      password: json['password'] as String,
      nama: json['nama'] as String,
      regions: (json['regions'] as List<dynamic>)
          .map((e) => Region.fromJson(e as Map<String, dynamic>))
          .toList(),
      kota: json['kota'] as String,
      quota: json['quota'] as int,
      sisa: json['sisa'] as int? ?? 0,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'nik': instance.nik,
      'nama': instance.nama,
      'password': instance.password,
      'kota': instance.kota,
      'quota': instance.quota,
      'sisa': instance.sisa,
      'regions': instance.regions,
    };
