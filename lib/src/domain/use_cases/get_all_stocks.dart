import 'package:dartz/dartz.dart';
import 'package:stocks_stream/src/core/errors/failure.dart';
import 'package:stocks_stream/src/domain/entities/stock.dart';
import 'package:stocks_stream/src/domain/repositories/stock_repository.dart';

class GetAllStocks {
  final StockRepository repository;
  GetAllStocks(this.repository);

  Future<Either<Failure, List<Stock>>> call() async {
    return await repository.getAllStocks();
  }
}
