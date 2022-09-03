import 'dart:developer';
import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stocks_stream/src/data/data_sources/local_data_source_impl.dart';
import 'package:stocks_stream/src/data/repositories/stock_repository_impl.dart';
import 'package:stocks_stream/src/domain/entities/stock.dart';
import 'package:stocks_stream/src/domain/use_cases/get_all_stocks.dart';
import 'package:http/http.dart' as http;

class StocksProvider extends StateNotifier<List<Stock>> {
  final GetAllStocks getStocksUseCase;
  StocksProvider(this.getStocksUseCase) : super([]) {
    _getStocks();
  }

  late final List<Stock> _stocksList;

  Future<void> _getStocks() async {
    final result = await getStocksUseCase.call();
    result.fold(
      (failure) {
        log("Data fetching failed! >>> $failure");
      },
      (data) {
        log("Data fetching success!");
        _stocksList = data;
        state = _stocksList;
      },
    );
  }
}