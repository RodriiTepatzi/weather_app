import 'administrative_area.dart';
import 'country.dart';

/// Represents a city.

class City {
  final int version;
  final String key;
  final String type;
  final int rank;
  final String localizedName;
  final Country country;
  final AdministrativeArea administrativeArea;

  City({
    required this.version,
    required this.key,
    required this.type,
    required this.rank,
    required this.localizedName,
    required this.country,
    required this.administrativeArea,
  });

  factory City.fromJson(Map<String, dynamic> json) {
    return City(
      version: json['Version'] as int,
      key: json['Key'] as String,
      type: json['Type'] as String,
      rank: json['Rank'] as int,
      localizedName: json['LocalizedName'] as String,
      country: Country.fromJson(json['Country'] as Map<String, dynamic>),
      administrativeArea: AdministrativeArea.fromJson(json['AdministrativeArea'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Version': version,
      'Key': key,
      'Type': type,
      'Rank': rank,
      'LocalizedName': localizedName,
      'Country': country.toJson(),
      'AdministrativeArea': administrativeArea.toJson(),
    };
  }
}
