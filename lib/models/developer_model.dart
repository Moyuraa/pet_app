import 'dart:convert';

List<DevelopersModel> developersModelFromJson(String str) =>
    List<DevelopersModel>.from(
        json.decode(str).map((x) => DevelopersModel.fromJson(x)));

String developersModelToJson(List<DevelopersModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DevelopersModel {
  int id;
  String name;
  String phone;
  String email;
  String profileUrl;
  String description;

  DevelopersModel({
    required this.id,
    required this.name,
    required this.phone,
    required this.email,
    required this.profileUrl,
    required this.description,
  });

  factory DevelopersModel.fromJson(Map<String, dynamic> json) =>
      DevelopersModel(
        id: json["id"],
        name: json["name"],
        phone: json["phone"],
        email: json["email"],
        profileUrl: json["profileURL"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "phone": phone,
        "email": email,
        "profileURL": profileUrl,
        "description": description,
      };
}
