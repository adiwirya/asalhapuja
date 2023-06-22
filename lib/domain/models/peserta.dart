// import 'package:json_annotation/json_annotation.dart';
// part 'peserta.g.dart';

// @JsonSerializable()
class Peserta {
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
  int active;
  int isUpload = 1;

  Peserta({
    required this.active,
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
  });

  factory Peserta.fromJson(Map<String, dynamic> json) => Peserta(
        nik_koordinator: json['region']['coor']['nik_koordinator'] as String,
        organization: json['organization'] as String,
        ktp: json['ktp'] as String,
        name: json['name'] as String,
        printed_name: json['printed_name'] as String,
        gender: json['gender'] as String,
        address: json['address'] as String,
        phone_number: json['phone_number'] as String,
        meal: json['meal'] as String,
        photo: json['ktp'] + '.jpg' as String,
        region_f_id: json['regions_F_id'] as int,
        tahun_ikut: json['tahun_ikut'] as String,
        active: json['active'] as int,
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'region_f_id': region_f_id,
        'nik_koordinator': nik_koordinator,
        'organization': organization,
        'ktp': ktp,
        'name': name,
        'printed_name': printed_name,
        'gender': gender,
        'address': address,
        'phone_number': phone_number,
        'meal': meal,
        'photo': photo,
        'tahun_ikut': tahun_ikut,
        'isUpload': isUpload,
        'active': active,
      };
}
