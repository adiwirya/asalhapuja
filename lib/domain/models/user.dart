import 'package:asalhapuja/domain/models/models.dart';
import 'package:json_annotation/json_annotation.dart';
part 'user.g.dart';

@JsonSerializable()
class User {
  String nik;
  String nama;
  String password;
  String kota;
  int quota;
  int sisa;
  List<Region> regions;

  User({
    required this.nik,
    required this.password,
    required this.nama,
    required this.regions,
    required this.kota,
    required this.quota,
    this.sisa = 0,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() {
    return {
      'nik': nik,
      'nama': nama,
      'password': password,
      'kota': kota,
      'quota': quota,
      'sisa': sisa,
      'regions': regions.map((region) => region.toJson()).toList(),
    };
  }
}
