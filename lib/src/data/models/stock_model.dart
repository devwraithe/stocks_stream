import 'package:equatable/equatable.dart';
import 'package:stocks_stream/src/domain/entities/stock.dart';

class StockModel extends Equatable {
  final String? id;
  final String? name;
  final String? shortName;
  final String? country;
  final String? sector;
  final String? exch;
  final String? ccy;
  final double? price;
  final String? symbolColor;
  final double? change;
  final bool? status;

  const StockModel({
    this.id,
    this.name,
    this.shortName,
    this.country,
    this.sector,
    this.exch,
    this.ccy,
    this.price,
    this.symbolColor,
    this.change,
    this.status,
  });

  factory StockModel.fromJson(Map<String, dynamic> json) => StockModel(
        id: json["id"],
        name: json["name"],
        shortName: json["short_name"],
        country: json["country"],
        sector: json["sector"],
        exch: json["exch"],
        ccy: json["ccy"],
        price: json["price"],
        symbolColor: json["symbol_color"],
        change: json["change"],
        status: json["status"],
      );

  Stock toEntity() => Stock(
        id: id!,
        name: name,
        shortName: shortName,
        country: country,
        sector: sector,
        exch: exch,
        ccy: ccy,
        price: price,
        symbolColor: symbolColor,
        change: change,
        status: status,
      );

  @override
  List<Object?> get props => [
        id,
        name,
        shortName,
        country,
        sector,
        exch,
        ccy,
        price,
        symbolColor,
        change,
        status,
      ];
}
