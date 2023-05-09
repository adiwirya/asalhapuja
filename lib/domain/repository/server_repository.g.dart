// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'server_repository.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _Server implements Server {
  _Server(
    this._dio, {
    this.baseUrl,
  }) {
    baseUrl ??= 'https://register.asalhapuja.or.id/api/';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<Result> login(data) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = data;
    final _result =
        await _dio.fetch<Map<String, dynamic>>(_setStreamType<Result>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'https://register.asalhapuja.or.id/api/login/panitia-jateng/F',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = Result.fromJson(_result.data!);
    return value;
  }

  @override
  Future<Result> form(
    region_f_id,
    nik_koordinator,
    organization,
    ktp,
    name,
    printed_name,
    gender,
    address,
    phone_number,
    meal,
    photo,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = FormData();
    _data.fields.add(MapEntry(
      'region_f_id',
      region_f_id,
    ));
    _data.fields.add(MapEntry(
      'nik_koordinator',
      nik_koordinator,
    ));
    _data.fields.add(MapEntry(
      'organization',
      organization,
    ));
    _data.fields.add(MapEntry(
      'ktp',
      ktp,
    ));
    _data.fields.add(MapEntry(
      'name',
      name,
    ));
    _data.fields.add(MapEntry(
      'printed_name',
      printed_name,
    ));
    _data.fields.add(MapEntry(
      'gender',
      gender,
    ));
    _data.fields.add(MapEntry(
      'address',
      address,
    ));
    _data.fields.add(MapEntry(
      'phone_number',
      phone_number,
    ));
    _data.fields.add(MapEntry(
      'meal',
      meal,
    ));
    _data.files.add(MapEntry(
      'photo',
      MultipartFile.fromFileSync(
        photo.path,
        filename: photo.path.split(Platform.pathSeparator).last,
      ),
    ));
    final _result =
        await _dio.fetch<Map<String, dynamic>>(_setStreamType<Result>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
      contentType: 'multipart/form-data',
    )
            .compose(
              _dio.options,
              'https://register.asalhapuja.or.id/api/register/panitia-jateng/F',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = Result.fromJson(_result.data!);
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
