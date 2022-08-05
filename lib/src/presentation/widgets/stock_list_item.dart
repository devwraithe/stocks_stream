import 'package:flutter/material.dart';
import 'package:stocks_stream/src/config/colors.dart';

class StockListItem extends StatelessWidget {
  final String image;
  final String? shortName;
  final String? name;
  final String? price;
  final String? change;
  final Function()? action;

  const StockListItem({
    Key? key,
    required this.image,
    this.shortName,
    this.name,
    this.price,
    this.change,
    this.action,
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
              Container(
                decoration: BoxDecoration(
                  color: SSColors.gray,
                  borderRadius: BorderRadius.circular(100),
                ),
                padding: const EdgeInsets.all(14),
                child: Image.network(
                  image,
                  width: 22,
                  height: 22,
                  fit: BoxFit.cover,
                  filterQuality: FilterQuality.high,
                ),
              ),
              const SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 4),
                  Text(
                    shortName ?? "",
                    style: Theme.of(context).textTheme.subtitle2?.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    name ?? "",
                    style: Theme.of(context).textTheme.bodyText1?.copyWith(
                          color: SSColors.darkGray,
                          fontWeight: FontWeight.w600,
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
              const SizedBox(height: 2),
              Text(
                "$change",
                style: Theme.of(context).textTheme.bodyText1?.copyWith(
                      color: SSColors.green,
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
