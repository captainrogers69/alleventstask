import 'dart:math';

import 'package:alleventstask/components/sizing_box.dart';
import 'package:alleventstask/utils/constants/k_colors.dart';
import 'package:alleventstask/utils/constants/k_styles.dart';
import 'package:alleventstask/utils/wrappers/responsive_util.dart';
import 'package:flutter/material.dart';

class KTextButton extends StatelessWidget {
  final void Function() onTap;
  final String buttonName;
  final bool selected;
  final IconData icon;
  const KTextButton({
    required this.buttonName,
    required this.selected,
    required this.onTap,
    required this.icon,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Visibility(
            visible: icon == Icons.switch_left_sharp,
            replacement: Icon(
              icon,
              color: selected ? KColors.primaryColor : KColors().greyColor,
              size: Responsive.getSize(17),
            ),
            child: Transform.rotate(
              angle: -pi / 2,
              child: Icon(
                icon,
                color: selected ? KColors.primaryColor : KColors().greyColor,
                size: Responsive.getSize(17),
              ),
            ),
          ),
          const Sbw(w: 5),
          Text(
            buttonName,
            style: Kstyles.kSmallTextStyle.copyWith(
              fontSize: Responsive.getFontSize(13),
              color: selected ? KColors.primaryColor : KColors().greyColor,
            ),
          ),
        ],
      ),
    );
  }
}
