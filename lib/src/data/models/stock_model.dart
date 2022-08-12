class StockModel {
  String? symbol;
  String? symbolColor;
  String? company;
  String? currency;
  double? price;
  double? change;
  String? changeSymbol;
  bool? status;

  StockModel({
    this.symbol,
    this.symbolColor,
    this.company,
    this.currency,
    this.price,
    this.change,
    this.status,
  });

  factory StockModel.fromJson(Map<String, dynamic> json) => StockModel(
        symbol: json["symbol"],
        symbolColor: json["symbolColor"],
        company: json["company"],
        currency: json["currency"],
        price: json["price"],
        change: json["change"],
        status: json["status"],
      );
}
