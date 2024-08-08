import 'unit.dart';

/// Represents the temperature data for a location.
class Temperature {
  final Unit metric;
  final Unit imperial;

  Temperature({
    required this.metric,
    required this.imperial,
  });

  factory Temperature.fromJson(Map<String, dynamic> json) {
    return Temperature(
      metric: Unit.fromJson(json['Metric']),
      imperial: Unit.fromJson(json['Imperial']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Metric': metric.toJson(),
      'Imperial': imperial.toJson(),
    };
  }
}
