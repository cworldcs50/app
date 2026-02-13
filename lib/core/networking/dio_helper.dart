import 'dart:developer';

import 'package:dio/dio.dart';
import 'api_constants.dart';

class DioHelper {
  static late final Dio dio;
  static const DioHelper _instance = DioHelper._();

  const DioHelper._();
  factory DioHelper() => _instance;

  void init() {
    dio = Dio(
      BaseOptions(
        baseUrl: ApiConstants.kBaseUrl,
        receiveDataWhenStatusError: true,
        connectTimeout: const Duration(seconds: 20),
        receiveTimeout: const Duration(seconds: 20),
        headers: {
          "User-Agent": "Mozilla/5.0",
          "content-Type": "application/json",
        },
      ),
    );
  }

  Future<Response> getData({
    String? token,
    required String endPoint,
    Map<String, dynamic>? queryParameters,
  }) async {
    final response = await dio.get(endPoint, queryParameters: queryParameters);
    log(" ================= call from get data ===============");
    return response;
  }
}
