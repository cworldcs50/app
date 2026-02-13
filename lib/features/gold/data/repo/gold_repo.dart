import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:dartz/dartz.dart';
import '../models/gold_model.dart';
import '../../../../core/networking/dio_helper.dart';
import '../../../../core/networking/api_constants.dart';

class GoldRepo {
  Future<Either<String, GoldModel>> call() async {
    try {
      final response = await DioHelper().getData(
        endPoint: ApiConstants.kGoldEndPoint,
      );

      log("call from GoldRepo");

      return Right(GoldModel.fromJson(response.data));
    } on DioException catch (e) {
      return Left(e.message ?? "");
    } catch (e) {
      return Left(e.toString());
    }
  }
}
