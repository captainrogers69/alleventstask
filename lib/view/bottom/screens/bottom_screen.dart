import 'package:alleventstask/components/k_fetching.dart';
import 'package:alleventstask/components/sizing_box.dart';
import 'package:alleventstask/general_providers.dart';
import 'package:alleventstask/utils/constants/container_util.dart';
import 'package:alleventstask/utils/constants/k_colors.dart';
import 'package:alleventstask/utils/constants/k_routes.dart';
import 'package:alleventstask/utils/constants/k_styles.dart';
import 'package:alleventstask/utils/extensions/string_extension.dart';
import 'package:alleventstask/utils/wrappers/responsive_util.dart';
import 'package:alleventstask/view/bottom/compos/bottom_category_sheet.dart';
import 'package:alleventstask/view/bottom/compos/bottom_drawer.dart';
import 'package:alleventstask/view/bottom/compos/bottom_menu.dart';
import 'package:alleventstask/view/bottom/compos/bottom_tab_wrapper.dart';
import 'package:alleventstask/view/bottom/compos/search_appbar.dart';
import 'package:alleventstask/view/event_list/screens/event_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final GlobalKey<ScaffoldState> _bottomDrawerKey = GlobalKey<ScaffoldState>();

class BottomScreen extends HookConsumerWidget {
  static const id = KRoutes.bottomScreen;
  const BottomScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextEditingController search = useTextEditingController();
    // final TabController tabController = useTabController(initialLength: 3);
    useEffect(() {
      //   ref.read(eventsViewProvider).fetchCategories();
      return null;
    }, []);
    bool isTyping = search.text.isNotEmpty;
    return Scaffold(
      key: _bottomDrawerKey,
      drawer: BottomDrawer(
        bottomDrawerKey: _bottomDrawerKey,
      ),
      appBar: SearchAppBar(
        drawerkey: _bottomDrawerKey,
        search: search,
        onChanged: (p0) {
          ref.read(eventsViewProvider).searchEvents(querying: search);
        },
      ),
      body: Visibility(
        visible: ref.watch(eventsViewProvider).fetchingCategories,
        replacement: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const BottomMenu(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 0),
              child: Row(
                children: [
                  Flexible(
                    child: InkWell(
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          shape: roundedShapeStan,
                          isScrollControlled: true,
                          builder: (context) {
                            return const BottomCategorySheet();
                          },
                        );
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Showing Results(${ref.watch(eventsViewProvider).selectedEvents.length}) for: ${ref.watch(eventsViewProvider).selectedCategories.category!.capitalizeFirst()}",
                            style: Kstyles.kHeadingTextStyle.copyWith(
                              fontSize: Responsive.getFontSize(18),
                            ),
                          ),
                          Icon(
                            Icons.edit,
                            color: KColors().darkGreyColor,
                          )
                        ],
                      ),
                    ),
                  ),
                  const Sbw(w: 11),
                  IconButton(
                    onPressed: () {
                      ref.read(eventsViewProvider).configViewType();
                    },
                    icon: Icon(
                      Icons.grid_view,
                      color: KColors().darkGreyColor,
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: BottomTabWrapper(
                child1: EventListScreen(
                  isTyping: isTyping,
                ),
                child2: Container(),
                child3: Container(),
              ),
            ),
            // BottomTab(
            //   controller: tabController,
            //   tab1: ref.watch(bottomProvider).menuList[0].buttonName,
            //   tab2: ref.watch(bottomProvider).menuList[1].buttonName,
            //   tab3: ref.watch(bottomProvider).menuList[2].buttonName,
            //   icon1: ref.watch(bottomProvider).menuList[0].icon,
            //   icon2: ref.watch(bottomProvider).menuList[0].icon,
            //   icon3: ref.watch(bottomProvider).menuList[0].icon,
            // ),
          ],
        ),
        child: const WitFetching(
          color: KColors.primaryColor,
        ),
      ),
    );
  }
}
