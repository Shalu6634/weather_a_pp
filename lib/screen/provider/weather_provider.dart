import 'package:flutter/cupertino.dart';

import '../modal/weather_modal.dart';
import '../weather_api_helper/weather_api_helper.dart';

class WeatherProvider extends ChangeNotifier {
  WeatherApiHelper weatherApiHelper = WeatherApiHelper();
    late WeatherModal weatherModal;
    String search = 'surat';

    void findCity(String name)
    {
      search = name;
    }
  Future<WeatherModal> fromJsonApi(String name) async {
    final data = await weatherApiHelper.fetchDataFromWeather(name);
    weatherModal = WeatherModal.fromJson(data);
    return weatherModal;
  }

}
