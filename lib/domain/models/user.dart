import 'package:json_annotation/json_annotation.dart';
part 'user.g.dart';

@JsonSerializable()
class User {
  String username;
  String namaLengkap;
  String password;
  String aktif;
  String email;
  String id;

  User({
    required this.username,
    required this.namaLengkap,
    required this.password,
    required this.aktif,
    required this.email,
    required this.id,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
