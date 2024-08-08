import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/models/saved_city.dart';
import 'package:weather_app/services/weather_service.dart';

/// A widget that displays the weather data for a city.
/// 
/// weatherData: The weather data for the city.
class CityCard extends StatefulWidget {
  const CityCard({super.key, required this.weatherData});
  final SavedCity weatherData;

  @override
  State<CityCard> createState() => _CityCardState();
}

class _CityCardState extends State<CityCard> {
    String getFormattedTime(String dateTimeString) {
    DateTime dateTime = DateTime.parse(dateTimeString);
    return DateFormat('hh:mm a').format(dateTime);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      margin: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
        border: Border.all(
          color: Colors.grey,
        ),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.weatherData.city.localizedName,
                    style: const TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    widget.weatherData.description,
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.grey[700],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(12.0),
                  bottomRight: Radius.circular(12.0),
                ),
                color:  Color.fromARGB(255, 189, 225, 255),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  widget.weatherData.weatherData.weatherIcon == null ? const SizedBox() : // If the weather icon is null, we don't display anything
                  Image.network(
                    WeatherService().getWeatherIconUrl(widget.weatherData.weatherData.weatherIcon), // We call this so we can get the url of the weather icon
                    width: 55.0,
                    height: 55.0,
                  ),
                  Text(
                    getFormattedTime(widget.weatherData.weatherData.localObservationDateTime),
                    style: const TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}