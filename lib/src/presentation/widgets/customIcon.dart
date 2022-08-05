import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stocks_stream/src/config/colors.dart';

class CustomIcon extends StatelessWidget {
  final String icon;
  final double? size;

  const CustomIcon({
    Key? key,
    required this.icon,
    this.size,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: SSColors.gray,
        borderRadius: BorderRadius.circular(14),
      ),
      padding: const EdgeInsets.all(12),
      child: SvgPicture.asset(
        icon,
        width: size ?? 24,
        height: size ?? 24,
      ),
    );
  }
}
