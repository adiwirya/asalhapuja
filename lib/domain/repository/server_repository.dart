// ignore_for_file: non_constant_identifier_names

import 'package:asalhapuja/data/utils/url.dart';
import 'package:asalhapuja/domain/models/result.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
import 'package:dio/dio.dart';
import 'package:asalhapuja/domain/models/models.dart';
import 'dart:io';

part 'server_repository.g.dart';

@RestApi(baseUrl: BaseURL.baseUrl)
abstract class Server {
  factory Server(Dio dio, {String baseUrl}) = _Server;

  @POST(BaseURL.login)
  Future<Result> login(@Body() Map<String, String> data);

  @POST(BaseURL.nik)
  Future<List<String>> getNik(@Body() Map<String, String> data);

  @POST(BaseURL.form)
  @MultiPart()
  //todo add [] to tahun_ikut in server_repository.g.dart
  Future<dynamic> form(
    @Part() int region_f_id,
    @Part() String nik_koordinator,
    @Part() String organization,
    @Part() String ktp,
    @Part() String name,
    @Part() String printed_name,
    @Part() String gender,
    @Part() String address,
    @Part() String phone_number,
    @Part() String meal,
    @Part() String tahun_ikut,
    @Part() String clothes_size,
    @Part() String white_cloth_size,
    @Part() String white_pants_size,
    @Part() int active,
    @Part() File photo,
  );
}
