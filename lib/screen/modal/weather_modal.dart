
class WeatherModal {
  late Location location;
  late Current current;

  WeatherModal({required this.location, required this.current});

  factory WeatherModal.fromJson(Map m1) {
    return WeatherModal(
      location: Location.fromJson(m1['location']),
      current: Current.fromJson(m1['current']),
    );
  }
}

class Location {
  late String name, region, country, tz_id, localtime;
  late double lat, lon;

  Location(
      {required this.name,
      required this.country,
      required this.localtime,
      required this.lat,
      required this.region,
      required this.lon,
      required this.tz_id});

  factory Location.fromJson(Map m1) => Location(
        name: m1["name"],
        region: m1["region"],
        country: m1["country"],
        lat: m1["lat"].toDouble(),
        lon: m1["lon"].toDouble(),
        tz_id: m1['tz_id'],
        localtime: m1["localtime"],
      );
}
class Current {
  late String last_updated, wind_dir;
  late double temp_c, temp_f;
  late int is_day;
  late Condition condition;
  late double wind_mph,
      wind_kph,
      pressure_in,
      precip_mm,
      precip_in,
      feelslike_c,
      feelslike_f,
      windchill_c,
      windchill_f,
      heatindex_c,
      heatindex_f,
      dewpoint_c,
      dewpoint_f,
      vis_km,
      vis_miles,
      uv,
      gust_mph,
      gust_kph;

  late int cloud, humidity, wind_degree;
  Current(
      {required this.cloud,
      required this.dewpoint_c,
      required this.dewpoint_f,
      required this.condition,
      required this.feelslike_c,
      required this.feelslike_f,
      required this.gust_kph,
      required this.gust_mph,
      required this.heatindex_c,
      required this.heatindex_f,
      required this.humidity,
      required this.is_day,
      required this.last_updated,
      required this.precip_in,
      required this.precip_mm,
      required this.pressure_in,
      required this.temp_c,
      required this.temp_f,
      required this.vis_km,
      required this.uv,
      required this.vis_miles,
      required this.wind_degree,
      required this.wind_dir,
      required this.wind_kph,
      required this.wind_mph,
      required this.windchill_c,
      required this.windchill_f,
      });

  factory Current.fromJson(Map m1) {
    return Current(
        cloud: m1['cloud'],
        dewpoint_c: m1['dewpoint_c'],
        dewpoint_f: m1['dewpoint_f'],
        condition: Condition.fromJson(m1['condition']),
        feelslike_c: m1['feelslike_c'],
        feelslike_f: m1['feelslike_f'],
        gust_kph: m1['gust_kph'],
        gust_mph: m1['gust_mph'],
        heatindex_c: m1['heatindex_c'],
        heatindex_f: m1['heatindex_f'],
        humidity: m1['humidity'],
        is_day: m1['is_day'],
        last_updated: m1['last_updated'],
        precip_in: m1['precip_in'],
        precip_mm: m1['precip_mm'],
        pressure_in: m1['pressure_in'],
        temp_c: m1['temp_c'],
        temp_f: m1['temp_f'],
        vis_km: m1['vis_km'],
        uv: m1['uv'],
        vis_miles: m1['vis_miles'],
        wind_degree: m1['wind_degree'],
        wind_dir: m1['wind_dir'],
        wind_kph: m1['wind_kph'],
        wind_mph: m1['wind_mph'],
        windchill_c: m1['windchill_c'],
        windchill_f: m1['windchill_f'],
    );
  }
}

class Condition {
  late String text, icon;
  late int code;

  Condition({required this.text, required this.code, required this.icon});

  factory Condition.fromJson(Map m1) {
    return Condition(text: m1['text'], code: m1['code'], icon: m1['icon']);
  }
}
