import 'package:alleventstask/components/route_error.dart';
import 'package:alleventstask/domain/models/json_models/event_item_model.dart';
import 'package:alleventstask/splash_screen.dart';
import 'package:alleventstask/view/auth/screens/signin_screen.dart';
import 'package:alleventstask/view/auth/screens/signup_screen.dart';
import 'package:alleventstask/view/bottom/screens/bottom_screen.dart';
import 'package:alleventstask/view/event_list/screens/event_detail_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static Route generateRoute(RouteSettings route) {
    // const PageTransitionType pageStyle = PageTransitionType.rightToLeft;
    // PageTransition(
    //   type: pageStyle,
    //   child: RouteError(),
    // );
    switch (route.name) {
      case SplashService.id:
        return MaterialPageRoute(builder: (context) => const SplashService());
      case SignInScreen.id:
        return MaterialPageRoute(builder: (context) => const SignInScreen());
      case SignUpScreen.id:
        return MaterialPageRoute(builder: (context) => const SignUpScreen());
      case BottomScreen.id:
        return MaterialPageRoute(builder: (context) => const BottomScreen());
      case EventDetailScreen.id:
        EventItemModel event = route.arguments as EventItemModel;
        return MaterialPageRoute(
            builder: (context) => EventDetailScreen(event: event));
      default:
        return MaterialPageRoute(builder: (context) => const RouteError());
    }
  }
}
