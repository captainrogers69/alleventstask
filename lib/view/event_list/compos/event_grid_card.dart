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

class EventGridCard extends StatelessWidget {
  final void Function() onLikeTap;
  final EventItemModel event;
  final double? width;
  const EventGridCard({
    required this.onLikeTap,
    required this.event,
    this.width,
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
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: KColors.whiteColor,
              borderRadius: witRadiusStan,
              boxShadow: witBoxShadow,
            ),
            height: 230,
            width: width ?? Responsive.width(context) * .45,
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            padding: const EdgeInsets.symmetric(vertical: 10).copyWith(top: 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CacheImage(
                  image: event.thumb_url_large ?? dummyUser,
                  width: width ?? Responsive.width(context) * .45,
                  roundCorner: 11,
                  height: 135,
                ),
                const Sbw(w: 8),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Sbh(h: 6),
                        Text(
                          event.eventname ?? "Name Unavailable",
                          maxLines: 1,
                          style: Kstyles.kSmallTextStyle.copyWith(
                            fontSize: Responsive.getFontSize(14.5),
                          ),
                        ),
                        const Sbh(h: 4),
                        Row(
                          children: [
                            Row(
                              children: List.generate(
                                3,
                                (index) {
                                  return CircleAvatar(
                                    radius: 7,
                                    backgroundColor: KColors.primaryColor,
                                    child: CacheImage(
                                      image: dummyUser,
                                    ),
                                  );
                                },
                              ),
                            ),
                            const Sbw(w: 5),
                            Text(
                              "20+ Going",
                              maxLines: 1,
                              style: Kstyles.kMediumTextStyle.copyWith(
                                fontSize: Responsive.getFontSize(13),
                                color: KColors.primaryColor,
                              ),
                            ),
                          ],
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
                        // Text(
                        //   DateTime.parse(
                        //           // .toString()
                        //           DateFormat('MMM d yyyy')
                        //               //     // 'E, MMM d yyyy - h:mm a')
                        //               .parse(event.label!)
                        //               .toString()
                        //           //     .toString()
                        //           // DateTime.parse(
                        //           )
                        //       .toString(),
                        // ),
                        const Sbh(h: 6),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            left: 16,
            top: 13,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: witRadiusSmall,
                color: KColors.whiteColor.withOpacity(0.4),
                boxShadow: witBoxShadow,
              ),
              width: 40,
              padding: const EdgeInsets.all(8),
              child: Text(
                event.start_time_display!.replaceRange(0, 4, ""),
                maxLines: 2,
                style: Kstyles.kSmallTextStyle.copyWith(
                  fontSize: Responsive.getFontSize(14),
                ),
              ),
            ),
          ),
          Positioned(
            right: 16,
            top: 13,
            child: InkWell(
              onTap: onLikeTap,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: witRadiusSmall,
                  color: KColors.whiteColor.withOpacity(0.4),
                  boxShadow: witBoxShadow,
                ),
                padding: const EdgeInsets.all(8),
                child: Image.asset(
                  event.featured! == 1 ? KAssets.star2 : KAssets.star,
                  color: event.featured! == 1
                      ? KColors.primaryColor
                      : KColors.whiteColor,
                  scale: 6.5,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
