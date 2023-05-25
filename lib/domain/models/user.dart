import 'package:asalhapuja/domain/models/models.dart';
import 'package:json_annotation/json_annotation.dart';
part 'user.g.dart';

@JsonSerializable()
class User {
  String nik;
  String nama;
  String password;
  String kota;
  int quota_maksimal;
  int quota_sisa;
  List<Region> regions;

  User({
    required this.nik,
    required this.password,
    required this.nama,
    required this.regions,
    required this.kota,
    required this.quota_maksimal,
    required this.quota_sisa,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() {
    return {
      'nik': nik,
      'nama': nama,
      'password': password,
      'kota': kota,
      'quota_maksimal': quota_maksimal,
      'quota_sisa': quota_sisa,
      'regions': regions.map((region) => region.toJson()).toList(),
    };
  }
}
