import 'package:json_annotation/json_annotation.dart';
part 'result.g.dart';

@JsonSerializable()
class Result {
  String message;
  dynamic data;
  dynamic error;

  Result({
    required this.message,
    this.error,
    this.data,
  });

  factory Result.fromJson(Map<String, dynamic> json) =>
      _$ResultFromJson(json);
  Map<String, dynamic> toJson() => _$ResultToJson(this);
}
