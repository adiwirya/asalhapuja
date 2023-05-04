// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      nik: json['nik'] as String,
      nama: json['nama'] as String,
      password: json['password'] as String,
      regions: Region.fromJson(json['regions'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'nik': instance.nik,
      'nama': instance.nama,
      'password': instance.password,
      'regions': instance.regions,
    };
