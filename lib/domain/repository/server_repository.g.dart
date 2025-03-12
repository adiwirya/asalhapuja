// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'server_repository.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers,unused_element,unnecessary_string_interpolations

class _Server implements Server {
  _Server(this._dio, {this.baseUrl, this.errorLogger}) {
    baseUrl ??= 'https://register.asalhapuja.or.id/api/';
  }

  final Dio _dio;

  String? baseUrl;

  final ParseErrorLogger? errorLogger;

  @override
  Future<Result> login(Map<String, String> data) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(data);
    final _options = _setStreamType<Result>(
      Options(method: 'POST', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            'https://register.asalhapuja.or.id/api/login/panitia-jateng/F',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late Result _value;
    try {
      _value = Result.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<List<String>> getNik(Map<String, String> data) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(data);
    final _options = _setStreamType<List<String>>(
      Options(method: 'POST', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            'https://register.asalhapuja.or.id/api/list/peserta-lama',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<List<dynamic>>(_options);
    late List<String> _value;
    try {
      _value = _result.data!.cast<String>();
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<dynamic> form(
    int region_f_id,
    String nik_koordinator,
    String organization,
    String ktp,
    String name,
    String printed_name,
    String gender,
    String address,
    String phone_number,
    String meal,
    String tahun_ikut,
    String clothes_size,
    String white_cloth_size,
    String white_pants_size,
    int active,
    File photo,
  ) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = FormData();
    _data.fields.add(MapEntry('region_f_id', region_f_id.toString()));
    _data.fields.add(MapEntry('nik_koordinator', nik_koordinator));
    _data.fields.add(MapEntry('organization', organization));
    _data.fields.add(MapEntry('ktp', ktp));
    _data.fields.add(MapEntry('name', name));
    _data.fields.add(MapEntry('printed_name', printed_name));
    _data.fields.add(MapEntry('gender', gender));
    _data.fields.add(MapEntry('address', address));
    _data.fields.add(MapEntry('phone_number', phone_number));
    _data.fields.add(MapEntry('meal', meal));
    _data.fields.add(MapEntry('tahun_ikut', tahun_ikut));
    _data.fields.add(MapEntry('clothes_size', clothes_size));
    _data.fields.add(MapEntry('white_cloth_size', white_cloth_size));
    _data.fields.add(MapEntry('white_pants_size', white_pants_size));
    _data.fields.add(MapEntry('active', active.toString()));
    _data.files.add(
      MapEntry(
        'photo',
        MultipartFile.fromFileSync(
          photo.path,
          filename: photo.path.split(Platform.pathSeparator).last,
        ),
      ),
    );
    final _options = _setStreamType<dynamic>(
      Options(
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
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch(_options);
    final _value = _result.data;
    return _value;
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

  String _combineBaseUrls(String dioBaseUrl, String? baseUrl) {
    if (baseUrl == null || baseUrl.trim().isEmpty) {
      return dioBaseUrl;
    }

    final url = Uri.parse(baseUrl);

    if (url.isAbsolute) {
      return url.toString();
    }

    return Uri.parse(dioBaseUrl).resolveUri(url).toString();
  }
}
