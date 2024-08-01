import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../utils/global.dart';
import '../provider/weather_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    WeatherProvider weatherProvider = Provider.of<WeatherProvider>(context);
    WeatherProvider weatherProviderFalse =
        Provider.of<WeatherProvider>(context, listen: false);
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
                          ? day
                          : night),
                ),
              ),
              child: SingleChildScrollView(
                child: Column(children: [
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: TextField(
                      controller: txtSearch,
                      cursorHeight: 20,
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.search,
                          color: Colors.white,
                          size: 18,
                        ),
                        labelText: 'search',
                        labelStyle: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 1,
                          color:
                              weatherProvider.weatherModal.current.is_day == 1
                                  ? Colors.black
                                  : Colors.white,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(
                            color:
                                weatherProvider.weatherModal.current.is_day == 1
                                    ? Colors.black
                                    : Colors.white,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(color: Colors.white),
                        ),
                      ),
                      onSubmitted: (value) {
                        weatherProvider.findCity(value);
                      },
                    ),
                  ),
                  SizedBox(
                    height: height * 0.1,
                  ),
                  Text(
                    '${weatherProvider.weatherModal.location.name}',
                    style: (weatherProvider.weatherModal.current.is_day == 1)
                        ? TextStyle(color: Colors.black, fontSize: 50)
                        : TextStyle(color: Colors.white, fontSize: 50),
                  ),
                  Text(
                    '${weatherProvider.weatherModal.current.temp_c}°',
                    style: (weatherProvider.weatherModal.current.is_day == 1)
                        ? TextStyle(color: Colors.black, fontSize: 40)
                        : TextStyle(color: Colors.white, fontSize: 40),
                  ),
                  Text(
                    weatherProvider.weatherModal.current.condition.text,
                    style: (weatherProvider.weatherModal.current.is_day == 1)
                        ? TextStyle(color: Colors.black, fontSize: 16)
                        : TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Container(
                      height: height * 0.060,
                      width: width * 1,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: weatherProvider.weatherModal.current.is_day == 1
                            ? Colors.black12
                            : Colors.white12,
                      ),
                      child: ListTile(
                        title: Text(
                          'Very low pollen count',
                          style: (weatherProvider.weatherModal.current.is_day ==
                                  1)
                              ? TextStyle(color: Colors.black, fontSize: 12)
                              : TextStyle(color: Colors.white, fontSize: 12),
                        ),
                        leading: Icon(
                          Icons.settings,
                          color: Colors.white,
                        ),
                        trailing: Icon(
                          Icons.arrow_drop_down_sharp,
                          color:
                              (weatherProvider.weatherModal.current.is_day == 1)
                                  ? Colors.black
                                  : Colors.white,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Container(
                      height: height * 0.2,
                      width: width * 1,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: weatherProvider.weatherModal.current.is_day == 1
                            ? Colors.black12
                            : Colors.white12,
                      ),
                      child: //
                          SingleChildScrollView(
                        child: Column(
                          children: [
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  container(
                                      '${weatherProvider.weatherModal.current.temp_c}°',
                                      '3 PM',
                                      weatherProvider
                                          .weatherModal.current.is_day),
                                  container(
                                      '${weatherProvider.weatherModal.current.temp_c}°',
                                      '1 PM',
                                      weatherProvider
                                          .weatherModal.current.is_day),
                                  container(
                                      '${weatherProvider.weatherModal.current.temp_c}°',
                                      '2 PM',
                                      weatherProvider
                                          .weatherModal.current.is_day),
                                  container(
                                      '${weatherProvider.weatherModal.current.temp_c}°',
                                      '2 PM',
                                      weatherProvider
                                          .weatherModal.current.is_day),
                                  container(
                                      '${weatherProvider.weatherModal.current.temp_c}°',
                                      '2 PM',
                                      weatherProvider
                                          .weatherModal.current.is_day),
                                  container(
                                      '${weatherProvider.weatherModal.current.temp_c}°',
                                      '2 PM',
                                      weatherProvider
                                          .weatherModal.current.is_day),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 29,
                  ),
                  SingleChildScrollView(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          height: height * 0.060,
                          width: width * 0.2,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.white, width: 1),
                            shape: BoxShape.circle,
                            color:
                                weatherProvider.weatherModal.current.is_day == 1
                                    ? Colors.black12
                                    : Colors.white12,
                          ),child:
                         GestureDetector(onTap: (){


                           weatherProviderFalse.addToFavourite2(
                             weatherProvider.weatherModal.current.temp_c,
                           );
                           weatherProviderFalse.addToFavourite3(
                             // weatherModal.location.name,
                             weatherProvider.weatherModal.current.condition.text,
                           );weatherProvider.addToFavourite1(
                               weatherProvider.weatherModal.location.name);
                           weatherProviderFalse.getFavouriteScreen();
                         },child: Icon(Icons.favorite_border)),
                        ),
                        Container(
                          height: height * 0.060,
                          width: width * 0.3,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.white, width: 1),
                            borderRadius: BorderRadius.circular(20),
                            color:
                                weatherProvider.weatherModal.current.is_day == 1
                                    ? Colors.black12
                                    : Colors.white12,
                          ),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.of(context).pushNamed('/fav');
                            },
                            child: const Center(
                              child: Text(
                                'Favourite',
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ]),
              ),
            );
          } else if (snapshot.hasError) {
            return Center(child: Text('You cannot search area'));
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  Widget container(
    String time,
    String temp_c,
    int is_day,
  ) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              height: 10,
            ),
            Text(
              time,
              style: TextStyle(
                  color: is_day == 1 ? Colors.black : Colors.white,
                  fontSize: 15),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 30,
              width: 30,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/img/cloud.png'),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              temp_c,
              style: TextStyle(
                  color: is_day == 1 ? Colors.black : Colors.white,
                  fontSize: 15),
            ),
          ],
        ),
      ),
    );
  }
}
