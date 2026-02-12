import 'package:dio/dio.dart';

class DioHelper {
  static late Dio dio;

  void init() {
    dio = Dio(
      BaseOptions(
        baseUrl: "",
        receiveDataWhenStatusError: true,
        connectTimeout: const Duration(seconds: 20),
        receiveTimeout: const Duration(seconds: 20),
        headers: {"content-Type": "application/json"},
      ),
    );
  }

  Future<Response> getData({
    String? token,
    required String endPoint,
    Map<String, dynamic>? queryParameters,
  }) async {
    final res = await dio.get(endPoint, queryParameters: queryParameters);

    return res;
  }
}
