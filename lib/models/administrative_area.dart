/// This file contains the model class for AdministrativeArea.
class AdministrativeArea {
  final String id;
  final String localizedName;

  AdministrativeArea({required this.id, required this.localizedName});

  factory AdministrativeArea.fromJson(Map<String, dynamic> json) {
    return AdministrativeArea(
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