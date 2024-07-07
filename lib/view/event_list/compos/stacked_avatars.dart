import 'package:flutter/material.dart';

import '../../../components/cache_image.dart';
import '../../../data/remote_data/dummy_data.dart';
import '../../../utils/constants/container_util.dart';
import '../../../utils/constants/k_colors.dart';

class StackedNetworkAvatars extends StatelessWidget {
  final bool isGrid;
  const StackedNetworkAvatars({this.isGrid = false, super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      child: Stack(
        children: List<Widget>.generate(
          3,
          (index) {
            return Padding(
              padding: EdgeInsets.fromLTRB(index.toDouble() * 18.0, 0, 0, 0),
              child: Container(
                padding: const EdgeInsets.all(3),
                decoration: BoxDecoration(
                  borderRadius: witRadiusCircular,
                  color: KColors.whiteColor,
                ),
                height: isGrid ? 25 : 27,
                width: isGrid ? 25 : 27,
                child: CircleAvatar(
                  radius: 10,
                  child: CacheImage(
                    image: dummyUser,
                    height: isGrid ? 25 : 27,
                    width: isGrid ? 25 : 27,
                    // initialsProfile: ,s
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
