import 'package:alleventstask/components/cache_image.dart';
import 'package:alleventstask/components/sizing_box.dart';
import 'package:alleventstask/config/router/nav_service.dart';
import 'package:alleventstask/data/remote_data/dummy_data.dart';
import 'package:alleventstask/domain/models/json_models/event_item_model.dart';
import 'package:alleventstask/utils/constants/container_util.dart';
import 'package:alleventstask/utils/constants/k_assets.dart';
import 'package:alleventstask/utils/constants/k_colors.dart';
import 'package:alleventstask/utils/constants/k_routes.dart';
import 'package:alleventstask/utils/constants/k_styles.dart';
import 'package:alleventstask/utils/wrappers/responsive_util.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class EventListCard extends StatelessWidget {
  final void Function() onLikeTap;
  final EventItemModel event;
  const EventListCard({
    required this.onLikeTap,
    required this.event,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigate.instance.navigateTo(KRoutes.eventDetailScreen, args: event);
      },
      splashColor: KColors().transparentColor,
      highlightColor: KColors().transparentColor,
      child: Container(
        decoration: BoxDecoration(
          color: KColors.whiteColor,
          borderRadius: witRadiusStan,
          boxShadow: witBoxShadow,
        ),
        height: 145,
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        padding: const EdgeInsets.symmetric(horizontal: 10).copyWith(left: 0),
        child: Row(
          children: [
            CacheImage(
              image: event.thumb_url_large ?? dummyUser,
              roundCorner: 11,
              height: 145,
              width: 135,
            ),
            const Sbw(w: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Sbh(h: 12),
                  Text(
                    event.eventname ?? "Name Unavailable",
                    maxLines: 2,
                    style: Kstyles.kSmallTextStyle.copyWith(
                      fontSize: Responsive.getFontSize(14),
                    ),
                  ),
                  Text(
                    event.start_time_display ?? "Date Unavailable",
                    style: Kstyles.kMediumTextStyle.copyWith(
                      fontSize: Responsive.getFontSize(13),
                      color: KColors().greyColor,
                    ),
                  ),
                  Text(
                    event.location == null
                        ? "${event.venue!['city']}, ${event.venue!['state']}"
                        : "${event.location!}, ${event.venue!['city']}",
                    maxLines: 1,
                    style: Kstyles.kMediumTextStyle.copyWith(
                      fontSize: Responsive.getFontSize(12),
                      color: KColors().greyColor,
                    ),
                  ),
                  const Spacer(),
                  // const Sbh(h: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [Container()],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () async {
                              await Share.share("${event.share_url}");
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: witRadiusSmall,
                                color: KColors.whiteColor,
                                boxShadow: witBoxShadow,
                              ),
                              padding: const EdgeInsets.all(8),
                              child: Image.asset(
                                KAssets.share,
                                scale: 30,
                              ),
                            ),
                          ),
                          const Sbw(w: 8),
                          InkWell(
                            onTap: onLikeTap,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: witRadiusSmall,
                                color: KColors.whiteColor,
                                boxShadow: witBoxShadow,
                              ),
                              padding: const EdgeInsets.all(8),
                              child: Image.asset(
                                event.featured! == 1
                                    ? KAssets.star2
                                    : KAssets.star,
                                scale: 6.5,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  const Sbh(h: 10),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
