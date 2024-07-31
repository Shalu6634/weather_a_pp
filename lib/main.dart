import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_a_pp/screen/provider/weather_provider.dart';
import 'package:weather_a_pp/utils/routes.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => WeatherProvider(),
      )
    ],
    builder: (context, child) => MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: AppRoutes.routes,
    ),
  ));
}
