import 'package:json_annotation/json_annotation.dart';
part 'patrol.g.dart';

@JsonSerializable()
class Patrol {
  String kdPerusahaan;
  String kdLokasi;
  String periode;
  String keterangan;
  String kdJenis;
  String nmJenis;
  String kdTempat;
  String nmTempat;
  String userPic;
  String nama;
  String noBaris;
  String kdGroup;
  String wktMulai;
  String wktSelesai;
  String fgWrite;
  String userEntry;
  String tglEntry;
  String userUpdate;
  String tglUpdate;
  String photoId;
  String ketPatrol;

  Patrol({
    required this.kdPerusahaan,
    required this.kdLokasi,
    required this.periode,
    required this.keterangan,
    required this.kdJenis,
    required this.nmJenis,
    required this.kdTempat,
    required this.nmTempat,
    required this.userPic,
    required this.nama,
    required this.noBaris,
    required this.kdGroup,
    required this.wktMulai,
    required this.wktSelesai,
    required this.fgWrite,
    required this.userEntry,
    required this.tglEntry,
    required this.userUpdate,
    required this.tglUpdate,
    required this.photoId,
    required this.ketPatrol,
  });
  
  factory Patrol.fromJson(Map<String, dynamic> json) => _$PatrolFromJson(json);
  Map<String, dynamic> toJson() => _$PatrolToJson(this);
}
