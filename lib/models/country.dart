/// Country model class
class Country {
  final String id;
  final String localizedName;

  Country({required this.id, required this.localizedName});

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
      id: json['ID'] as String,
      localizedName: json['LocalizedName'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'ID': id,
      'LocalizedName': localizedName,
    };
  }
}