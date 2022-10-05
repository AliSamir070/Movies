import 'package:dio/dio.dart';
import 'package:movies_app/components/constants/constants.dart';

class MovieApiHelper{
  static late Dio dio;
  static init(){
    dio = Dio(BaseOptions(baseUrl: Constants.BaseUrl , receiveDataWhenStatusError: true));
  }
  static Future<Response> getDetailedMovie(int movieId){
    return dio.get(Constants.getDetailedUrl(movieId),queryParameters: {
      "api_key":Constants.aliApiKey
    });
  }
  static Future<Response> getSimilarMovies(int movieId){
    return dio.get(Constants.getSimilarMoviesUrl(movieId),queryParameters: {
      "api_key":Constants.aliApiKey
    });
  }
}