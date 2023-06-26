import 'package:alleventstask/utils/constants/k_colors.dart';
import 'package:alleventstask/utils/enums/button_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class WitFetching extends StatelessWidget {
  final Color? color;
  final double? size;
  const WitFetching({
    this.color,
    this.size,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SpinKitCircle(
        color: color ?? KColors.primaryColor,
        size: size ?? 60,
      ),
    );
  }
}

class WitTextFetching extends StatelessWidget {
  final Color? color;
  final double? size;
  const WitTextFetching({
    this.color,
    this.size,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SpinKitThreeBounce(
      color: color ?? KColors.primaryColor,
      size: size ?? 20,
    );
  }
}

class WitIndicationFetching extends StatelessWidget {
  final ButtonState buttonState;
  final Color? color;
  final double? size;
  const WitIndicationFetching({
    required this.buttonState,
    this.color,
    this.size,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: buttonState == ButtonState.idle,
      replacement: Visibility(
        visible: buttonState == ButtonState.processing,
        replacement: Visibility(
          visible: buttonState == ButtonState.success,
          replacement: Center(
            child: Icon(
              Icons.error,
              color: color ?? KColors.errorColor,
              size: size ?? 120,
            ),
          ),
          child: Center(
            child: Icon(
              Icons.check_circle,
              color: color ?? KColors.switchColor,
              size: size ?? 120,
            ),
          ),
        ),
        child: Center(
          child: SpinKitCircle(
            color: color ?? KColors.primaryColor,
            size: size ?? 120,
          ),
        ),
      ),
      child: const SizedBox(),
    );
  }
}
