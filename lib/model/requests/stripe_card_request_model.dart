class StripeCardRequestModel {
  final String number;
    final String expMonth;
    final String expYear;
    final String cvc;

  StripeCardRequestModel(this.number, this.expMonth, this.expYear, this.cvc);
}
