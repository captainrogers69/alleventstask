import 'dart:developer';

import 'package:alleventstask/components/cache_image.dart';
import 'package:alleventstask/components/dialogs/k_alert_dialog.dart';
import 'package:alleventstask/config/router/nav_service.dart';
import 'package:alleventstask/data/remote_data/dummy_data.dart';
import 'package:alleventstask/general_providers.dart';
import 'package:alleventstask/utils/constants/k_colors.dart';
import 'package:alleventstask/utils/constants/k_styles.dart';
import 'package:alleventstask/utils/extensions/datetime_extension.dart';
import 'package:alleventstask/utils/wrappers/responsive_util.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class BottomDrawer extends HookConsumerWidget {
  final GlobalKey<ScaffoldState> bottomDrawerKey;
  const BottomDrawer({
    required this.bottomDrawerKey,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Drawer(
      width: Responsive.width(context) * 0.6,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 200.0,
            width: Responsive.width(context) * 0.6,
            child: Stack(
              children: [
                CacheImage(
                  image: dummyCover,
                  height: 200.0,
                  width: Responsive.width(context) * 0.6,
                  roundCorner: 5,
                  fit: BoxFit.fill,
                ),
                InkWell(
                  onTap: () {
                    log(ref.read(firebaseProvider).currentUser!.uid);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8).copyWith(bottom: 2),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Spacer(),
                        CacheImage(
                          image: dummyUser,
                          height: 55,
                          width: 55,
                        ),
                        Container(
                          padding: const EdgeInsets.all(2.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                ref
                                        .watch(authViewProvider)
                                        .currentUser!
                                        .googleMail ??
                                    "N/A",
                                style: Kstyles.kSmallTextStyle
                                    .copyWith(color: Colors.white),
                              ),
                              Text(
                                "Joined: ${formatDateStan(ref.watch(authViewProvider).currentUser!.dateOfJoining!.toDate())}",
                                style: Kstyles.kMediumTextStyle
                                    .copyWith(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          ListTile(
            onTap: () {
              // bottomDrawerKey.currentState!.closeDrawer();
              WIT().quickDialogue(
                callBack: () {
                  ref.read(authViewProvider).signOut();
                  Navigate.instance.pushBack();
                },
                title: "Confirm Logout",
                subtitle:
                    "You are going to log out of your account. Are you sure ?",
              );
            },
            title: Text(
              "Log out",
              style: Kstyles.kSmallTextStyle.copyWith(
                color: KColors.errorColor,
              ),
            ),
            leading: const Icon(
              Icons.logout,
              color: KColors.errorColor,
            ),
          )
        ],
      ),
    );
  }
}
