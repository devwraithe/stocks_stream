import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stocks_stream/src/config/colors.dart';
import 'package:stocks_stream/src/presentation/widgets/chart_time_interval.dart';
import 'package:stocks_stream/src/presentation/widgets/custom_icon.dart';
import 'package:stocks_stream/src/presentation/widgets/main_chart_data.dart';
import 'package:stocks_stream/src/presentation/widgets/page_title.dart';

class StockDetails extends StatefulWidget {
  const StockDetails({Key? key}) : super(key: key);
  @override
  State<StockDetails> createState() => _StockDetailsState();
}

class _StockDetailsState extends State<StockDetails> {
  @override
  void initState() {
    super.initState();
  }

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
                padding: const EdgeInsets.symmetric(
                  horizontal: 22,
                  vertical: 24,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () => Get.back(),
                      child: const CustomIcon(
                        icon: "assets/icons/left-arrow.svg",
                      ),
                    ),
                    const PageTitle(
                      title: "GOOGL",
                      subtitle: "Alphabet Inc.",
                    ),
                    const CustomIcon(
                      icon: "assets/icons/more-horiz.svg",
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
                "10.08%",
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
                  mainChartData(),
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
                  children: const [
                    ChartTimeInterval(
                      textColor: SSColors.black,
                      bgColor: SSColors.gray,
                      label: "D",
                      weight: FontWeight.w800,
                    ),
                    ChartTimeInterval(
                      label: "W",
                    ),
                    ChartTimeInterval(
                      label: "M",
                    ),
                    ChartTimeInterval(
                      label: "Y",
                    ),
                    ChartTimeInterval(
                      label: "All",
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
}
