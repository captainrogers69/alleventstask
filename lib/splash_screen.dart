import 'dart:async';

import 'package:alleventstask/components/k_fetching.dart';
import 'package:alleventstask/general_providers.dart';
import 'package:alleventstask/utils/constants/k_colors.dart';
import 'package:alleventstask/utils/constants/k_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'view/bottom/screens/bottom_screen.dart';

class SplashScreen extends HookConsumerWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useEffect(() {
      ref.read(eventsViewProvider).fetchCategories();
      Timer(const Duration(seconds: 2), () {
        ref.read(navProvider).pushAndRemoveUntil(KRoutes.splashService);
      });
      return null;
    }, []);
    return const Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            WitTextFetching(
              color: KColors.primaryColor,
              size: 35,
            ),
          ],
        ),
      ),
    );
  }
}

class SplashService extends HookConsumerWidget {
  static const id = KRoutes.splashService;
  const SplashService({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final authState = ref.watch(authStreamProvider);
    useEffect(() {
      // ref.read(authViewProvider).fetchCurrentUser();
      return null;
    }, []);
    return const BottomScreen();
    // return authState.when(
    //   data: (data) {
    //     if (data != null) {
    //       return const BottomScreen();
    //     } else {
    //       return const SignInScreen();
    //     }
    //   },
    //   loading: () {
    //     return const WitTextFetching(
    //       color: KColors.primaryColor,
    //       size: 35,
    //     );
    //   },
    //   error: (error, _) {
    //     return const Text(
    //       "Something Went wrong, try again",
    //       style: Kstyles.kSmallTextStyle,
    //     );
    //   },
    // );
  }
}
