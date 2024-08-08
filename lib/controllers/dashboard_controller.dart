import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/controllers/location_tab_controller.dart';
import 'package:weather_app/models/city.dart';
import 'package:weather_app/models/saved_city.dart';
import 'package:weather_app/services/location_service.dart';
import 'package:weather_app/services/weather_service.dart';
import 'package:weather_app/views/location_tab_view.dart';

/// Controller for the dashboard view
class DashboardController extends GetxController{

  int selectedIndex = 1;
  TextEditingController descriptionTextController = TextEditingController();
  RxList<City> locations = RxList.empty();
  City? selectedLocation;

  @override
  void onReady() {
    selectedLocation = null;
    super.onReady();
  }

  final List<Widget> widgetOptions = <Widget>[
    Container(),
    const LocationTabView(),
    Container(),
  ];

  /// Fetch the locations that match the query
  Future<void> fetchLocations(String query) async {

    if (query.isEmpty) return;

    try {
      var data = await LocationService().getLocationsCompletionsAsync(query);
      locations.value = data;
    } catch (e) {
      if(!Get.isSnackbarOpen) Get.snackbar("Error: ", "There was an error fetching locations. Please try again later.", snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.red, colorText: Colors.white);
    }
  }

  void onItemTapped(int index) {
    selectedIndex = 1;
    update();
  }

  /// Save the selected city to the list of saved cities
  void saveCity() async{
    if (selectedLocation != null && descriptionTextController.text.isNotEmpty) {
      
      // Fetch the current weather data for the selected city
      var weatherData = await WeatherService().getCurrentWeatherAsync(selectedLocation!.key);

      // If there was an error fetching the weather data, show a snackbar and return
      if(weatherData == null) {
        if(!Get.isSnackbarOpen) Get.snackbar("Error ", "There was an error fetching locations. Please try again later.", snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.red, colorText: Colors.white);
        return;
      }
      // Add the city to the list of saved cities
      Get.find<LocationTabController>().addCity(SavedCity(city: selectedLocation!, description: descriptionTextController.text, weatherData: weatherData));

      // Clear the selected location and description
      selectedLocation = null;
      descriptionTextController.clear();
    }
    else {
      if(!Get.isSnackbarOpen) Get.snackbar("Error ", "There are empty fields or a city was not selected.", snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.red, colorText: Colors.white);
    }
  }
}