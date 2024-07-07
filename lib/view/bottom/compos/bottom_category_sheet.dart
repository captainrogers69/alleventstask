import 'package:alleventstask/components/drag_handle.dart';
import 'package:alleventstask/components/k_dividers.dart';
import 'package:alleventstask/components/modern_sheet.dart';
import 'package:alleventstask/components/sizing_box.dart';
import 'package:alleventstask/config/router/nav_service.dart';
import 'package:alleventstask/general_providers.dart';
import 'package:alleventstask/utils/constants/k_colors.dart';
import 'package:alleventstask/utils/wrappers/responsive_util.dart';
import 'package:alleventstask/view/bottom/compos/category_card.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class BottomCategorySheet extends HookConsumerWidget {
  const BottomCategorySheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: MediaQuery.of(context).viewInsets,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(10).copyWith(right: 15, left: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DragHandle(
                  width: Responsive.width(context) * 0.26,
                  color: KColors().greyColor,
                  height: 5,
                ),
                HeadingText(
                  heading: "Categories",
                  actionCompo: InkWell(
                    onTap: () {
                      Navigate.instance.pushBack();
                    },
                    child: const Icon(
                      Icons.close,
                    ),
                  ),
                ),
                const Sbh(h: 15),
                AboutDivider(color: KColors().greyColor, horizontal: 0),
                const Sbh(h: 10),
                CategoryCard(
                  categories: ref.watch(eventsViewProvider).allCategories,
                ),
                const Sbh(h: 15),
                // ListView.builder(
                //   shrinkWrap: true,
                //   physics: const ClampingScrollPhysics(),
                //   itemCount: ref.watch(eventsViewProvider).allCategories.length,
                //   itemBuilder: (BuildContext context, int index) {
                //     // final temp = ref.watch(eventsViewProvider).allCategories[index];
                //     return CategoryCard(
                //       categories: ref.watch(eventsViewProvider).allCategories,
                //     );
                //   },
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
