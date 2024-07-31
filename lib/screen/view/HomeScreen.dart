import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../utils/global.dart';
import '../provider/weather_provider.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    WeatherProvider weatherProvider = Provider.of<WeatherProvider>(context);
    return Scaffold(
      body: FutureBuilder(
        future: Provider.of<WeatherProvider>(context, listen: false)
            .fromJsonApi(
                Provider.of<WeatherProvider>(context, listen: false).search),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                      (weatherProvider.weatherModal.current.is_day == 1)
                          ? day : night),
                ),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  TextField(
                    controller: txtSearch,
                    decoration: InputDecoration(),
                    onSubmitted: (value) {
                      weatherProvider.fromJsonApi(value);

                    },
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Text(
                    weatherProvider.weatherModal.location.name,
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          } else {
            return CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
