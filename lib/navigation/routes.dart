
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:saveit/pages/home/home_view.dart';
import 'package:saveit/pages/splash/splash_view.dart';


class Routes {
  static String? currentRoute;
  
  static const splash = '/splash';
  static const home = '/home';

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    currentRoute = settings.name;
    switch (settings.name) {
      case splash:
        return PageTransition(
            child: const SplashView(),
            type: PageTransitionType.fade,
            settings: settings);

      case home:
        return PageTransition(
          child: const HomeView(),
          type: PageTransitionType.fade,
          settings: settings,);

     
      default:
        return PageTransition( 
            child: const HomeView(),
            childCurrent: const HomeView(),
            type: PageTransitionType.topToBottomJoined,
            settings: settings,
          );
    }
  }
}