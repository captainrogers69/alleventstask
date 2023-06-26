import 'dart:math';
import 'package:alleventstask/config/packages/toast/flushbar.dart';
import 'package:alleventstask/config/router/nav_service.dart';
import 'package:alleventstask/utils/constants/k_colors.dart';
import 'package:alleventstask/utils/constants/k_styles.dart';
import 'package:flutter/material.dart';

enum ToastStyle { error, info }

void kToast(
    {required String message,
    ToastStyle style = ToastStyle.info,
    bool useFlushbar = true,
    String? title}) async {
  await Flushbar(
    // margin: const EdgeInsets.symmetric(horizontal: 5),
    borderRadius: const BorderRadius.only(
      topRight: Radius.circular(11),
      topLeft: Radius.circular(11),
    ),
    mainButton: TextButton(
      onPressed: () async {
        // await opp.dismiss();
        // await Flushbar().dismiss(true);
      },
      child: Text(
        "Dismiss",
        style: Kstyles.kSmallTextStyle.copyWith(
          color: Colors.yellow,
        ),
      ),
    ),
    icon: Opacity(
      opacity: 0.5,
      child: Transform.rotate(
        angle: 32 * pi / 180,
        child: Icon(
          style == ToastStyle.error ? Icons.error : Icons.info,
          color: KColors.whiteColor,
          size: 35,
        ),
      ),
    ),
    backgroundColor:
        style == ToastStyle.error ? KColors.errorColor : KColors.primaryColor,
    flushbarStyle: FlushbarStyle.FLOATING,
    titleText: Text(
      title == null && style == ToastStyle.error
          ? 'Error'
          : title == null && style == ToastStyle.info
              ? 'Success'
              : title!,
      style: Kstyles.kSmallTextStyle.copyWith(
        color: KColors.whiteColor,
      ),
    ),
    messageText: Text(
      message,
      style: Kstyles.kVerySmallTextStyle.copyWith(
        color: KColors.whiteColor,
      ),
    ),
    duration: const Duration(seconds: 1),
  ).show(Navigate.instance.navigationKey.currentState!.context);
}
