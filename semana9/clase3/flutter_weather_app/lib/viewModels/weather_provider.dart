import 'package:flutter/material.dart';
import 'package:flutter_weather_app/models/forecast.dart';
import 'package:flutter_weather_app/models/location.dart';
import 'package:flutter_weather_app/services/own_api.dart';

class WeatherProvider extends ChangeNotifier {
  Forecast forecast;
  Location location = new Location(latitude: 0, longitude: 0);
  String city;

  Future fetchForecast(String value) async {
    city = value;
    OpenWeatherMapApi api = OpenWeatherMapApi();
    location = await api.getLocation(value);
    forecast = await api.getForecast(location);
    print("Forecast Updated");
    notifyListeners();
  }
}
