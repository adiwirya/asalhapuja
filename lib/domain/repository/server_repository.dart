import 'package:asalhapuja/data/utils/url.dart';
import 'package:asalhapuja/domain/models/result.dart';
import 'package:retrofit/http.dart';
import 'package:dio/dio.dart';
import 'package:asalhapuja/domain/models/models.dart';

part 'server_repository.g.dart';

@RestApi(baseUrl: BaseURL.baseUrl)
abstract class Server {
  factory Server(Dio dio, {String baseUrl}) = _Server;

  @POST(BaseURL.login)
  Future<Result> login(
    @Body() data,
  );

  @POST(BaseURL.form)
  Future<Result> form(
    @Body() Form form,
  );
}
