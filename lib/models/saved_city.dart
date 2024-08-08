import 'package:weather_app/models/city.dart';
import 'package:weather_app/models/weather_data.dart';

/// A class to represent a saved city

class SavedCity{
  final City city;
  final WeatherData weatherData;
  final String description;
  

  SavedCity({required this.city, required this.description, required this.weatherData});
}