import 'dart:math';

import 'package:alleventstask/components/buttons/k_button.dart';
import 'package:alleventstask/components/cache_image.dart';
import 'package:alleventstask/components/sizing_box.dart';
import 'package:alleventstask/config/router/nav_service.dart';
import 'package:alleventstask/data/remote_data/dummy_data.dart';
import 'package:alleventstask/domain/models/json_models/event_item_model.dart';
import 'package:alleventstask/general_providers.dart';
import 'package:alleventstask/utils/constants/k_assets.dart';
import 'package:alleventstask/utils/constants/k_colors.dart';
import 'package:alleventstask/utils/constants/k_routes.dart';
import 'package:alleventstask/utils/constants/k_styles.dart';
import 'package:alleventstask/utils/enums/k_fonts.dart';
import 'package:alleventstask/utils/wrappers/responsive_util.dart';
import 'package:alleventstask/view/event_list/compos/event_grid_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:getwidget/components/carousel/gf_carousel.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:share_plus/share_plus.dart';

import '../../../utils/constants/container_util.dart';

class EventDetailScreen extends HookConsumerWidget {
  static const id = KRoutes.eventDetailScreen;
  final EventItemModel event;
  const EventDetailScreen({required this.event, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useEffect(() {
      ref.read(eventsViewProvider).configMapView(vvc: 0);
      ref
          .read(eventsViewProvider)
          .configSuggestedEvents(eventId: event.event_id!);
      // dev.log(event.);
      return null;
    }, []);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigate.instance.pushBack();
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: KColors.primaryColor,
          ),
        ),
        // leadingWidth: 45,
        title: Text(
          event.eventname ?? "Name Unavailable",
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: Kstyles.kAppBarTextStyle.copyWith(
            fontFamily: KFonts.EuclidBold.name,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () async {
              await Share.share(event.share_url!);
            },
            icon: Image.asset(
              KAssets.share,
              scale: 22,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CacheImage(
              image: event.banner_url!,
              width: Responsive.width(context),
              height: Responsive.width(context) / 2,
              roundCorner: 1,
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 5),
              padding: const EdgeInsets.all(10).copyWith(left: 13),
              decoration: BoxDecoration(
                color: KColors.whiteColor,
                // borderRadius: witRadiusStan,
                boxShadow: witBoxShadow,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Flexible(
                        flex: 7,
                        child: Text(
                          event.eventname ?? "Name Unavailable",
                          maxLines: 2,
                          style: Kstyles.kHeadingTextStyle.copyWith(
                            fontSize: Responsive.getFontSize(16),
                          ),
                        ),
                      ),
                      // const Sbw(w: 13),
                      const Spacer(),
                      InkWell(
                        onTap: () {},
                        // child: Container(
                        //   decoration: BoxDecoration(
                        //     borderRadius: witRadiusSmall,
                        //     color: KColors.whiteColor,
                        //     boxShadow: witBoxShadow,
                        //   ),
                        //   padding: const EdgeInsets.all(8),
                        child: Image.asset(
                          event.featured! == 1 ? KAssets.star2 : KAssets.star,
                          scale: 20,
                        ),
                        // ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              // margin: const EdgeInsets.only(),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: KColors.whiteColor,
                // borderRadius: witRadiusStan,
                boxShadow: witBoxShadow,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const HeadingEvent(
                    heading: "Date & Time",
                    icon: Icons.calendar_month,
                  ),
                  const Sbh(h: 8),
                  Text(
                    event.start_time_display!,
                    style: Kstyles.kSmallTextStyle.copyWith(
                      color: KColors().midGreyColor,
                    ),
                  ),
                  const Sbh(h: 24),
                  const HeadingEvent(
                    heading: "Venue",
                    icon: Icons.location_on_outlined,
                  ),
                  const Sbh(h: 8),
                  Text(
                    event.venue!['full_address'],
                    style: Kstyles.kSmallTextStyle.copyWith(
                      color: KColors().midGreyColor,
                    ),
                  ),
                  const Sbh(h: 10),
                  TextButton(
                    onPressed: () {
                      ref.read(eventsViewProvider).configMapView();
                    },
                    child: Row(
                      children: [
                        Text(
                          "View Map",
                          style: Kstyles.kAppBarTextStyle.copyWith(
                            fontSize: Responsive.getFontSize(16),
                          ),
                        ),
                        Visibility(
                          visible:
                              ref.read(eventsViewProvider).isViewingMap == 1,
                          replacement: Transform.rotate(
                            angle: -pi,
                            child: const Icon(
                              Icons.arrow_drop_down,
                              color: KColors.blackColor,
                            ),
                          ),
                          child: const Icon(
                            Icons.arrow_drop_down,
                            color: KColors.primaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Visibility(
                    visible: ref.read(eventsViewProvider).isViewingMap == 1,
                    child: Image.asset(
                      KAssets.mapPreview,
                      width: Responsive.width(context),
                      fit: BoxFit.fill,
                      height: 150,
                    ),
                  ),
                  // const MapView(longitude: 0, latitude: 0),
                  const Sbh(h: 20),
                  KButton(
                    buttonName: "Book Now",
                    onTap: () {
                      ref
                          .read(eventsViewProvider)
                          .bookEvent(eventUrl: event.event_url!);
                      // ref.read(eventsViewProvider).bookEvent();
                    },
                    useCirclularCorner: true,
                    height: 50,
                    fontSize: 19,
                    width: Responsive.width(context) * .921,
                  ),
                  const Sbh(h: 30),
                  const HeadingEvent(
                    heading: "Events's Photos",
                    icon: Icons.picture_in_picture,
                  ),
                  const Sbh(h: 15),
                  CacheImage(
                    image: event.banner_url!,
                    width: Responsive.width(context),
                    roundCorner: 1,
                    height: 180,
                  ),
                  // const Sbh(h: 15),

                  // const Sbh(h: 20),
                ],
              ),
            ),
            const Sbh(h: 5),
            Container(
              padding: const EdgeInsets.all(10),
              width: Responsive.width(context),
              decoration: BoxDecoration(
                color: KColors.whiteColor,
                // borderRadius: witRadiusStan,
                boxShadow: witBoxShadow,
              ),
              child: Column(
                children: [
                  const HeadingEvent(
                    heading: "Host Reviews by Attendees",
                    icon: Icons.rate_review,
                  ),
                  const Sbh(h: 15),
                  ListTile(
                    onTap: () {},
                    leading: CircleAvatar(
                      backgroundColor: KColors.primaryColor,
                      child: CacheImage(
                        image: dummyUser,
                      ),
                    ),
                    title: const Text(
                      "SER Youniverse",
                      style: Kstyles.kAppBarTextStyle,
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: List.generate(
                            5,
                            (index) {
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 3),
                                child: Image.asset(
                                  KAssets.star2,
                                  color: Colors.yellow.shade800,
                                  scale: 11,
                                ),
                              );
                            },
                          ),
                        ),
                        const Text(
                          "Total 12 Reviews",
                          style: Kstyles.kVerySmallTextStyle,
                        ),
                      ],
                    ),
                    trailing: KButton(
                      useCirclularCorner: true,
                      buttonName: "Follow",
                      onTap: () {
                        // ref.read(eventsViewProvider).followHost();
                      },
                    ),
                  ),
                ],
              ),
            ),
            const Sbh(h: 5),
            Container(
              padding: const EdgeInsets.all(10),
              width: Responsive.width(context),
              decoration: BoxDecoration(
                color: KColors.whiteColor,
                // borderRadius: witRadiusStan,
                boxShadow: witBoxShadow,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Suggested for you",
                    style: Kstyles.kAppBarTextStyle.copyWith(
                      fontSize: Responsive.getFontSize(16),
                    ),
                  ),

                  /// refractor this compo/cut paste in carousel view
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    // padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GFCarousel(
                          height: Responsive.width(context) * .85,
                          autoPlay: false,
                          enlargeMainPage: false,
                          onPageChanged: (index) {
                            // __.changeBannerState(index);
                          },
                          items: List.generate(
                            ref.watch(eventsViewProvider).selectedEvents.length,
                            (index) {
                              return event.event_id !=
                                      ref
                                          .watch(eventsViewProvider)
                                          .selectedEvents[index]['event_id']
                                  ? EventGridCard(
                                      goingCount: 6,
                                      width: Responsive.width(context) * .85,
                                      onLikeTap: () {},
                                      event: EventItemModel.fromMap(
                                        ref
                                            .watch(eventsViewProvider)
                                            .selectedEvents[index],
                                      ),
                                    )
                                  : const SizedBox();
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class HeadingEvent extends StatelessWidget {
  final String heading;
  final IconData icon;
  const HeadingEvent({
    required this.heading,
    required this.icon,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: KColors().midGreyColor,
          size: 25,
        ),
        const Sbw(w: 8),
        Text(
          heading,
          style: Kstyles.kAppBarTextStyle.copyWith(
            fontSize: Responsive.getFontSize(16),
          ),
        ),
      ],
    );
  }
}
