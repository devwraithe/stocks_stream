import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:stocks_stream/src/config/config.dart';
import 'package:stocks_stream/src/data/models/stock_model.dart';
import 'package:http/http.dart' as http;

class StocksService {
  final baseURL = AppConstantData.apiURL;

  Future<List<StockModel>> getStocksList() async {
    try {
      final String response =
          await rootBundle.loadString("assets/json/stocks.json");
      final responseData = await json.decode(response);
      final List? results = responseData["data"];
      print(results);
      if (results == null) return [];
      return results
          .map<StockModel>(
            (stockJson) => StockModel.fromJson(stockJson),
          )
          .toList();

      // http.Response response = await http.get(
      //   Uri.parse('$baseURL/stock/symbol?exchange=US'),
      //   headers: {
      //     'Content-Type': 'application/json; charset=UTF-8',
      //     'Accept': 'application/json',
      //     'X-Finnhub-Token': AppConstantData.apiKey,
      //   },
      // );

      // final responseData = jsonDecode(response.body);
      // if (response.statusCode == 200) {
      //   final List? results = responseData;
      //   print(results);
      //   if (results == null) return [];
      //   return results.map((e) => StockModel.fromJson(e)).toList();
      // } else {
      //   return [];
      // }
    } catch (err) {
      print(err);
      rethrow;
    }
  }
}
