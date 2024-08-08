import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/const/apikey.dart';
import 'package:weather_app/const/apiurl.dart';
import 'package:weather_app/models/weather_data.dart';
import 'package:http/http.dart' as http;

class WeatherService{
  Future<WeatherData?> getCurrentWeatherAsync(String cityKey) async {
    final response = await http.get(
      Uri.parse('$apiConditionsUrl/$cityKey?apikey=$apiKey'),
    );

    try{
      List<dynamic> jsonResponse = json.decode(response.body) as List<dynamic>;
      WeatherData weatherData = WeatherData.fromJson(jsonResponse[0] as Map<String, dynamic>);
      
      return weatherData;
    }catch(e){
      if(!Get.isSnackbarOpen) Get.snackbar("Error: ", "There was an error fetching weather data. Please try again later.", snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.red, colorText: Colors.white);
      return null;
    }
    
  }

  String getWeatherIconUrl(int? iconCode) {
    const String baseUrl = 'https://developer.accuweather.com/sites/default/files/';

    String formattedIconCode = iconCode != null ? iconCode.toString().padLeft(2, '0') : '01';

    return '$baseUrl$formattedIconCode-s.png';
}
}