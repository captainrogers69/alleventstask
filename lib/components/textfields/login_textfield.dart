import 'package:alleventstask/utils/constants/container_util.dart';
import 'package:alleventstask/utils/constants/k_colors.dart';
import 'package:alleventstask/utils/constants/k_styles.dart';
import 'package:flutter/material.dart';

class LoginTextField extends StatelessWidget {
  final TextEditingController controller;
  final IconData icon;
  final String hintText;
  final bool secureIt;
  const LoginTextField({
    required this.controller,
    required this.hintText,
    this.secureIt = false,
    required this.icon,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.emailAddress,
        obscureText: secureIt,
        style: Kstyles.kSmallTextStyle,
        decoration: InputDecoration(
          prefixIcon: Icon(
            icon,
            color: KColors.blackColor,
          ),
          hintText: hintText,
          hintStyle: Kstyles.kSmallTextStyle,
          border: OutlineInputBorder(
            borderRadius: witRadiusStan,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: witRadiusStan,
            borderSide: const BorderSide(
              color: KColors.blackColor,
              width: 2,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: witRadiusStan,
            borderSide: const BorderSide(
              color: KColors.blackColor,
              width: 2,
            ),
          ),
        ),
      ),
    );
  }
}
