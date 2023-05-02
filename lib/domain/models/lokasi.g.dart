// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lokasi.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Lokasi _$LokasiFromJson(Map<String, dynamic> json) => Lokasi(
      kdPerusahaan: json['kdPerusahaan'] as String?,
      kdLokasi: json['kdLokasi'] as String,
      namaLokasi: json['namaLokasi'] as String,
    );

Map<String, dynamic> _$LokasiToJson(Lokasi instance) => <String, dynamic>{
      'kdPerusahaan': instance.kdPerusahaan,
      'kdLokasi': instance.kdLokasi,
      'namaLokasi': instance.namaLokasi,
    };
