import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/const/apikey.dart';
import 'package:weather_app/const/apiurl.dart';
import 'package:weather_app/models/city.dart';

class LocationService{

  Future<List<City>> getLocationsCompletionsAsync(String query) async {
    try{
      
    final response = await http.get(
      Uri.parse('$apiLocationsUrl/cities/autocomplete?apikey=$apiKey&q=$query'),
    );

      List<dynamic> data = json.decode(response.body) as List<dynamic>;
      List<City> cities = data.map((json) => City.fromJson(json as Map<String, dynamic>)).toList();
      
      return cities;
    }catch(e){
      if(!Get.isSnackbarOpen) Get.snackbar("Error: ", "There was an error fetching locations. Please try again later.", snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.red, colorText: Colors.white);

      return [];
    }
  }
}