import 'dart:math';

import 'package:alleventstask/components/k_fetching.dart';
import 'package:alleventstask/domain/models/json_models/event_item_model.dart';
import 'package:alleventstask/general_providers.dart';
import 'package:alleventstask/utils/constants/k_colors.dart';
import 'package:alleventstask/utils/constants/k_routes.dart';
import 'package:alleventstask/utils/wrappers/responsive_util.dart';
import 'package:alleventstask/view/event_list/compos/event_grid_card.dart';
import 'package:alleventstask/view/event_list/compos/event_list_card.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_grid_view.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_tile.dart';

import '../compos/recent_viewed_events.dart';

class EventListScreen extends HookConsumerWidget {
  static const String id = KRoutes.eventListScreen;
  final bool isTyping;
  const EventListScreen({
    required this.isTyping,
    super.key,
  });

  static List<int> getRandomList(int length) {
    final random = Random();
    return List.generate(length,
        (_) => random.nextInt(100)); // Adjust 100 for your desired max value
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return RefreshIndicator(
      onRefresh: () async {
        await ref.read(eventsViewProvider).fetchCategories(isRefreshing: true);
      },
      color: KColors.primaryColor,
      child: SingleChildScrollView(
        child: Column(
          children: [
            ref.watch(eventsViewProvider).fetchingEvents
                ? const WitFetching()
                : ref.watch(eventsViewProvider).selectedViewType == 0
                    ? ListView.builder(
                        shrinkWrap: true,
                        physics: const ClampingScrollPhysics(),
                        itemCount: isTyping
                            ? ref
                                .watch(eventsViewProvider)
                                .searchedEvents
                                .length
                            : ref
                                .watch(eventsViewProvider)
                                .selectedEvents
                                .length,
                        itemBuilder: (BuildContext context, int index) {
                          final EventItemModel eventItem =
                              EventItemModel.fromMap(
                            isTyping
                                ? ref
                                    .watch(eventsViewProvider)
                                    .searchedEvents[index]
                                : ref
                                    .watch(eventsViewProvider)
                                    .selectedEvents[index],
                          );
                          final goingCount = getRandomList(ref
                              .watch(eventsViewProvider)
                              .selectedEvents
                              .length);
                          return EventListCard(
                            goingCount: goingCount[index],
                            event: eventItem,
                            onLikeTap: () {},
                          );
                        },
                      )
                    : StaggeredGridView.countBuilder(
                        physics: const BouncingScrollPhysics(),
                        shrinkWrap: true,
                        staggeredTileBuilder: (int index) =>
                            const StaggeredTile.fit(1),
                        mainAxisSpacing: 0,
                        crossAxisSpacing: 0,
                        primary: false,
                        // padding: const EdgeInsets.symmetric(),
                        itemCount: isTyping
                            ? ref
                                .watch(eventsViewProvider)
                                .searchedEvents
                                .length
                            : ref
                                .watch(eventsViewProvider)
                                .selectedEvents
                                .length,
                        crossAxisCount: Responsive.isMobile(context)
                            ? 2
                            : Responsive.isTablet(context)
                                ? 4
                                : 5,
                        itemBuilder: (BuildContext context, int j) {
                          final EventItemModel eventItem =
                              EventItemModel.fromMap(
                            isTyping
                                ? ref
                                    .watch(eventsViewProvider)
                                    .searchedEvents[j]
                                : ref
                                    .watch(eventsViewProvider)
                                    .selectedEvents[j],
                          );
                          final goingCount = getRandomList(ref
                              .watch(eventsViewProvider)
                              .selectedEvents
                              .length);
                          return EventGridCard(
                            goingCount: goingCount[j],
                            event: eventItem,
                            onLikeTap: () {},
                          );
                        },
                      ),
            RecentViewedEventsSection(
              events: ref.watch(eventsViewProvider).selectedEvents,
            ),
          ],
        ),
      ),
    );
  }
}
