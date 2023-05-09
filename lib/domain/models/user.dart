import 'package:asalhapuja/domain/models/models.dart';
import 'package:json_annotation/json_annotation.dart';
part 'user.g.dart';

@JsonSerializable()
class User {
  String nik;
  String nama;
  String password;
  List<Region> regions;

  User({
    required this.nik,
    required this.password,
    required this.nama,
    required this.regions,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
