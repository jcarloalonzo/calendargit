class LiquidationAmount {
  LiquidationAmount(
      {this.amount,
      this.entryAmount,
      this.expenseAmount,
      this.amountCash,
      this.amountTC,
      this.amountZelle});
  factory LiquidationAmount.fromJson(Map<String, dynamic> json) =>
      LiquidationAmount(
        amount: json['Amount'],
        entryAmount: json['EntryAmount'],
        expenseAmount: json['ExpenseAmount'],
        amountCash: json['amountCash'],
        amountTC: json['amountTC'],
        amountZelle: json['amountZelle'],
      );

  num? amount;
  num? entryAmount;
  num? expenseAmount;
  num? amountCash;
  num? amountTC;
  num? amountZelle;

  Map<String, dynamic> toJson() => {
        'Amount': amount,
        'EntryAmount': entryAmount,
        'ExpenseAmount': expenseAmount,
        'amountCash': amountCash,
        'amountTC': amountTC,
        'amountZelle': amountZelle,
      };
}

class LiquidationDetails {
  LiquidationDetails({
    this.invoice,
    this.typePayment,
    this.payment,
    this.amount,
    this.state,
    this.currencyId,
  });
  factory LiquidationDetails.fromJson(Map<String, dynamic> json) =>
      LiquidationDetails(
        invoice: json['invoice'],
        typePayment: json['typePayment'],
        payment: json['payment'],
        amount: json['amount'],
        state: json['state'],
        currencyId: json['currencyID'],
      );

  String? invoice;
  int? typePayment;
  String? payment;
  num? amount;
  int? state;
  int? currencyId;

  Map<String, dynamic> toJson() => {
        'invoice': invoice,
        'typePayment': typePayment,
        'payment': payment,
        'amount': amount,
        'state': state,
        'currencyID': currencyId,
      };
}
