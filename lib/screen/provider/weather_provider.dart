import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../modal/weather_modal.dart';
import '../weather_api_helper/weather_api_helper.dart';

class WeatherProvider extends ChangeNotifier {
  WeatherApiHelper weatherApiHelper = WeatherApiHelper();
  late WeatherModal weatherModal;
  String search = 'surat';

  void findCity(String city) {
    search = city;
    notifyListeners();
  }

  List<String> weather = [];
  List<double> weather1 = [];
  List<String> weather2 = [];

  Future<WeatherModal> fromJsonApi(String city) async {
    final data = await weatherApiHelper.fetchDataFromWeather(city);
    weatherModal = WeatherModal.fromJson(data);
    return weatherModal;
  }



  Future<void> addToFavourite2(double temp_c)
  async {
    double data = temp_c;
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    weather1.add(data);
    sharedPreferences.setStringList('weather', weather);
  }
  Future<void> addToFavourite1( String name )
  async { String data = name;
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  weather.add(data);
  sharedPreferences.setStringList('weather', weather);
  }
  Future<void> addToFavourite3(String text)
  async {
    String data = text;
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    weather2.add(data);
    sharedPreferences.setStringList('weather', weather);
  }
    notifyListeners();



  Future<void> getFavouriteScreen() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    List<String> weather = sharedPreferences.getStringList('weather') ?? [];
    print(weather);
    notifyListeners();
  }
  }



