import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:pocketbook/language/language.dart';
import 'package:pocketbook/model/requests/stripe_billing_details_request_model.dart';
import 'package:pocketbook/model/requests/stripe_card_request_model.dart';
import 'package:pocketbook/model/responses/stripe_error_response_model.dart';
import 'package:pocketbook/model/responses/stripe_response.dart';
import 'package:pocketbook/utils/app_repo_utils.dart';

abstract class StripeService {
  Future<Either<StripeErrorResponseModel, StripeResponse>> createPaymentMethod({
    required String stripePublishableKey,
    required StripeCardRequestModel card,
    StripeBillingDetailsRequestModel? billingDetails,
  });

  Future<Either<DataError, StripeResponse>> retrievePaymentMethod(
      {required String stripePublishableKey, required String id});
}

class StripeServiceImpl extends StripeService {
  final _url = 'https://api.stripe.com/v1/payment_methods';

  @override
  Future<Either<StripeErrorResponseModel, StripeResponse>> createPaymentMethod({
    required String stripePublishableKey,
    required StripeCardRequestModel card,
    StripeBillingDetailsRequestModel? billingDetails,
  }) async {
    try {
      var res = await Dio().post(
        _url,
        options: Options(headers: {
          'Authorization': 'Bearer $stripePublishableKey',
          'Content-Type': 'application/x-www-form-urlencoded'
        }),
        data: {
          'type': 'card',
          'card[number]': card.number,
          'card[exp_month]': card.expMonth,
          'card[exp_year]': card.expYear,
          'card[cvc]': card.cvc,
          'billing_details[address][country]': billingDetails?.address?.country,
          'billing_details[address][postal_code]':
              billingDetails?.address?.postalCode,
          'billing_details[address][state]': billingDetails?.address?.state,
          'billing_details[address][city]': billingDetails?.address?.city,
          'billing_details[address][line1]': billingDetails?.address?.address1,
          'billing_details[address][line2]': billingDetails?.address?.address2,
          'billing_details[email]': billingDetails?.email,
          'billing_details[name]': billingDetails?.name,
          'billing_details[phone]': billingDetails?.phone,
        },
      );
      if (res.isSuccess) {
        return Right(StripeResponse.fromJson(res.data));
      }
      return Left(StripeErrorResponseModel.fromMap(res.data));
    } on DioException catch (e) {
      return Left(StripeErrorResponseModel.fromMap(e.response?.data['error']));
    }
  }

  @override
  Future<Either<DataError, StripeResponse>> retrievePaymentMethod(
      {required String stripePublishableKey, required String id}) async {
    try {
      var res = await Dio().get(
        '$_url/$id',
        options: Options(headers: {
          'Authorization': 'Bearer $stripePublishableKey',
        }),
      );
      if (res.isSuccess) {
        return Right(StripeResponse.fromJson(res.data));
      }
      return Left(DataError(
        message: res.statusMessage ?? LanguageKey.defaultApiError.tr,
        code: res.statusCode,
      ));
    } catch (e) {
      return Left(DataError.defaultApiError());
    }
  }
}
