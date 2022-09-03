import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:stocks_stream/src/core/errors/exception.dart';
import 'package:stocks_stream/src/core/errors/failure.dart';
import 'package:stocks_stream/src/data/data_sources/local_data_source.dart';
import 'package:http/http.dart' as http;
import 'package:stocks_stream/src/data/models/stock_model.dart';

class LocalDataSourceImpl implements LocalDataSource {
  final http.Client client;
  const LocalDataSourceImpl(this.client);

  @override
  Future<List<StockModel>> getAllStocks() async {
    try {
      final String response =
          await rootBundle.loadString("assets/json/stocks.json");
      final List responseData = await json.decode(response)["data"];
      List<StockModel> allStocks = [];
      if (allStocks == null) return [];
      allStocks = responseData
          .map<StockModel>(
            (stockJson) => StockModel.fromJson(stockJson),
          )
          .toList();
      return allStocks;
    } catch (err) {
      rethrow;
    }
  }
}
