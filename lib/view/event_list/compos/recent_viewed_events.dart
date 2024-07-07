import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../components/sizing_box.dart';
import '../../../domain/models/json_models/event_item_model.dart';
import 'event_list_card.dart';

class RecentViewedEventsSection extends HookConsumerWidget {
  final List events;
  const RecentViewedEventsSection({required this.events, super.key});

  static List<int> getRandomList(int length) {
    final random = Random();
    return List.generate(length,
        (_) => random.nextInt(100)); // Adjust 100 for your desired max value
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // return const SizedBox();
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Sbh(h: 12),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: Text(
            "Recently Viewed Events",
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontWeight: FontWeight.w600,
                  fontSize: 19,
                ),
          ),
        ),
        const Sbh(
          h: 6.5,
        ),
        ListView.builder(
          shrinkWrap: true,
          // reverse: true,
          physics: const ClampingScrollPhysics(),
          itemCount: events.length.clamp(0, 3),
          itemBuilder: (BuildContext context, int index) {
            final temp = EventItemModel.fromMap(events[index]);
            final goingCount = getRandomList(events.length);
            return InkWell(
              onTap: () {},
              child: EventListCard(
                goingCount: goingCount[index],
                event: temp,
                onLikeTap: () {},
              ),
            );
          },
        ),
      ],
    );
  }
}
