import 'package:alleventstask/utils/constants/k_assets.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../utils/constants/container_util.dart';

class CacheImage extends StatelessWidget {
  final double? height, width, roundCorner;
  final String image;
  final bool? useLoading, fromHome;
  final BoxFit? fit;
  const CacheImage(
      {Key? key,
      this.roundCorner,
      this.fromHome = false,
      this.fit,
      this.useLoading = false,
      this.height,
      required this.image,
      this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? 45,
      height: height ?? 45,
      child: ClipRRect(
        borderRadius: fromHome!
            ? witRoundedShape
            : BorderRadius.circular(roundCorner ?? 100),
        child: CachedNetworkImage(
          fit: fit ?? BoxFit.cover,
          imageUrl: image,
          width: width ?? 45,
          height: height ?? 45,
          placeholder: (context, url) {
            return useLoading!
                ? Container(
                    margin: const EdgeInsets.all(5),
                    height: 10,
                    width: 10,
                    child: const CircularProgressIndicator(),
                  )
                : Image.asset(
                    KAssets.loadingGif,
                    fit: BoxFit.cover,
                  );
          },
          errorWidget: (context, url, error) {
            // final _erre = error as ;
            // if(error.)
            return Image.asset(
              KAssets.errorAsset,
              fit: BoxFit.cover,
            );
          },
        ),
      ),
    );
  }
}
