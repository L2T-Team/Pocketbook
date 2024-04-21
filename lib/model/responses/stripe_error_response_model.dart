import 'dart:convert';

class StripeErrorResponseModel {
  String? code;
  String? docUrl;
  String? message;
  String? param;
  String? requestLogUrl;
  String? type;

  StripeErrorResponseModel({
    this.code,
    this.docUrl,
    this.message,
    this.param,
    this.requestLogUrl,
    this.type,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'code': code});
    result.addAll({'docUrl': docUrl});
    result.addAll({'message': message});
    result.addAll({'param': param});
    result.addAll({'requestLogUrl': requestLogUrl});
    result.addAll({'type': type});

    return result;
  }

  factory StripeErrorResponseModel.fromMap(Map<String, dynamic> map) {
    return StripeErrorResponseModel(
      code: map['code'] ?? '',
      docUrl: map['doc_url'] ?? '',
      message: map['message'] ?? '',
      param: map['param'] ?? '',
      requestLogUrl: map['request_log_url'] ?? '',
      type: map['type'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory StripeErrorResponseModel.fromJson(String source) =>
      StripeErrorResponseModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'StripeErrorResponseModel(code: $code, docUrl: $docUrl, message: $message, param: $param, requestLogUrl: $requestLogUrl, type: $type)';
  }
}
