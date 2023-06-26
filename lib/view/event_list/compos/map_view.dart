import 'package:alleventstask/general_providers.dart';
import 'package:alleventstask/utils/constants/container_util.dart';
import 'package:alleventstask/utils/wrappers/responsive_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MapView extends HookConsumerWidget {
  final double? latitude, longitude, height, width;
  const MapView({
    required this.longitude,
    required this.latitude,
    this.height,
    super.key,
    this.width,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useEffect(() {
      ref.read(eventsViewProvider).getInitial(latitude ?? 0, longitude ?? 0);
      return null;
    }, []);
    return Container(
      decoration: BoxDecoration(
        borderRadius: witRadiusMid,
        boxShadow: witBoxShadow,
      ),
      // height: widget.height ?? 70,
      // width: widget.width ?? 70,
      child: ref.watch(eventsViewProvider).kGooglePlex == null
          ? const Padding(
              padding: EdgeInsets.all(10),
              child: SizedBox(
                height: 40,
                width: 40,
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            )
          : SizedBox(
              width: Responsive.width(context),
              height: Responsive.height(context) -
                  (2 * AppBar().preferredSize.height + 60),
              child: GoogleMap(
                initialCameraPosition:
                    ref.watch(eventsViewProvider).kGooglePlex!,
                onMapCreated: (controller) {
                  ref.watch(eventsViewProvider).changeController(controller);
                },
                compassEnabled: true,
                zoomControlsEnabled: true,
                zoomGesturesEnabled: true,
                rotateGesturesEnabled: true,
                myLocationEnabled: true,
                scrollGesturesEnabled: true,
                myLocationButtonEnabled: false,
                onCameraMove: (CameraPosition cameraPositiona) {
                  // __.changeCameraPosition(cameraPositiona);
                },
                onCameraIdle: () {
                  // __.onCameraIdle(context);
                },
              ),
            ),
    );
  }
}
