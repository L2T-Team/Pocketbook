import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart' hide Response;
import 'package:pocketbook/language/language.dart';
import 'package:pocketbook/utils/app_constant.dart';

extension ResponseX on Response {
  bool get isSuccess => statusCode == 200;

  bool get isCreated => statusCode == 201;

  bool get isAccepted => statusCode == 202;

  bool get isNoContent => statusCode == 204;
}

class DataError implements Exception {
  DataError({
    this.code,
    this.message = '',
    this.errorCode,
  });

  final int? code;
  final String message;
  final String? errorCode;

  factory DataError.defaultApiError() => DataError(
        code: defaultErrorCode,
        message: LanguageKey.defaultApiError.tr,
      );

  static int defaultErrorCode = -1;
  static int timeoutErrorCode = -2;
  static int cancelErrorCode = -3;
  static int otherErrorCode = -4;

  static Either<DataError, T> handleDioError<T>(DioException dioError) {
    try {
      switch (dioError.type) {
        case DioExceptionType.connectionTimeout:
        case DioExceptionType.sendTimeout:
        case DioExceptionType.receiveTimeout:
          return Left(DataError(
            code: timeoutErrorCode,
            message: LanguageKey.apiTimeoutError.tr,
          ));
        case DioExceptionType.badResponse:
          if (dioError.response?.statusCode == 401) {
            return Left(DataError(
              code: 401,
              message: LanguageKey.code401.tr,
            ));
          }
          String? message = _handleStatusCode(dioError);
          String? errorCode = _handleErrorCode(dioError);
          return Left(
            DataError(
              code: dioError.response?.statusCode,
              message: message ?? LanguageKey.defaultApiError.tr,
              errorCode: errorCode,
            ),
          );
        case DioExceptionType.cancel:
          return Left(DataError(
            code: cancelErrorCode,
            message: LanguageKey.apiCancelError.tr,
          ));
        case DioExceptionType.badCertificate:
        case DioExceptionType.connectionError:
        case DioExceptionType.unknown:
          return Left(DataError(
            code: otherErrorCode,
            message: LanguageKey.apiOtherError.tr,
          ));
      }
    } catch (e) {
      return Left(DataError.defaultApiError());
    }
  }

  /// Handle Status Code
  static String? _handleStatusCode(DioException dioError) {
    String? message;
    String? responseCode = dioError.response?.data?['code'];
    String? responseMessage = dioError.response?.data?["message"];
    switch (responseCode) {
      case ErrorCodeConstant.ee000:
        message = LanguageKey.defaultApiError.tr;
        break;
      default:
        if (responseMessage == ErrorCodeConstant.ee021) {
          message = responseMessage;
          break;
        }
        message = LanguageKey.defaultApiError.tr;
    }
    return message;
  }

  /// Handle error code
  static String? _handleErrorCode(DioException dioError) {
    String? errorCode;
    String? responseCode = dioError.response?.data?['code'];

    switch (responseCode) {
      case ErrorCodeConstant.ee022:
        errorCode = ErrorCodeConstant.ee022;
        break;

      default:
        break;
    }
    return errorCode;
  }
}
