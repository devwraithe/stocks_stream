import 'package:equatable/equatable.dart';

class Stock extends Equatable {
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

  const Stock({
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
