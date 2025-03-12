// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Result _$ResultFromJson(Map<String, dynamic> json) => Result(
  message: json['message'] as String,
  error: json['error'],
  data: json['data'],
);

Map<String, dynamic> _$ResultToJson(Result instance) => <String, dynamic>{
  'message': instance.message,
  'data': instance.data,
  'error': instance.error,
};
