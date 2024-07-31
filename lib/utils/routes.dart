import 'package:flutter/material.dart';

import '../screen/view/HomeScreen.dart';

class AppRoutes {
  static Map<String, Widget Function(BuildContext)> routes = {
    '/': (context) => HomeScreen(),
  };
}
