// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'form.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Forms _$FormsFromJson(Map<String, dynamic> json) => Forms(
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
      region_f_id: json['region_f_id'] as int,
      tahun_ikut: json['tahun_ikut'] as String,
      active: json['active'] as int,
      size: json['clothes_size'] as String,
    )..isUpload = json['isUpload'] as int;

Map<String, dynamic> _$FormsToJson(Forms instance) => <String, dynamic>{
      'region_f_id': instance.region_f_id,
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
      'tahun_ikut': instance.tahun_ikut,
      'clothes_size': instance.size,
      'active': instance.active,
      'isUpload': instance.isUpload,
    };
