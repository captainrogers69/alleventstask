import 'package:alleventstask/utils/constants/container_util.dart';
import 'package:alleventstask/utils/wrappers/responsive_util.dart';
import 'package:alleventstask/utils/constants/k_colors.dart';
import 'package:flutter/material.dart';

class DragHandle extends StatelessWidget {
  final double? width, height;
  final Color? color;
  const DragHandle({
    this.height,
    this.color,
    this.width,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 5),
          decoration: BoxDecoration(
            borderRadius: witRadiusSmall,
            color: color ?? KColors.primaryColor,
          ),
          width: width ?? Responsive.width(context) * 0.17,
          height: height ?? 6,
        ),
      ],
    );
  }
}
