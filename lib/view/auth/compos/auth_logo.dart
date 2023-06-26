import 'package:alleventstask/utils/constants/container_util.dart';
import 'package:alleventstask/utils/constants/k_colors.dart';
import 'package:alleventstask/utils/constants/k_styles.dart';
import 'package:flutter/material.dart';

class AuthLogo extends StatelessWidget {
  const AuthLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
            decoration: BoxDecoration(
              borderRadius: witRadiusStan,
              gradient: KColors.gradientPrimary,
            ),
            child: Text(
              "All Events Task",
              style: Kstyles.kHeadingTextStyle.copyWith(
                color: KColors.whiteColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
