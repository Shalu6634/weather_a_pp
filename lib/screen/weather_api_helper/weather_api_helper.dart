import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';



class WeatherApiHelper {
  Future<Map<String, dynamic>> fetchDataFromWeather(String search) async {
    String weatherApi =
        "http://api.weatherapi.com/v1/current.json?key=8b504ec98c5d443cbd7164745243007&q=$search";
    Uri Url = Uri.parse(weatherApi);
    Response response = await http.get(Url);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data;
    } else {
      return {};
    }
  }
}
// {
//   "location":
//   {
//     "name": "Surat",
//     "region": "Gujarat",
//     "country": "India",
//     "lat": 20.97,
//     "lon": 72.9,
//     "tz_id": "Asia/Kolkata",
//     "localtime_epoch": 1722358248,
//     "localtime": "2024-07-30 22:20"
//   },
//   "current": {
//     "last_updated_epoch": 1722357900,
//     "last_updated": "2024-07-30 22:15",
//     "temp_c": 27.4,
//     "temp_f": 81.3,
//     "is_day": 0,
//     "condition": {
//       "text": "Patchy rain nearby",
//       "icon": "//cdn.weatherapi.com/weather/64x64/night/176.png",
//       "code": 1063
//     },
//     "wind_mph": 15.9,
//     "wind_kph": 25.6,
//     "wind_degree": 220,
//     "wind_dir": "SW",
//     "pressure_mb": 1003.0,
//     "pressure_in": 29.63,
//     "precip_mm": 0.15,
//     "precip_in": 0.01,
//     "humidity": 89,
//     "cloud": 73,
//     "feelslike_c": 32.4,
//     "feelslike_f": 90.3,
//     "windchill_c": 27.4,
//     "windchill_f": 81.3,
//     "heatindex_c": 32.4,
//     "heatindex_f": 90.3,
//     "dewpoint_c": 25.4,
//     "dewpoint_f": 77.8,
//     "vis_km": 10.0,
//     "vis_miles": 6.0,
//     "uv": 1.0,
//     "gust_mph": 24.2,
//     "gust_kph": 39.0
//   }
// }
