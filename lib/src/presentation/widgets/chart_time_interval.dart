import 'package:flutter/material.dart';
import 'package:stocks_stream/src/config/colors.dart';

class ChartTimeInterval extends StatelessWidget {
  final Color? bgColor, textColor;
  final String? label;
  final FontWeight? weight;

  const ChartTimeInterval({
    Key? key,
    this.bgColor,
    this.textColor,
    this.label,
    this.weight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // setState(() {
        //   _currentIndex = 0;
        // });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        decoration: BoxDecoration(
          color: bgColor ?? Colors.transparent,
          // color: _currentIndex == 0 ?? SSColors.red : SSColors.green.withOpacity(0),
          borderRadius: BorderRadius.circular(14),
        ),
        child: Padding(
          padding: const EdgeInsets.only(
            top: 3,
            left: 2,
          ),
          child: Text(
            label ?? "D",
            style: Theme.of(context).textTheme.bodyText1?.copyWith(
                  color: textColor ?? SSColors.darkGray,
                  // color: _currentIndex == 0 ?? SSColors.red : SSColors.green.withOpacity(0),
                  fontWeight: weight ?? FontWeight.w500,
                  letterSpacing: 0.4,
                ),
          ),
        ),
      ),
    );
  }
}
