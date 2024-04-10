class StripeBillingDetailsRequestModel {
  StripeBillingDetailsAddressRequestModel? address;
  String? email;
  String? name;
  String? phone;

  StripeBillingDetailsRequestModel({
    this.address,
    this.email,
    this.name,
    this.phone,
  });
}

class StripeBillingDetailsAddressRequestModel {
  String? country;
  String? postalCode;
  String? state;
  String? city;
  String? address1;
  String? address2;
  StripeBillingDetailsAddressRequestModel({
    this.country,
    this.postalCode,
    this.state,
    this.city,
    this.address1,
    this.address2,
  });
}
