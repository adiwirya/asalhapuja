import 'package:asalhapuja/data/utils/url.dart';
import 'package:asalhapuja/domain/models/result.dart';
import 'package:retrofit/http.dart';
import 'package:dio/dio.dart';
import 'package:asalhapuja/domain/models/models.dart';
import 'dart:io';

part 'server_repository.g.dart';

@RestApi(baseUrl: BaseURL.baseUrl)
abstract class Server {
  factory Server(Dio dio, {String baseUrl}) = _Server;

  @POST(BaseURL.login)
  Future<Result> login(
    @Body() data,
  );

  @POST(BaseURL.form)
  @MultiPart()
  Future<Result> form(
    @Part() String region_f_id,
    @Part() String nik_koordinator,
    @Part() String organization,
    @Part() String ktp,
    @Part() String name,
    @Part() String printed_name,
    @Part() String gender,
    @Part() String address,
    @Part() String phone_number,
    @Part() String meal,
    @Part() File photo,
  );
}
