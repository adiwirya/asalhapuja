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
      quota_maksimal: json['quota_maksimal'] as int,
      quota_sisa: json['quota_sisa'] as int,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'nik': instance.nik,
      'nama': instance.nama,
      'password': instance.password,
      'kota': instance.kota,
      'quota_maksimal': instance.quota_maksimal,
      'quota_sisa': instance.quota_sisa,
      'regions': instance.regions,
    };
