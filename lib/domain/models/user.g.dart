// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      username: json['username'] as String,
      namaLengkap: json['namaLengkap'] as String,
      password: json['password'] as String,
      aktif: json['aktif'] as String,
      email: json['email'] as String,
      id: json['id'] as String,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'username': instance.username,
      'namaLengkap': instance.namaLengkap,
      'password': instance.password,
      'aktif': instance.aktif,
      'email': instance.email,
      'id': instance.id,
    };
