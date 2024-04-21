import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart' as getx;
import 'package:pocketbook/language/language.dart';
import 'package:pocketbook/services/api/api.dart';
import 'package:pocketbook/utils/app_repo_utils.dart';

abstract class BaseRemote extends DioApi {
  BaseRemote() : super(authRepo: getx.Get.find());

  Future<Either<DataError, T?>> callApiWithErrorParser<T>(
    Future<Response<T?>> api,
  ) async {
    try {
      var res = await api;
      if (res.isCreated) {
        return const Right(null);
      }
      if (res.isNoContent) {
        return const Right(null);
      }
      if (res.isSuccess) {
        return Right(res.data);
      }
      if (res.isNoContent) {
        return const Right(null);
      }

      if (res.isAccepted) {
        return Right(res.data);
      }
      return Left(DataError(
        message: LanguageKey.defaultApiError.tr,
        code: res.statusCode,
      ));
    } on DioException catch (e) {
      if (e.type == DioExceptionType.cancel) {
        return Left(DataError.defaultApiError());
      }
      if (e.response?.statusCode == 204) {
        return const Right(null);
      }
      return DataError.handleDioError(e);
    } catch (e) {
      return Left(DataError.defaultApiError());
    }
  }
}
