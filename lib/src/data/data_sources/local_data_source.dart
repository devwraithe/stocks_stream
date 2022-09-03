import 'package:stocks_stream/src/data/models/stock_model.dart';

abstract class LocalDataSource {
  Future<List<StockModel>> getAllStocks();
}
