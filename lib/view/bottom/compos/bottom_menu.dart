import 'package:alleventstask/components/buttons/k_text_button.dart';
import 'package:alleventstask/general_providers.dart';
import 'package:alleventstask/utils/constants/container_util.dart';
import 'package:alleventstask/utils/constants/k_colors.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class BottomMenuModel {
  final IconData? icon;
  final String? buttonName;
  const BottomMenuModel({
    required this.buttonName,
    required this.icon,
  });
}

class BottomMenu extends HookConsumerWidget {
  const BottomMenu({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      decoration: BoxDecoration(
        color: KColors.whiteColor,
        borderRadius: witRadiusMid,
        boxShadow: witBoxShadow,
      ),
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(
          ref.watch(bottomProvider).menuList.length,
          (index) {
            final BottomMenuModel temp =
                ref.watch(bottomProvider).menuList[index];
            return temp.buttonName == 'Sort'
                ? KTextButton(
                    buttonName: temp.buttonName!,
                    selected: !ref.watch(eventsViewProvider).sortedAscending,
                    onTap: () {
                      ref.read(eventsViewProvider).sortEvents();
                    },
                    icon: temp.icon!,
                  )
                : KTextButton(
                    buttonName: temp.buttonName!,
                    selected: temp.buttonName ==
                        ref.watch(bottomProvider).selectedBottomMenu.buttonName,
                    onTap: () {
                      ref.read(bottomProvider).configBottomMenu(temp);
                    },
                    icon: temp.icon!,
                  );
          },
        ),
      ),
    );
  }
}
