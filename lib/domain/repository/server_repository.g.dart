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
  Future<Result> form(form) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(form.toJson());
    final _result =
        await _dio.fetch<Map<String, dynamic>>(_setStreamType<Result>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
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
