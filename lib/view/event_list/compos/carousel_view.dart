// import 'package:alleventstask/components/cache_image.dart';
// import 'package:alleventstask/utils/constants/container_util.dart';
// import 'package:alleventstask/utils/constants/k_styles.dart';
// import 'package:alleventstask/utils/wrappers/responsive_util.dart';
// import 'package:flutter/material.dart';
// import 'package:carousel_slider/carousel_slider.dart';

// class CarouselView extends StatelessWidget {
//   final List? images, imageAssets;
//   final bool? infiteScroll;
//   final String title;
//   final List<Widget>? childs;
//   const CarouselView({
//     this.infiteScroll = true,
//     required this.title,
//     this.imageAssets,
//     this.images,
//     this.childs,
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: Responsive.width(context),
//       // padding: const EdgeInsets.all(10.0),
//       child: childs != null
//           ? CarouselSlider(
//               options: CarouselOptions(
//                   height: Responsive.getProportionateScreenHeight(
//                       context: context, inputHeight: 220),
//                   autoPlay: false,
//                   enlargeCenterPage: true,
//                   // enlargeFactor: .7,
//                   enableInfiniteScroll: infiteScroll!,
//                   viewportFraction: 1,
//                   onPageChanged: (index, reason) {
//                     // notifiers.value = index;
//                   }),
//               items: childs,
//             )
//           : images != null && images!.isEmpty
//               ? Center(
//                   child: Text(
//                     title,
//                     style: Kstyles.kSmallTextStyle,
//                   ),
//                 )
//               : CarouselSlider(
//                   options: CarouselOptions(
//                       height: Responsive.getProportionateScreenHeight(
//                           context: context, inputHeight: 150),
//                       autoPlay: false,
//                       enlargeCenterPage: true,
//                       enableInfiniteScroll: infiteScroll!,
//                       viewportFraction: 1,
//                       onPageChanged: (index, reason) {
//                         // notifiers.value = index;
//                       }),
//                   items: images != null
//                       ? images!.map(
//                           (imageItem) {
//                             return InkWell(
//                               onTap: () {
//                                 // Navigate.instance
//                                 //     .navigateTo(Routes.viewImage, args: {
//                                 //   'images': images,
//                                 //   'index': 0,
//                                 // });
//                               },
//                               child: ClipRRect(
//                                 borderRadius: witRoundedShape,
//                                 child: CacheImage(
//                                   roundCorner: 11,
//                                   fit: BoxFit.fill,
//                                   height:
//                                       Responsive.getProportionateScreenHeight(
//                                           context: context, inputHeight: 170),
//                                   width: Responsive.width(context) * 0.94,
//                                   image: imageItem,
//                                 ),
//                               ),
//                             );
//                           },
//                         ).toList()
//                       : imageAssets!.map(
//                           (asseting) {
//                             return ClipRRect(
//                               borderRadius: witRoundedShape,
//                               child: Image.asset(
//                                 asseting,
//                                 fit: BoxFit.fill,
//                                 height: Responsive.getProportionateScreenHeight(
//                                     context: context, inputHeight: 170),
//                                 width: Responsive.width(context) * 0.94,
//                               ),
//                             );
//                           },
//                         ).toList(),
//                 ),
//     );
//   }
// }
