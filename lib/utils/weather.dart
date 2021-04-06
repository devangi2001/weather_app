import 'dart:convert';        // converting Json
import 'package:flutter_weather_app/utils/location_helper.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

const apiKey = 'ce8f8d8a36e76b9087ae0b35830cd097';

class WeatherData {
  WeatherData({@required this.locationData});

  LocationHelper locationData;
  double currentTemperature;
  int currentCondition;
  String currentLocation;

  Future<void> getCurrentTemperature() async {
    Response response = await get(
        'https://api.openweathermap.org/data/2.5/weather?lat=${locationData.latitude}&lon=${locationData.longitude}&appid=$apiKey&units=metric');

                                                                                         //http se json ata hai, usko convert krne k liye line 22
    if (response.statusCode == 200) {                                                    //status code 200 means output thik se fletch
      var currentWeather = jsonDecode(response.body);
      print(currentWeather);
      try {                                                                                    // see try catch
        currentTemperature = currentWeather['main']['temp'].toDouble();                        //see all
        currentCondition = currentWeather['weather'][0]['id'];
        currentLocation = currentWeather['name'];
      } catch (e) {                                                                           //see
        print(e);
      }
    } else {
      print('Could not fetch temperature!');
    }
  }
}
