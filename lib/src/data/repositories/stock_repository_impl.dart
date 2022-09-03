import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:stocks_stream/src/core/errors/exception.dart';
import 'package:stocks_stream/src/core/errors/failure.dart';
import 'package:stocks_stream/src/data/data_sources/local_data_source.dart';
import 'package:stocks_stream/src/domain/entities/stock.dart';
import 'package:stocks_stream/src/domain/repositories/stock_repository.dart';

class StockRepositoryImpl implements StockRepository {
  final LocalDataSource localDataSource;
  StockRepositoryImpl(this.localDataSource);

  @override
  Future<Either<Failure, List<Stock>>> getAllStocks() async {
    try {
      final result = await localDataSource.getAllStocks();
      return Right(result.map((stock) => stock.toEntity()).toList());
    } on ServerException {
      return const Left(ServerFailure("message"));
    } on SocketOption {
      return const Left(ConnectionFailure("Failed to connect to the network"));
    }
  }
}
