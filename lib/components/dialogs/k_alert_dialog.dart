import 'package:alleventstask/components/buttons/k_border_button.dart';
import 'package:alleventstask/components/buttons/k_button.dart';
import 'package:alleventstask/components/sizing_box.dart';
import 'package:alleventstask/config/router/nav_service.dart';
import 'package:alleventstask/utils/constants/container_util.dart';
import 'package:alleventstask/utils/constants/k_assets.dart';
import 'package:alleventstask/utils/constants/k_colors.dart';
import 'package:alleventstask/utils/constants/k_styles.dart';
import 'package:alleventstask/utils/wrappers/responsive_util.dart';
import 'package:flutter/material.dart';

class WIT {
  final Navigate _nav = Navigate.instance;
  Future<void> quickDialogue(
      {Color dialogueThemeColor = KColors.primaryColor,
      String asset = KAssets.greenchecked,
      required void Function() callBack,
      String discardTitle = 'Cancel',
      String submitTitle = 'Okay',
      required String subtitle,
      bool onlyShow = false,
      required String title}) async {
    await showDialog(
      // animationType: AnimationType.none,
      context: _nav.navigationKey.currentState!.overlay!.context,
      builder: (context) {
        return AlertDialog(
          shape: standardMidShape,
          title: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Image.asset(
                  asset,
                  // color: dialogueThemeColor,
                  scale: 8,
                ),
              ),
            ],
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: Kstyles.kAppBarTextStyle.copyWith(
                      fontSize: Responsive.getFontSize(16),
                    ),
                  ),
                ],
              ),
              const Sbh(h: 10),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                width: Responsive.width(context) * .65,
                child: Text(
                  subtitle,
                  overflow: TextOverflow.clip,
                  textAlign: TextAlign.center,
                  style: Kstyles.kAppBarTextStyle.copyWith(
                    fontSize: Responsive.getFontSize(13),
                    color: KColors().greyColor,
                  ),
                ),
              ),
              const Sbh(h: 12),
              Visibility(
                visible: !onlyShow,
                replacement: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    KButton(
                      hardColor: dialogueThemeColor,
                      useMidRoundCorner: true,
                      buttonName: submitTitle,
                      width: Responsive.width(context) * .27,
                      height: 35,
                      onTap: () {
                        _nav.pushBack();
                      },
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    KBorderButton(
                      useMidRoundCorner: true,
                      onTap: () {
                        _nav.pushBack();
                      },
                      height: 35,
                      hardColor: dialogueThemeColor,
                      buttonName: discardTitle,
                      width: Responsive.width(context) * .27,
                    ),
                    KButton(
                      useMidRoundCorner: true,
                      buttonName: submitTitle,
                      height: 35,
                      hardColor: dialogueThemeColor,
                      width: Responsive.width(context) * .27,
                      onTap: callBack,
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
