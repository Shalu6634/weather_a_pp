import 'package:flutter/material.dart';
import 'package:weather_a_pp/screen/view/favouriteScreen.dart';
import 'package:weather_a_pp/screen/view/splashScreen.dart';

import '../screen/view/HomeScreen.dart';

class AppRoutes {
  static Map<String, Widget Function(BuildContext)> routes = {
    '/home': (context) => HomeScreen(),
    '/': (context) => SplashScreen(),
    '/fav': (context) => FavouriteScreen()
  };
}
