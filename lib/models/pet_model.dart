import 'dart:convert';

List<PetsModel> petsModelFromJson(String str) =>
    List<PetsModel>.from(json.decode(str).map((x) => PetsModel.fromJson(x)));

String petsModelToJson(List<PetsModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PetsModel {
  int id;
  String type;
  String name;
  String date;
  String description;
  bool isAdopted;
  String location;
  String imageUrl;
  String imageCoverUrl;
  String age;
  String color;
  String weight;
  String introduction;
  String imageDis1Url;
  String imageDis2Url;
  String imageDis3Url;

  PetsModel({
    required this.id,
    required this.type,
    required this.name,
    required this.date,
    required this.description,
    required this.isAdopted,
    required this.location,
    required this.imageUrl,
    required this.imageCoverUrl,
    required this.age,
    required this.color,
    required this.weight,
    required this.introduction,
    required this.imageDis1Url,
    required this.imageDis2Url,
    required this.imageDis3Url,
  });

  factory PetsModel.fromJson(Map<String, dynamic> json) => PetsModel(
        id: json["id"],
        type: json["type"],
        name: json["name"],
        date: json["date"],
        description: json["description"],
        isAdopted: json["isAdopted"],
        location: json["location"],
        imageUrl: json["imageURL"],
        imageCoverUrl: json["imageCoverURL"],
        age: json["age"],
        color: json["color"],
        weight: json["weight"],
        introduction: json["introduction"],
        imageDis1Url: json["imageDis1URL"],
        imageDis2Url: json["imageDis2URL"],
        imageDis3Url: json["imageDis3URL"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "type": type,
        "name": name,
        "date": date,
        "description": description,
        "isAdopted": isAdopted,
        "location": location,
        "imageURL": imageUrl,
        "imageCoverURL": imageCoverUrl,
        "age": age,
        "color": color,
        "weight": weight,
        "introduction": introduction,
        "imageDis1URL": imageDis1Url,
        "imageDis2URL": imageDis2Url,
        "imageDis3URL": imageDis3Url,
      };
}
