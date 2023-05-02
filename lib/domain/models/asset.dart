import 'package:json_annotation/json_annotation.dart';
part 'asset.g.dart';

@JsonSerializable()
class Asset {
  String kdPerusahaan;
  String kdLokasi;
  String kdJenis;
  String kdKategori;
  String kdTempat;
  String kdBaris;
  String kdItemGroup;
  String kdPilih;
  String deskripsi;
  String parameter;
  String hasilItemCek;
  String nilai1;
  String nilai2;

  Asset({
    required this.kdPerusahaan,
    required this.kdLokasi,
    required this.kdJenis,
    required this.kdKategori,
    required this.kdTempat,
    required this.kdBaris,
    required this.kdItemGroup,
    required this.kdPilih,
    required this.deskripsi,
    required this.parameter,
    required this.hasilItemCek,
    required this.nilai1,
    required this.nilai2,
  });

  factory Asset.fromJson(Map<String, dynamic> json) => _$AssetFromJson(json);
  Map<String, dynamic> toJson() => _$AssetToJson(this);
}
