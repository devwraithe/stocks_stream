import 'package:flutter/material.dart';
import 'package:stocks_stream/src/config/colors.dart';

class PageTitle extends StatelessWidget {
  final String? title;
  final String? subtitle;
  const PageTitle({
    Key? key,
    this.title,
    this.subtitle,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 6),
        Text(
          title ?? "",
          style: Theme.of(context).textTheme.subtitle2?.copyWith(
                fontWeight: FontWeight.w800,
                letterSpacing: 0.3,
              ),
        ),
        const SizedBox(height: 2),
        Text(
          subtitle ?? "",
          style: Theme.of(context).textTheme.bodyText1?.copyWith(
                color: SSColors.darkGray,
                fontWeight: FontWeight.w700,
                letterSpacing: 0.3,
              ),
        ),
      ],
    );
  }
}
