class ZipCodeOptionModel {
  BField? district;
  PField? province;
  AAField? anotherAddress;
  MAField? majorAddress;
  MACField? towns;
  ZCField? zipcodes;

  ZipCodeOptionModel({
    this.anotherAddress,
    this.district,
    this.majorAddress,
    this.province,
    this.towns,
    this.zipcodes,
  });
}

class ZipcodeModel {
  Data? data;

  ZipcodeModel({this.data});

  ZipcodeModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  Header? header;
  Body? body;

  Data({this.header, this.body});

  Data.fromJson(Map<String, dynamic> json) {
    header = json['header'] != null ? Header.fromJson(json['header']) : null;
    body = json['body'] != null ? Body.fromJson(json['body']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (header != null) {
      data['header'] = header!.toJson();
    }
    if (body != null) {
      data['body'] = body!.toJson();
    }
    return data;
  }
}

class Header {
  ResultInfo? resultInfo;

  Header({this.resultInfo});

  Header.fromJson(Map<String, dynamic> json) {
    resultInfo = json['resultInfo'] != null
        ? ResultInfo.fromJson(json['resultInfo'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (resultInfo != null) {
      data['resultInfo'] = resultInfo!.toJson();
    }
    return data;
  }
}

class ResultInfo {
  String? resultCd;
  String? searchState;

  ResultInfo({this.resultCd, this.searchState});

  ResultInfo.fromJson(Map<String, dynamic> json) {
    resultCd = json['resultCd'];
    searchState = json['searchState'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['resultCd'] = resultCd;
    data['searchState'] = searchState;
    return data;
  }
}

class Body {
  ResponseInfo? responseInfo;

  Body({this.responseInfo});

  Body.fromJson(Map<String, dynamic> json) {
    responseInfo = json['responseInfo'] != null
        ? ResponseInfo.fromJson(json['responseInfo'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (responseInfo != null) {
      data['responseInfo'] = responseInfo!.toJson();
    }
    return data;
  }
}

class ResponseInfo {
  List<MACField>? mAC;
  List<ZCField>? zC;
  List<PField>? p;
  List<MAField>? mA;
  List<AAField>? aA;
  List<BField>? b;

  ResponseInfo({this.mAC, this.zC, this.p, this.mA, this.aA, this.b});

  factory ResponseInfo.fromJson(Map<String, dynamic> json) {
    return ResponseInfo(
      mAC: parseField<MACField>(json['MAC'], MACField.fromJson),
      p: parseField<PField>(json['P'], PField.fromJson),
      zC: parseField<ZCField>(json['ZC'], ZCField.fromJson),
      mA: parseField<MAField>(json['MA'], MAField.fromJson),
      aA: parseField<AAField>(json['AA'], AAField.fromJson),
      b: parseField<BField>(json['B'], BField.fromJson),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (mAC != null) {
      data['MAC'] = mAC!.map((v) => v.toJson()).toList();
    }
    if (zC != null) {
      data['ZC'] = zC!.map((v) => v.toJson()).toList();
    }
    if (p != null) {
      data['P'] = p!.map((v) => v.toJson()).toList();
    }
    if (mA != null) {
      data['MA'] = mA!.map((v) => v.toJson()).toList();
    }
    if (aA != null) {
      data['AA'] = aA!.map((v) => v.toJson()).toList();
    }
    if (b != null) {
      data['B'] = b!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  static List<T>? parseField<T>(
      dynamic value, T Function(Map<String, dynamic> json) fromJson) {
    if (value != null) {
      if (value is List) {
        return List<T>.from(
          (value).map((x) => fromJson(x)),
        );
      } else {
        return [fromJson(value)];
      }
    }
    return null;
  }

  List<ZipCodeOptionModel> mapToOption() {
    if (mA?.isEmpty ?? true) {
      return [];
    }
    return List.generate(
      mA!.length,
      (index) => ZipCodeOptionModel(
        district: index < (b?.length ?? 0) ? b![index] : null,
        anotherAddress: index < (aA?.length ?? 0) ? aA![index] : null,
        majorAddress: index < (mA?.length ?? 0) ? mA![index] : null,
        province: index < (p?.length ?? 0) ? p![index] : null,
        zipcodes: index < (zC?.length ?? 0) ? zC![index] : null,
        towns: index < (mAC?.length ?? 0) ? mAC![index] : null,
      ),
    );
  }
}

class MACField {
  String? mACD;

  MACField({this.mACD});

  MACField.fromJson(Map<String, dynamic> json) {
    mACD = json['MACD'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['MACD'] = mACD;
    return data;
  }
}

class ZCField {
  String? zCD;

  ZCField({this.zCD});

  ZCField.fromJson(Map<String, dynamic> json) {
    zCD = json['ZCD'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ZCD'] = zCD;
    return data;
  }
}

class PField {
  String? pN;
  String? pK;

  PField({this.pN, this.pK});

  PField.fromJson(Map<String, dynamic> json) {
    pN = json['PN'];
    pK = json['PK'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['PN'] = pN;
    data['PK'] = pK;
    return data;
  }
}

class MAField {
  String? mAN;
  String? mAK;

  MAField({this.mAN, this.mAK});

  MAField.fromJson(Map<String, dynamic> json) {
    mAN = json['MAN'];
    mAK = json['MAK'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['MAN'] = mAN;
    data['MAK'] = mAK;
    return data;
  }
}

class AAField {
  String? aAN;
  String? aAK;

  AAField({this.aAN, this.aAK});

  AAField.fromJson(Map<String, dynamic> json) {
    aAN = json['AAN'];
    aAK = json['AAK'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['AAN'] = aAN;
    data['AAK'] = aAK;
    return data;
  }
}

class BField {
  String? bN;
  String? bK;

  BField({this.bN, this.bK});

  BField.fromJson(Map<String, dynamic> json) {
    bN = json['BN'];
    bK = json['BK'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['BN'] = bN;
    data['BK'] = bK;
    return data;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BField &&
          runtimeType == other.runtimeType &&
          bN == other.bN &&
          bK == other.bK;

  @override
  int get hashCode => bN.hashCode + bK.hashCode;
}
