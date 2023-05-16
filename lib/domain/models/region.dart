import 'package:json_annotation/json_annotation.dart';
part 'region.g.dart';

@JsonSerializable()
class Region {
  int id;
  String kabupaten;
  String vihara;
  int quota;
  int sisa;

  Region({
    required this.id,
    required this.kabupaten,
    required this.vihara,
    required this.quota,
    this.sisa = 0,
  });

  factory Region.fromJson(Map<String, dynamic> json) => _$RegionFromJson(json);
  Map<String, dynamic> toJson() => _$RegionToJson(this);
}
