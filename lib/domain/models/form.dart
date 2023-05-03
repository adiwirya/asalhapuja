import 'dart:io';
import 'package:json_annotation/json_annotation.dart';
part 'form.g.dart';

@JsonSerializable()
class Form {
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

  Form({
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
  });

  factory Form.fromJson(Map<String, dynamic> json) => _$FormFromJson(json);
  Map<String, dynamic> toJson() => _$FormToJson(this);
}
