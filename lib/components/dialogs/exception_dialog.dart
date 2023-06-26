import 'dart:ui';

import 'package:alleventstask/config/router/nav_service.dart';
import 'package:alleventstask/utils/constants/container_util.dart';
import 'package:alleventstask/utils/constants/k_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ErrorExceptionDialog implements Exception {
  final String errorCause;
  ErrorExceptionDialog(this.errorCause);

  //error dialogs
  static Future<dynamic> errorDialog(BuildContext context, e) {
    return showCupertinoDialog(
      context: (context),
      barrierDismissible: true,
      builder: (BuildContext context) {
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
          child: AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: witRadiusStan,
            ),
            title: const Text('Exception'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: witRadiusStan,
                  ),
                  child: Center(
                    child: Text(e.errorCause.toString()),
                  ),
                ),
                SizedBox(
                  child: Row(
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigate.instance.pushBack();
                        },
                        child: const Text(
                          'Okay',
                          style: Kstyles.kSmallTextStyle,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
