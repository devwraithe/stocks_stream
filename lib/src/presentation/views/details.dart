import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stocks_stream/src/config/colors.dart';
import 'package:stocks_stream/src/presentation/widgets/customIcon.dart';
import 'package:stocks_stream/src/presentation/widgets/page_title.dart';
import 'package:stocks_stream/src/presentation/widgets/stock_list_item.dart';

class Details extends StatefulWidget {
  const Details({Key? key}) : super(key: key);
  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: SSColors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 22, vertical: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    CustomIcon(
                      icon: "assets/icons/left-arrow.svg",
                    ),
                    PageTitle(
                      title: "GOOGL",
                      subtitle: "Alphabet Inc.",
                    ),
                    CustomIcon(
                      icon: "assets/icons/left-arrow.svg",
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 68),
              Center(
                child: Image.network(
                  "https://upload.wikimedia.org/wikipedia/commons/thumb/5/53/Google_%22G%22_Logo.svg/150px-Google_%22G%22_Logo.svg.png",
                  width: 64,
                  height: 64,
                ),
              ),
              const SizedBox(height: 68),
              Text(
                "\$3,000.00",
                style: Theme.of(context).textTheme.headline3?.copyWith(
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.8,
                    ),
              ),
              const SizedBox(height: 8),
              Text(
                "-10.08%",
                style: Theme.of(context).textTheme.subtitle2?.copyWith(
                      color: SSColors.red,
                      fontWeight: FontWeight.w800,
                      letterSpacing: 0.4,
                    ),
              ),
              const SizedBox(height: 18),
              // FadeInUp(
              //   child:
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.3,
                child: LineChart(
                  mainData(),
                  swapAnimationDuration: const Duration(milliseconds: 1000),
                  swapAnimationCurve: Curves.easeInCubic,
                ),
              ),
              // ),
              AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                // height: MediaQuery.of(context).size.height * 0.3,
                padding:
                    const EdgeInsets.symmetric(horizontal: 18, vertical: 38),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () {
                        // setState(() {
                        //   _currentIndex = 0;
                        // });
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 15),
                        decoration: BoxDecoration(
                          color: SSColors.gray,
                          // color: _currentIndex == 0 ?? SSColors.red : SSColors.green.withOpacity(0),
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                            top: 3,
                            left: 2,
                          ),
                          child: Text(
                            "D",
                            style:
                                Theme.of(context).textTheme.bodyText1?.copyWith(
                                      color: SSColors.black,
                                      // color: _currentIndex == 0 ?? SSColors.red : SSColors.green.withOpacity(0),
                                      fontWeight: FontWeight.w800,
                                      letterSpacing: 0.4,
                                    ),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        // setState(() {
                        //   _currentIndex = 1;
                        // });
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 15),
                        decoration: BoxDecoration(
                          // color: SSColors.red,
                          // color: _currentIndex == 1 ?? SSColors.red : SSColors.green.withOpacity(0),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                            top: 3,
                            left: 2,
                          ),
                          child: Text(
                            "W",
                            style:
                                Theme.of(context).textTheme.bodyText1?.copyWith(
                                      color: SSColors.darkGray,
                                      // color: _currentIndex == 1 ?? SSColors.red : SSColors.green.withOpacity(0),
                                      fontWeight: FontWeight.w600,
                                      letterSpacing: 0.4,
                                    ),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        // setState(() {
                        //   _currentIndex = 1;
                        // });
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 15),
                        decoration: BoxDecoration(
                          // color: SSColors.red,
                          // color: _currentIndex == 1 ?? SSColors.red : SSColors.green.withOpacity(0),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                            top: 3,
                            left: 2,
                          ),
                          child: Text(
                            "M",
                            style:
                                Theme.of(context).textTheme.bodyText1?.copyWith(
                                      color: SSColors.darkGray,
                                      // color: _currentIndex == 1 ?? SSColors.red : SSColors.green.withOpacity(0),
                                      fontWeight: FontWeight.w600,
                                      letterSpacing: 0.4,
                                    ),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        // setState(() {
                        //   _currentIndex = 1;
                        // });
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 15),
                        decoration: BoxDecoration(
                          // color: SSColors.red,
                          // color: _currentIndex == 1 ?? SSColors.red : SSColors.green.withOpacity(0),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                            top: 3,
                            left: 2,
                          ),
                          child: Text(
                            "Y",
                            style:
                                Theme.of(context).textTheme.bodyText1?.copyWith(
                                      color: SSColors.darkGray,
                                      // color: _currentIndex == 1 ?? SSColors.red : SSColors.green.withOpacity(0),
                                      fontWeight: FontWeight.w600,
                                      letterSpacing: 0.4,
                                    ),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        // setState(() {
                        //   _currentIndex = 1;
                        // });
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 15),
                        decoration: BoxDecoration(
                          // color: SSColors.red,
                          // color: _currentIndex == 1 ?? SSColors.red : SSColors.green.withOpacity(0),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                            top: 3,
                            left: 2,
                          ),
                          child: Text(
                            "All",
                            style:
                                Theme.of(context).textTheme.bodyText1?.copyWith(
                                      color: SSColors.darkGray,
                                      // color: _currentIndex == 1 ?? SSColors.red : SSColors.green.withOpacity(0),
                                      fontWeight: FontWeight.w600,
                                      letterSpacing: 0.4,
                                    ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 22,
                  right: 22,
                  bottom: 28,
                  top: 8,
                ),
                child: ElevatedButton(
                  onPressed: () {},
                  child: Padding(
                    padding: const EdgeInsets.only(top: 2),
                    child: Text(
                      "Buy Stock",
                      style: Theme.of(context).textTheme.subtitle2?.copyWith(
                            color: SSColors.white,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /* === date dropdown === */
  String? _setDateValue;
  List<DropdownMenuItem<String>> get setDate {
    List<DropdownMenuItem<String>> dateItems = [
      const DropdownMenuItem(child: Text("Today"), value: "Today"),
      const DropdownMenuItem(child: Text("This Week"), value: "This Week"),
      const DropdownMenuItem(child: Text("This Month"), value: "This Month"),
      const DropdownMenuItem(child: Text("This Year"), value: "This Year"),
    ];
    return dateItems;
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    Widget text;
    switch (value.toInt()) {
      case 0:
        text = Padding(
          padding: const EdgeInsets.only(top: 6),
          child: Text(
            "D",
            style: Theme.of(context).textTheme.bodyText1?.copyWith(
                  color: SSColors.darkGray,
                  fontWeight: FontWeight.w500,
                  fontFamily: "Gilroy",
                ),
          ),
        );
        break;
      case 1:
        text = Padding(
          padding: const EdgeInsets.only(top: 6),
          child: Text(
            "W",
            style: Theme.of(context).textTheme.bodyText1?.copyWith(
                  color: SSColors.darkGray,
                  fontWeight: FontWeight.w500,
                  fontFamily: "Gilroy",
                ),
          ),
        );
        break;
      case 2:
        text = Padding(
          padding: const EdgeInsets.only(top: 6),
          child: Text(
            "M",
            style: Theme.of(context).textTheme.bodyText1?.copyWith(
                  color: SSColors.darkGray,
                  fontWeight: FontWeight.w500,
                  fontFamily: "Gilroy",
                ),
          ),
        );
        break;
      case 3:
        text = Padding(
          padding: const EdgeInsets.only(top: 6),
          child: Text(
            "Y",
            style: Theme.of(context).textTheme.bodyText1?.copyWith(
                  color: SSColors.darkGray,
                  fontWeight: FontWeight.w500,
                  fontFamily: "Gilroy",
                ),
          ),
        );
        break;
      case 4:
        text = Padding(
          padding: const EdgeInsets.only(top: 6),
          child: Text(
            "All",
            style: Theme.of(context).textTheme.bodyText1?.copyWith(
                  color: SSColors.darkGray,
                  fontWeight: FontWeight.w500,
                  fontFamily: "Gilroy",
                ),
          ),
        );
        break;
      default:
        text = Text(
          "",
          style: Theme.of(context).textTheme.bodyText1?.copyWith(
                color: SSColors.darkGray,
                fontWeight: FontWeight.w500,
                fontFamily: "Gilroy",
              ),
        );
        break;
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 8.0,
      child: text,
    );
  }

  List<Color> gradientColors = [
    const Color(0xff23b6e6),
    const Color(0xff02d39a),
  ];

  // chart data
  LineChartData mainData() {
    return LineChartData(
      gridData: FlGridData(
        show: false,
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
          // sideTitles: SideTitles(
          //   showTitles: true,
          //   reservedSize: 30,
          //   interval: 1,
          //   getTitlesWidget: bottomTitleWidgets,
          // ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
          ),
        ),
      ),
      borderData: FlBorderData(
        show: false,
      ),
      minX: 0,
      maxX: 4,
      minY: 0,
      maxY: 200,
      lineTouchData: LineTouchData(
        getTouchedSpotIndicator:
            (LineChartBarData barData, List<int> spotIndexes) {
          return spotIndexes.map(
            (index) {
              return TouchedSpotIndicatorData(
                FlLine(
                  color: SSColors.black,
                  strokeWidth: 2,
                  dashArray: [3, 3],
                ),
                FlDotData(
                  show: false,
                ),
              );
            },
          ).toList();
        },
        touchTooltipData: LineTouchTooltipData(
            tooltipRoundedRadius: 10,
            tooltipBorder: const BorderSide(
              color: SSColors.black,
            ),
            tooltipPadding: const EdgeInsets.only(
              left: 18,
              right: 18,
              top: 10,
              bottom: 8,
            ),
            tooltipBgColor: SSColors.black,
            getTooltipItems: (touchedSpots) {
              return touchedSpots.map(
                (touchedSpot) {
                  return LineTooltipItem(
                    '\$${touchedSpot.y.round()}.00',
                    const TextStyle(
                      color: SSColors.white,
                      fontSize: 14,
                    ),
                  );
                },
              ).toList();
            }),
        enabled: true,
      ),
      lineBarsData: [
        LineChartBarData(
          spots: const [
            FlSpot(0, 6),
            FlSpot(2, 6),
            FlSpot(4, 6),
            FlSpot(6, 6),
            FlSpot(6, 6),
          ],
          isCurved: true,
          color: SSColors.black,
          barWidth: 3,
          isStrokeCapRound: false,
          dotData: FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            color: SSColors.white,
          ),
        ),
      ],
    );
  }
}
