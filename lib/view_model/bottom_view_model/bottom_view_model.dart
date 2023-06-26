import 'package:alleventstask/view/bottom/compos/bottom_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class BottomViewModel with ChangeNotifier {
  // final Ref _ref;/(this._ref);
  BottomMenuModel _selectedBottomMenu = const BottomMenuModel(
    buttonName: "Category",
    icon: Icons.category_outlined,
  );
  BottomMenuModel get selectedBottomMenu => _selectedBottomMenu;

  void configBottomMenu(BottomMenuModel ccv) {
    if (ccv.buttonName == 'Sort') {
    } else {
      _selectedBottomMenu = ccv;
    }
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      notifyListeners();
    });
  }

  /// bottom menu list

  final List<BottomMenuModel> menuList = [
    const BottomMenuModel(
      buttonName: "Category",
      icon: Icons.category_outlined,
    ),
    const BottomMenuModel(
      buttonName: "Date & Time",
      icon: Icons.calendar_month,
    ),
    const BottomMenuModel(
      buttonName: "Sort",
      icon: Icons.switch_left_sharp,
    ),
  ];
}
