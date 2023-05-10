// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';
part 'form.g.dart';

@JsonSerializable()
class Forms {
  int region_f_id;
  String nik_koordinator;
  String organization;
  String ktp;
  String name;
  String printed_name;
  String gender;
  String address;
  String phone_number;
  String meal;
  String photo;
  int isUpload = 0;

  Forms({
    required this.nik_koordinator,
    required this.organization,
    required this.ktp,
    required this.name,
    required this.printed_name,
    required this.gender,
    required this.address,
    required this.phone_number,
    required this.meal,
    required this.photo,
    required this.region_f_id,
  });

  factory Forms.fromJson(Map<String, dynamic> json) => _$FormsFromJson(json);
  Map<String, dynamic> toJson() => _$FormsToJson(this);
}
