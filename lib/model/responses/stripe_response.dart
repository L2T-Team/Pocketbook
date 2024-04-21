/// id : "pm_1NSddQIggMw7NXtL9oFyYhK8"
/// object : "payment_method"
/// billing_details : {"address":{"city":null,"country":null,"line1":null,"line2":null,"postal_code":null,"state":null},"email":null,"name":null,"phone":null}
/// card : {"brand":"visa","checks":{"address_line1_check":null,"address_postal_code_check":null,"cvc_check":null},"country":"US","exp_month":12,"exp_year":2030,"funding":"credit","generated_from":null,"last4":"4242","networks":{"available":["visa"],"preferred":null},"three_d_secure_usage":{"supported":true},"wallet":null}
/// created : 1689070652
/// customer : null
/// livemode : false
/// type : "card"
class StripeResponse {
  StripeResponse({
    this.id,
    this.object,
    this.billingDetails,
    this.card,
    this.created,
    this.customer,
    this.livemode,
    this.type,
  });

  StripeResponse.fromJson(dynamic json) {
    id = json['id'];
    object = json['object'];
    billingDetails = json['billing_details'] != null
        ? BillingDetails.fromJson(json['billing_details'])
        : null;
    card = json['card'] != null ? Card.fromJson(json['card']) : null;
    created = json['created'];
    customer = json['customer'];
    livemode = json['livemode'];
    type = json['type'];
  }
  String? id;
  String? object;
  BillingDetails? billingDetails;
  Card? card;
  int? created;
  String? customer;
  bool? livemode;
  String? type;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['object'] = object;
    if (billingDetails != null) {
      map['billing_details'] = billingDetails?.toJson();
    }
    if (card != null) {
      map['card'] = card?.toJson();
    }
    map['created'] = created;
    map['customer'] = customer;
    map['livemode'] = livemode;
    map['type'] = type;
    return map;
  }
}

/// address : {"city":null,"country":null,"line1":null,"line2":null,"postal_code":null,"state":null}
/// email : null
/// name : null
/// phone : null
class BillingDetails {
  BillingDetails({
    this.address,
    this.email,
    this.name,
    this.phone,
  });

  BillingDetails.fromJson(dynamic json) {
    address =
        json['address'] != null ? Address.fromJson(json['address']) : null;
    email = json['email'];
    name = json['name'];
    phone = json['phone'];
  }
  Address? address;
  dynamic email;
  dynamic name;
  dynamic phone;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (address != null) {
      map['address'] = address?.toJson();
    }
    map['email'] = email;
    map['name'] = name;
    map['phone'] = phone;
    return map;
  }
}

/// city : null
/// country : null
/// line1 : null
/// line2 : null
/// postal_code : null
/// state : null
class Address {
  Address({
    this.city,
    this.country,
    this.line1,
    this.line2,
    this.postalCode,
    this.state,
  });

  Address.fromJson(dynamic json) {
    city = json['city'];
    country = json['country'];
    line1 = json['line1'];
    line2 = json['line2'];
    postalCode = json['postal_code'];
    state = json['state'];
  }
  dynamic city;
  dynamic country;
  dynamic line1;
  dynamic line2;
  dynamic postalCode;
  dynamic state;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['city'] = city;
    map['country'] = country;
    map['line1'] = line1;
    map['line2'] = line2;
    map['postal_code'] = postalCode;
    map['state'] = state;
    return map;
  }
}

/// brand : "visa"
/// checks : {"address_line1_check":null,"address_postal_code_check":null,"cvc_check":null}
/// country : "US"
/// exp_month : 12
/// exp_year : 2030
/// funding : "credit"
/// generated_from : null
/// last4 : "4242"
/// networks : {"available":["visa"],"preferred":null}
/// three_d_secure_usage : {"supported":true}
/// wallet : null

class Card {
  Card({
    this.brand,
    this.checks,
    this.country,
    this.expMonth,
    this.expYear,
    this.funding,
    this.generatedFrom,
    this.last4,
    this.networks,
    this.threeDSecureUsage,
    this.wallet,
  });

  Card.fromJson(dynamic json) {
    brand = json['brand'];
    checks = json['checks'] != null ? Checks.fromJson(json['checks']) : null;
    country = json['country'];
    expMonth = json['exp_month'];
    expYear = json['exp_year'];
    funding = json['funding'];
    generatedFrom = json['generated_from'];
    last4 = json['last4'];
    networks =
        json['networks'] != null ? Network.fromJson(json['networks']) : null;
    threeDSecureUsage = json['three_d_secure_usage'] != null
        ? ThreeDSecureUsage.fromJson(json['three_d_secure_usage'])
        : null;
    wallet = json['wallet'];
  }
  String? brand;
  Checks? checks;
  String? country;
  int? expMonth;
  int? expYear;
  String? funding;
  dynamic generatedFrom;
  String? last4;
  Network? networks;
  ThreeDSecureUsage? threeDSecureUsage;
  dynamic wallet;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['brand'] = brand;
    if (checks != null) {
      map['checks'] = checks?.toJson();
    }
    map['country'] = country;
    map['exp_month'] = expMonth;
    map['exp_year'] = expYear;
    map['funding'] = funding;
    map['generated_from'] = generatedFrom;
    map['last4'] = last4;
    if (networks != null) {
      map['networks'] = networks?.toJson();
    }
    if (threeDSecureUsage != null) {
      map['three_d_secure_usage'] = threeDSecureUsage?.toJson();
    }
    map['wallet'] = wallet;
    return map;
  }
}

/// address_line1_check : null
/// address_postal_code_check : null
/// cvc_check : null

class Checks {
  Checks({
    this.addressLine1Check,
    this.addressPostalCodeCheck,
    this.cvcCheck,
  });

  Checks.fromJson(dynamic json) {
    addressLine1Check = json['address_line1_check'];
    addressPostalCodeCheck = json['address_postal_code_check'];
    cvcCheck = json['cvc_check'];
  }
  dynamic addressLine1Check;
  dynamic addressPostalCodeCheck;
  dynamic cvcCheck;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['address_line1_check'] = addressLine1Check;
    map['address_postal_code_check'] = addressPostalCodeCheck;
    map['cvc_check'] = cvcCheck;
    return map;
  }
}

/// available : ["visa"]
/// preferred : null
class Network {
  Network({
    this.available,
    this.preferred,
  });

  Network.fromJson(dynamic json) {
    available =
        json['available'] != null ? json['available'].cast<String>() : [];
    preferred = json['preferred'];
  }
  List<String>? available;
  dynamic preferred;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['available'] = available;
    map['preferred'] = preferred;
    return map;
  }
}

/// supported : true
class ThreeDSecureUsage {
  ThreeDSecureUsage({
    this.supported,
  });

  ThreeDSecureUsage.fromJson(dynamic json) {
    supported = json['supported'];
  }
  bool? supported;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['supported'] = supported;
    return map;
  }
}
