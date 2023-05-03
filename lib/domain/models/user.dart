import 'package:json_annotation/json_annotation.dart';
part 'user.g.dart';

@JsonSerializable()
class User {
  String nik;
  String nama;
  String password;
  String quota;

  User({
    required this.nik,
    required this.nama,
    required this.password,
    required this.quota,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
