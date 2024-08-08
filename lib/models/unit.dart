/// Unit model class
class Unit {
  final double value;
  final String unit;
  final int unitType;

  Unit({
    required this.value,
    required this.unit,
    required this.unitType,
  });

  factory Unit.fromJson(Map<String, dynamic> json) {
    return Unit(
      value: json['Value'],
      unit: json['Unit'],
      unitType: json['UnitType'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Value': value,
      'Unit': unit,
      'UnitType': unitType,
    };
  }
}
