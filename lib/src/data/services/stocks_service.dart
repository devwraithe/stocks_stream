import 'dart:convert';
import 'package:flutter/services.dart';
import '../../../src/data/models/stock_model.dart';

class StocksService {
  Future<List<StockModel>> getStocksList() async {
    try {
      final String response =
          await rootBundle.loadString("assets/json/stocks.json");
      final responseData = await json.decode(response);
      final List? results = responseData["data"];
      if (results == null) return [];
      return results
          .map<StockModel>(
            (stockJson) => StockModel.fromJson(stockJson),
          )
          .toList();
    } catch (err) {
      rethrow;
    }
  }
}
