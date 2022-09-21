import 'package:dio/dio.dart';
import 'package:movies_app/components/constants/constants.dart';

class MovieApiHelper{
  static late Dio dio;
  static init(){
    dio = Dio(BaseOptions(baseUrl: Constants.BaseUrl , receiveDataWhenStatusError: true));
  }
}