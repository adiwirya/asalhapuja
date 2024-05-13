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
  String tahun_ikut;
  @JsonKey(name: 'clothes_size')
  String size;
  @JsonKey(name: 'white_cloth_size')
  String baju;
  @JsonKey(name: 'white_pants_size')
  String celana;

  int active;
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
    required this.tahun_ikut,
    required this.active,
    required this.size,
    required this.baju,
    required this.celana,
  });

  factory Forms.fromJson(Map<String, dynamic> json) => Forms(
        nik_koordinator: json['nik_koordinator'] as String,
        organization: json['organization'] as String,
        ktp: json['ktp'] as String,
        name: json['name'] as String,
        printed_name: json['printed_name'] as String,
        gender: json['gender'] as String,
        address: json['address'] as String,
        phone_number: json['phone_number'] as String,
        meal: json['meal'] as String,
        photo: json['photo'] as String,
        region_f_id: json['region_f_id'] as int,
        tahun_ikut: json['tahun_ikut'] as String,
        active: json['active'] as int,
        size: json['clothes_size'] as String,
        baju: json['white_cloth_size'] as String? ?? '',
        celana: json['white_pants_size'] as String? ?? '',
      )..isUpload = json['isUpload'] as int;

  Map<String, dynamic> toJson() => _$FormsToJson(this);
}
