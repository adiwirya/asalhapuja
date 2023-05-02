import 'package:json_annotation/json_annotation.dart';
part 'lokasi.g.dart';

@JsonSerializable()
class Lokasi {
  String? kdPerusahaan;
  String kdLokasi;
  String namaLokasi;

  Lokasi({
    this.kdPerusahaan,
    required this.kdLokasi,
    required this.namaLokasi,
  });

  factory Lokasi.fromJson(Map<String, dynamic> json) => _$LokasiFromJson(json);
  Map<String, dynamic> toJson() => _$LokasiToJson(this);
}
