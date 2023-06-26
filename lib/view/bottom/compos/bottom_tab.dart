import 'package:alleventstask/utils/constants/container_util.dart';
import 'package:alleventstask/utils/constants/k_colors.dart';
import 'package:alleventstask/utils/constants/k_styles.dart';
import 'package:flutter/material.dart';

class BottomTab extends StatelessWidget {
  final IconData? icon1, icon2, icon3;
  final TabController controller;
  final String? tab1, tab2, tab3;
  const BottomTab({
    required this.controller,
    required this.tab1,
    required this.tab2,
    required this.tab3,
    required this.icon1,
    required this.icon2,
    required this.icon3,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: KColors.whiteColor,
        borderRadius: witRadiusMid,
        boxShadow: witBoxShadow,
      ),
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: TabBar(
        // onTap: onTap ?? (v) {},
        isScrollable: true,
        controller: controller,
        labelColor: KColors.primaryColor,
        labelStyle:
            Kstyles.kSmallTextStyle.copyWith(fontWeight: FontWeight.w700),
        unselectedLabelStyle:
            Kstyles.kSmallTextStyle.copyWith(fontWeight: FontWeight.w700),
        indicatorColor: KColors.whiteColor,
        indicatorWeight: 1,
        indicatorSize: TabBarIndicatorSize.label,
        tabs: [
          Tab(
            text: tab1,
            icon: Icon(icon1),
          ),
          Tab(
            text: tab2,
            icon: Icon(icon2),
          ),
          Tab(
            text: tab3,
            icon: Icon(icon3),
          ),
        ],
      ),
    );
  }
}
