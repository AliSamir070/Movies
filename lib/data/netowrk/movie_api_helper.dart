import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/components/constants/constants.dart';

class MovieApiHelper {
  static late Dio dio;
  static init() {
    dio = Dio(BaseOptions(
        baseUrl: Constants.BaseUrl, receiveDataWhenStatusError: true));
  }

  static Future<Response> GetData({
    required String url,
    @required dynamic query,
  }) async {
    return dio.get(url, queryParameters: query);
  }
}
