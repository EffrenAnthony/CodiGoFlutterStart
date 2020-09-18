// ! patron de diseño provider
import 'package:flutter/material.dart';
import 'package:flutter_weather_app/viewModels/weather_provider.dart';
import 'package:flutter_weather_app/views/home_view.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WeatherApp',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MultiProvider(
        providers: [
          ListenableProvider<WeatherProvider>(create: (_) => WeatherProvider())
        ],
        child: HomeView(),
      ),
    );
  }
}
