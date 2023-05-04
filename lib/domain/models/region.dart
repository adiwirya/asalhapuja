import 'package:json_annotation/json_annotation.dart';
part 'region.g.dart';

@JsonSerializable()
class Region {
  int id;
  String kabupaten;
  String vihara;
  int quota;

  Region({
    required this.id,
    required this.kabupaten,
    required this.vihara,
    required this.quota,
  });

  factory Region.fromJson(Map<String, dynamic> json) => _$RegionFromJson(json);
  Map<String, dynamic> toJson() => _$RegionToJson(this);
  
}
