import 'package:dartz/dartz.dart';
import 'package:stocks_stream/src/core/errors/failure.dart';
import 'package:stocks_stream/src/domain/entities/stock.dart';

abstract class StockRepository {
  Future<Either<Failure, List<Stock>>> getAllStocks();
}
