// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      nik: json['nik'] as String,
      nama: json['nama'] as String,
      password: json['password'] as String,
      quota: json['quota'] as String,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'nik': instance.nik,
      'nama': instance.nama,
      'password': instance.password,
      'quota': instance.quota,
    };
