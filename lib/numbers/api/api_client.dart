import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retrofit/http.dart';

part 'api_client.g.dart';

final apiClientProvider = Provider((ref) => ApiClient(Dio()));

@RestApi(baseUrl: "https://info.gesundheitsministerium.gv.at")
abstract class ApiClient {

  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  @GET("/data/timeline-eimpfpass.csv")
  Future<String> eImpfpass();
}
