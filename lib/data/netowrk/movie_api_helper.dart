import 'package:dio/dio.dart';
import 'package:movies_app/components/constants/constants.dart';

class MovieApiHelper {
  static late Dio dio;
  static init() {
    dio = Dio(BaseOptions(
        baseUrl: Constants.baseUrl, receiveDataWhenStatusError: true));
  }

  static Future<Response> fetchMovie(
      {required String url, required Map<String, dynamic> query}) async {
    Response response = await dio.get(url, queryParameters: query);
    return response;
  }
}
