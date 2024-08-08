import 'temperature.dart';

/// Represents the weather data for a location.
class WeatherData {
  final String localObservationDateTime;
  final int epochTime;
  final String weatherText;
  final int? weatherIcon; // Can be null
  final bool isDayTime;
  final Temperature temperature;
  final bool hasPrecipitation;
  final String? precipitationType; // Can be null
  final String mobileLink;
  final String link;

  WeatherData({
    required this.localObservationDateTime,
    required this.epochTime,
    required this.weatherText,
    this.weatherIcon, // Nullable
    required this.isDayTime,
    required this.temperature,
    required this.hasPrecipitation,
    this.precipitationType, // Nullable
    required this.mobileLink,
    required this.link,
  });

  factory WeatherData.fromJson(Map<String, dynamic> json) {
    return WeatherData(
      localObservationDateTime: json['LocalObservationDateTime'],
      epochTime: json['EpochTime'],
      weatherText: json['WeatherText'],
      weatherIcon: json['WeatherIcon'], // Nullable
      isDayTime: json['IsDayTime'],
      temperature: Temperature.fromJson(json['Temperature']),
      hasPrecipitation: json['HasPrecipitation'],
      precipitationType: json['PrecipitationType'], // Nullable
      mobileLink: json['MobileLink'],
      link: json['Link'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'LocalObservationDateTime': localObservationDateTime,
      'EpochTime': epochTime,
      'WeatherText': weatherText,
      'WeatherIcon': weatherIcon, // Nullable
      'IsDayTime': isDayTime,
      'Temperature': temperature.toJson(),
      'HasPrecipitation': hasPrecipitation,
      'PrecipitationType': precipitationType, // Nullable
      'MobileLink': mobileLink,
      'Link': link,
    };
  }
}


