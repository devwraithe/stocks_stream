import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:get/get_navigation/get_navigation.dart';
import 'src/config/colors.dart';
import 'src/presentation/views/home.dart';
import "src/config/routes.dart" as routes;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(
    const ProviderScope(
      child: StockStream(),
    ),
  );
}

class StockStream extends StatelessWidget {
  const StockStream({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stocks Stream',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "Gilroy",
        visualDensity: VisualDensity.standard,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            primary: SSColors.black,
            elevation: 0,
            minimumSize: const Size(
              double.infinity,
              76,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                24,
              ),
            ),
          ),
        ),
        textTheme: const TextTheme(
          headline1: TextStyle(
            fontSize: 51.96,
            fontWeight: FontWeight.w900,
            color: SSColors.black,
            height: 1.4,
          ),
          headline2: TextStyle(
            fontSize: 46.18,
            color: SSColors.black,
            fontWeight: FontWeight.w800,
            height: 1.4,
          ),
          headline3: TextStyle(
            fontSize: 32.44,
            fontWeight: FontWeight.w700,
            color: SSColors.black,
            height: 1.4,
          ),
          headline4: TextStyle(
            fontSize: 28.83,
            fontWeight: FontWeight.w600,
            color: SSColors.black,
            height: 1.4,
          ),
          headline5: TextStyle(
            fontSize: 25.63,
            fontWeight: FontWeight.w600,
            color: SSColors.black,
            height: 1.4,
          ),
          headline6: TextStyle(
            fontSize: 22.78,
            fontWeight: FontWeight.w500,
            color: SSColors.black,
            height: 1.4,
          ),
          subtitle1: TextStyle(
            fontSize: 20.25,
            fontWeight: FontWeight.w700,
            color: SSColors.black,
          ),
          subtitle2: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: SSColors.black,
          ),
          bodyText1: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: SSColors.black,
          ),
          bodyText2: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: SSColors.black,
          ),
        ),
      ),
      home: const Home(),
      onGenerateRoute: routes.controller,
      initialRoute: routes.home,
    );
  }
}
