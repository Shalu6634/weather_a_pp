import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_a_pp/screen/provider/weather_provider.dart';
class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    WeatherProvider weatherProviderTrue =
        Provider.of<WeatherProvider>(context, listen: true);
    WeatherProvider weatherProviderFalse =
        Provider.of<WeatherProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          'Favourite',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ...List.generate(
                weatherProviderTrue.weather.length,
                (index) => Padding(
                      padding: const EdgeInsets.all(10),
                      child: Container(
                        padding: const EdgeInsets.all(15),
                        height: height * 0.1,
                        width: width * 0.8,
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(20)),
                        child: Row(
                          children: [
                            Center(
                              child: Text(
                                weatherProviderTrue.weather[index],
                                style: const TextStyle(color: Colors.white),
                              ),),
                            Text(
                              weatherProviderTrue.weather1[index].toString(),
                              style: const TextStyle(color: Colors.white),
                            ), Text(
                              weatherProviderTrue.weather2[index],
                              style: const TextStyle(color: Colors.white),
                            ),

                            const Spacer(),
                            IconButton(
                                onPressed: () {
                                  weatherProviderFalse.removeAtIndex(index);
                                },
                                icon: const Icon(
                                  Icons.delete,
                                  color: Colors.black,
                                ))
                          ],
                        ),
                      ),
                    )),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightBlue,
        onPressed: () {
          Navigator.of(context).pushNamed('/home');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

