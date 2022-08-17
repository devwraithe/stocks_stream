import 'package:flutter/material.dart';
import 'package:stocks_stream/src/config/colors.dart';

class StockListItem extends StatelessWidget {
  final String image;
  final String? symbol;
  final String? company;
  final int? symbolColor;
  final String? price;
  final String? change;
  final Function()? action;
  final Color? changeColor;

  const StockListItem({
    Key? key,
    required this.image,
    this.symbol,
    this.company,
    this.symbolColor,
    this.price,
    this.change,
    this.action,
    this.changeColor,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: action,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 4),
                  Container(
                    decoration: BoxDecoration(
                      color: Color(symbolColor ?? 0XFFF5F5F5),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    padding: const EdgeInsets.fromLTRB(10, 8.5, 10, 4.5),
                    child: Text(
                      symbol ?? "",
                      style: Theme.of(context).textTheme.bodyText1?.copyWith(
                            fontWeight: FontWeight.w700,
                            letterSpacing: 0.6,
                            color: SSColors.white,
                          ),
                    ),
                  ),
                  const SizedBox(height: 11),
                  Text(
                    company ?? "",
                    style: Theme.of(context).textTheme.bodyText1?.copyWith(
                          color: SSColors.darkGray,
                          fontWeight: FontWeight.w700,
                        ),
                  ),
                ],
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                price ?? "",
                style: Theme.of(context).textTheme.subtitle2?.copyWith(
                      color: SSColors.black,
                      fontWeight: FontWeight.w700,
                    ),
              ),
              const SizedBox(height: 3),
              Text(
                "$change",
                style: Theme.of(context).textTheme.subtitle2?.copyWith(
                      color: changeColor ?? SSColors.green,
                      fontWeight: FontWeight.w700,
                    ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
