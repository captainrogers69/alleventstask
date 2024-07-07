import 'package:alleventstask/components/k_fetching.dart';
import 'package:alleventstask/components/sizing_box.dart';
import 'package:alleventstask/utils/constants/container_util.dart';
import 'package:alleventstask/utils/constants/k_colors.dart';
import 'package:alleventstask/utils/constants/k_styles.dart';
import 'package:flutter/material.dart';

class AuthButton extends StatelessWidget {
  final void Function() onTap;
  final String buttonName;
  final IconData? icon;
  final bool fetching;
  const AuthButton({
    required this.buttonName,
    required this.fetching,
    required this.onTap,
    this.icon,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      splashColor: KColors().transparentColor,
      highlightColor: KColors().transparentColor,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 15),
        height: 55,
        decoration: BoxDecoration(
          borderRadius: witRadiusStan,
          // gradient: KColors.gradientPrimary,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon ?? Icons.lock_outlined,
              color: Colors.white,
            ),
            const SizedBox(
              width: 5,
            ),
            Text(
              buttonName,
              style: Kstyles.kMediumTextStyle.copyWith(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
            Visibility(
              visible: fetching,
              child: const Row(
                children: [
                  Sbw(w: 8),
                  WitTextFetching(
                    color: KColors.whiteColor,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
