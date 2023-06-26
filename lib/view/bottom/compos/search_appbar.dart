import 'package:alleventstask/utils/constants/container_util.dart';
import 'package:alleventstask/utils/constants/k_assets.dart';
import 'package:alleventstask/utils/constants/k_colors.dart';
import 'package:alleventstask/utils/constants/k_styles.dart';
import 'package:alleventstask/utils/wrappers/responsive_util.dart';
import 'package:flutter/material.dart';

class SearchAppBar extends StatelessWidget implements PreferredSizeWidget {
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
  Widget build(BuildContext context) {
    return AppBar(
      leading: InkWell(
        onTap: () {
          drawerkey.currentState!.openDrawer();
        },
        splashColor: KColors().transparentColor,
        highlightColor: KColors().transparentColor,
        child: Padding(
          padding: const EdgeInsets.all(4),
          child: Image.asset(
            KAssets.menu,
            color: KColors().midGreyColor,
          ),
        ),
      ),
      // actions: [
      //   IconButton(
      //     onPressed: () {
      //       showModalBottomSheet(
      //         context: context,
      //         shape: roundedShapeStan,
      //         isScrollControlled: true,
      //         builder: (context) {
      //           return const BottomCategorySheet();
      //         },
      //       );
      //     },
      //     icon: Icon(
      //       Icons.category_outlined,
      //       color: KColors().midGreyColor,
      //     ),
      //   )
      // ],
      leadingWidth: 45,
      title: Container(
        width: Responsive.width(context),
        height: 48,
        decoration: BoxDecoration(
          borderRadius: witRadiusMid,
          color: KColors().lightlightGreyColor,
        ),
        // margin: const EdgeInsets.symmetric(horizontal: 5),
        child: TextField(
          controller: search,
          enabled: true,
          onChanged: onChanged,
          decoration: InputDecoration(
            prefixIcon: Image.asset(
              KAssets.search,
              color: KColors().midGreyColor,
              scale: 19.5,
            ),
            hintText: "Search",
            hintStyle: Kstyles.kSmallTextStyle.copyWith(
              color: KColors().midGreyColor,
            ),
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);
}
