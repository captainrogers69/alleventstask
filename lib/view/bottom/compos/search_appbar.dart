import 'package:alleventstask/components/sizing_box.dart';
import 'package:alleventstask/utils/constants/container_util.dart';
import 'package:alleventstask/utils/constants/k_assets.dart';
import 'package:alleventstask/utils/constants/k_colors.dart';
import 'package:alleventstask/utils/constants/k_styles.dart';
import 'package:alleventstask/utils/extensions/string_extension.dart';
import 'package:alleventstask/utils/wrappers/responsive_util.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../general_providers.dart';
import 'bottom_category_sheet.dart';

class SearchAppBar extends HookConsumerWidget implements PreferredSizeWidget {
  final GlobalKey<ScaffoldState> drawerkey;
  final void Function(String)? onChanged;
  final TextEditingController search;
  const SearchAppBar({
    required this.onChanged,
    required this.drawerkey,
    required this.search,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppBar(
      // leading: InkWell(
      //   onTap: () {
      //     drawerkey.currentState!.openDrawer();
      //   },
      //   splashColor: KColors().transparentColor,
      //   highlightColor: KColors().transparentColor,
      //   child: Padding(
      //     padding: const EdgeInsets.all(4),
      //     child: Transform.flip(
      //       flipX: true,
      //       child: Image.asset(
      //         KAssets.menu,
      //         color: KColors.whiteColor,
      //         scale: 12.5,
      //       ),
      //     ),
      //   ),
      // ),
      actions: [
        IconButton(
          onPressed: () {
            showModalBottomSheet(
              context: context,
              shape: roundedShapeStan,
              isScrollControlled: true,
              builder: (context) {
                return const BottomCategorySheet();
              },
            );
          },
          icon: const Icon(
            Icons.edit,
            color: KColors.whiteColor,
          ),
        ),
        IconButton(
          onPressed: () {
            ref.read(eventsViewProvider).configViewType();
          },
          icon: const Icon(
            Icons.grid_view,
            color: KColors.whiteColor,
          ),
        ),
        IconButton(
          onPressed: () {
            ref.read(eventsViewProvider).configViewType();
          },
          icon: const Icon(
            Icons.logout_outlined,
            color: KColors.whiteColor,
          ),
        )
      ],
      // leading: Image.asset(
      //   KAssets.logo,
      //   color: Colors.white,
      // ),
      leading: const SizedBox(),
      leadingWidth: 0, // 40,
      elevation: 5,
      backgroundColor: KColors.primaryColor,
      title: Row(
        children: [
          Image.asset(
            KAssets.logo,
            color: Colors.white,
            scale: 5,
          ),
          const Sbw(w: 8),
          Text(
            // "Showing Results(${ref.watch(eventsViewProvider).selectedEvents.length}) for:
            "${ref.watch(eventsViewProvider).selectedCategories.category!.capitalizeFirst()} Events",
            style: Kstyles.kHeadingTextStyle.copyWith(
              fontSize: Responsive.getFontSize(18),
              color: KColors.whiteColor,
            ),
          ),
        ],
      ),
      bottom: PreferredSize(
        preferredSize: preferredSize,
        child: Container(
          width: Responsive.width(context),
          height: 48,
          decoration: BoxDecoration(
            borderRadius: witRadiusStan,
            color: KColors.whiteColor,
          ),
          margin: const EdgeInsets.symmetric(horizontal: 10).copyWith(
            bottom: 10,
          ),
          child: TextField(
            controller: search,
            enabled: true,
            onTapOutside: (event) {
              FocusManager.instance.primaryFocus?.unfocus();
            },
            onChanged: onChanged,
            decoration: InputDecoration(
              prefixIcon: Image.asset(
                KAssets.search,
                color: KColors().midGreyColor,
                scale: 25.5,
              ),
              hintText: "Search by name",
              hintStyle: Kstyles.kSmallTextStyle.copyWith(
                fontWeight: FontWeight.w500,
                color: KColors().greyColor,
              ),
              border: InputBorder.none,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize =>
      Size.fromHeight(AppBar().preferredSize.height + kToolbarHeight);
}
