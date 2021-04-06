import 'package:flutter/material.dart';
import 'package:flutter_weather_app/utils/weather.dart';

class MainScreen extends StatefulWidget {
  MainScreen({@required this.weatherData});                                          //see

  final WeatherData weatherData;
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int temperature;
  String locationName;

  void updateDisplayInfo(WeatherData weatherData) {
    print(weatherData.currentTemperature);
    setState(() {
      temperature = weatherData.currentTemperature.round();
      locationName = weatherData.currentLocation;
    });
  }

  @override
  void initState() {
    super.initState();
    updateDisplayInfo(widget.weatherData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),                                                    //see
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 15.0,
            ),
            Center(
              child: Text(
                ' $temperature°',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 80.0,
                ),
              ),
            ),
            Center(
              child: Text(
                ' $locationName',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 40.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
