// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'asset.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Asset _$AssetFromJson(Map<String, dynamic> json) => Asset(
      kdPerusahaan: json['kdPerusahaan'] as String,
      kdLokasi: json['kdLokasi'] as String,
      kdJenis: json['kdJenis'] as String,
      kdKategori: json['kdKategori'] as String,
      kdTempat: json['kdTempat'] as String,
      kdBaris: json['kdBaris'] as String,
      kdItemGroup: json['kdItemGroup'] as String,
      kdPilih: json['kdPilih'] as String,
      deskripsi: json['deskripsi'] as String,
      parameter: json['parameter'] as String,
      hasilItemCek: json['hasilItemCek'] as String,
      nilai1: json['nilai1'] as String,
      nilai2: json['nilai2'] as String,
    );

Map<String, dynamic> _$AssetToJson(Asset instance) => <String, dynamic>{
      'kdPerusahaan': instance.kdPerusahaan,
      'kdLokasi': instance.kdLokasi,
      'kdJenis': instance.kdJenis,
      'kdKategori': instance.kdKategori,
      'kdTempat': instance.kdTempat,
      'kdBaris': instance.kdBaris,
      'kdItemGroup': instance.kdItemGroup,
      'kdPilih': instance.kdPilih,
      'deskripsi': instance.deskripsi,
      'parameter': instance.parameter,
      'hasilItemCek': instance.hasilItemCek,
      'nilai1': instance.nilai1,
      'nilai2': instance.nilai2,
    };
