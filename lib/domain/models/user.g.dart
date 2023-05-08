// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      nik: json['nik'] as String,
      password: json['password'] as String,
      nama: json['nama'] as String?,
      regions: (json['regions'] as List<dynamic>?)
          ?.map((e) => Region.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'nik': instance.nik,
      'nama': instance.nama,
      'password': instance.password,
      'regions': instance.regions,
    };
