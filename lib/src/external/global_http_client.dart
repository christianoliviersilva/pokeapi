import 'package:dio/dio.dart';

class GlobalHttpClient {
  late Dio http;

  GlobalHttpClient() {
    configClient();
  }

  void configClient() {
    http = Dio();
    http.options.baseUrl = 'https://pokeapi.co/api/v2/';

    // http.options.connectTimeout = 10000; //5s
    // http.options.receiveTimeout = 10000;
  }
}
