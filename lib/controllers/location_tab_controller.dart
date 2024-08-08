import 'package:get/get.dart';
import 'package:weather_app/models/saved_city.dart';

/// Controller for the location tab
class LocationTabController extends GetxController {
  RxList<SavedCity> savedCities = RxList<SavedCity>.empty();
  
  void addCity(SavedCity city) {
    savedCities.add(city);
  }
}