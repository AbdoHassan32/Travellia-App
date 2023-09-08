import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';

class ApiService {
  final Dio dio;
  static const baseUrl = "https://travel-advisor.p.rapidapi.com/hotels/";

  final _headers = {
    'x-rapidapi-key': '55ce4ce84dmsh958912c7fc83a63p1ada35jsn84e62cdf1bc9',
    'x-rapidapi-host': 'travel-advisor.p.rapidapi.com',
  };


  ApiService(this.dio);
  Future<Map<String, dynamic>> get({required String query}) async {
    dio.interceptors.add(DioCacheManager(CacheConfig()).interceptor);
    var response = await dio.get('$baseUrl$query',
        options: buildCacheOptions(const Duration(days: 7),
            forceRefresh: false,
            options: Options(
              receiveTimeout: 1000000,
              sendTimeout: 1000000,
              headers: _headers,
            )));

    return response.data;
  }
}
