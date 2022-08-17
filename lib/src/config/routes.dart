import 'package:flutter/material.dart';
import 'package:stocks_stream/src/presentation/views/details.dart';
import 'package:stocks_stream/src/presentation/views/home.dart';

const String home = 'home';
const String stockDetails = 'stockDetails';

Route<dynamic> controller(RouteSettings settings) {
  switch (settings.name) {
    case home:
      return MaterialPageRoute(
        builder: (context) => const Home(),
      );
    case stockDetails:
      return MaterialPageRoute(
        builder: (context) => const StockDetails(),
      );
    default:
      throw ('the specified route is unavailable!');
  }
}
