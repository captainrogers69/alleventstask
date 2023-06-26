import 'package:alleventstask/config/router/nav_service.dart';
import 'package:alleventstask/utils/constants/k_styles.dart';
import 'package:alleventstask/utils/wrappers/responsive_util.dart';
import 'package:flutter/material.dart';

class HeadingText extends StatelessWidget {
  final Widget? actionCompo;
  final String heading;
  final double left;
  const HeadingText({
    required this.heading,
    this.actionCompo,
    this.left = 0,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: left),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            heading,
            style: Kstyles.kMediumTextStyle.copyWith(
              fontSize: Responsive.getFontSize(19),
              fontWeight: FontWeight.w700,
            ),
          ),
          actionCompo ??
              IconButton(
                onPressed: () {
                  Navigate.instance.pushBack();
                },
                icon: const Icon(
                  Icons.close,
                ),
              ),
        ],
      ),
    );
  }
}
