// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'form.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Form _$FormFromJson(Map<String, dynamic> json) => Form(
      nik_koordinator: json['nik_koordinator'] as String,
      organization: json['organization'] as String,
      ktp: json['ktp'] as String,
      name: json['name'] as String,
      printed_name: json['printed_name'] as String,
      gender: json['gender'] as String,
      address: json['address'] as String,
      phone_number: json['phone_number'] as String,
      meal: json['meal'] as String,
      photo: json['photo'] as String,
    );

Map<String, dynamic> _$FormToJson(Form instance) => <String, dynamic>{
      'nik_koordinator': instance.nik_koordinator,
      'organization': instance.organization,
      'ktp': instance.ktp,
      'name': instance.name,
      'printed_name': instance.printed_name,
      'gender': instance.gender,
      'address': instance.address,
      'phone_number': instance.phone_number,
      'meal': instance.meal,
      'photo': instance.photo,
    };
