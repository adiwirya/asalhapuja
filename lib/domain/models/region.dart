import 'package:json_annotation/json_annotation.dart';
part 'region.g.dart';

@JsonSerializable()
class Region {
  int id;
  String vihara;

  Region({
    required this.id,
    required this.vihara,
  });

  factory Region.fromJson(Map<String, dynamic> json) => _$RegionFromJson(json);
  Map<String, dynamic> toJson() => _$RegionToJson(this);
}
