import 'package:alleventstask/utils/constants/k_colors.dart';
import 'package:alleventstask/utils/constants/k_styles.dart';
import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();
  static final lightTheme = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: KColors().lightGreyColor,
    // const Color(0xffeeefee),
    // primaryColor: primaryColor,
    cardColor: Colors.white,
    fontFamily: "Roboto",
    appBarTheme: AppBarTheme(
      // backgroundColor: primaryColor,
      titleTextStyle: Kstyles.kAppBarTextStyle.copyWith(
          // color: darkGreyColor,
          ),
      // color: whiteColor,
      iconTheme: const IconThemeData(
          // color: whiteColor,
          ),
    ),
    textTheme: const TextTheme(
      bodyMedium: TextStyle(
        color: Colors.black,
      ),
    ),
    buttonTheme: const ButtonThemeData(
        // buttonColor: whiteColor,
        ),
    // colorScheme: ColorScheme(
    //   background: Colors.black,
    // ),
  );
  static final darkTheme = ThemeData(
    useMaterial3: true,
    primaryColor: KColors.primaryColor,
    cardColor: Colors.white,
    // fontFamily: KFonts.EuclidBold.name,
    fontFamily: "Roboto",
    scaffoldBackgroundColor: KColors.scaffoldBackgroundColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: KColors.appbarColor,
      iconTheme: IconThemeData(
        color: KColors.whiteColor,
      ),
    ),
    textTheme: const TextTheme(
      bodyMedium: TextStyle(
        color: KColors.whiteColor,
      ),
    ),
    buttonTheme: const ButtonThemeData(
      buttonColor: Colors.white,
    ),
    // colorScheme: ColorScheme(background: Colors.white),
  );
}
