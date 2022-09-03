import 'package:http/http.dart' as http;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/data_sources/local_data_source_impl.dart';
import '../../data/repositories/stock_repository_impl.dart';
import '../../domain/entities/stock.dart';
import '../../domain/use_cases/get_all_stocks.dart';
import '../../presentation/view_models/stocks_provider_vm.dart';



final stocksProvider = StateNotifierProvider<StocksProvider, List<Stock>>(
  (ref) {
    return StocksProvider(
      GetAllStocks(
        StockRepositoryImpl(
          LocalDataSourceImpl(
            http.Client(),
          ),
        ),
      ),
    );
  },
);
