import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import '../../../src/config/colors.dart';

LineChartData mainChartData() {
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
