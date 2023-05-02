import 'package:json_annotation/json_annotation.dart';
part 'perusahaan.g.dart';

@JsonSerializable()
class Perusahaan {
  String kdPerusahaan;
  String nama;

  Perusahaan({
    required this.kdPerusahaan,
    required this.nama,
  });

  factory Perusahaan.fromJson(Map<String, dynamic> json) =>
      _$PerusahaanFromJson(json);
  Map<String, dynamic> toJson() => _$PerusahaanToJson(this);
}
