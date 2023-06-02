// To parse this JSON data, do
//
//     final cityModel = cityModelFromJson(jsonString);

import 'dart:convert';

import 'package:roommate/models/room/type_model.dart';

CityModel cityModelFromJson(String str) => CityModel.fromJson(json.decode(str));

String cityModelToJson(CityModel data) => json.encode(data.toJson());

class CityModel {
  String? id;
  String? city;
  String? cityAr;
  List<SheetItemModel>? districts;

  CityModel({
    this.id,
    this.city,
    this.districts,
    this.cityAr
  });

  factory CityModel.fromJson(Map<String, dynamic> json) => CityModel(
    id: json["id"],
    city: json["city"],
    cityAr: json["city_ar"],
    districts: json["districts"] == null ? [] : List<SheetItemModel>.from(json["districts"]!.map((x) => SheetItemModel.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "city": city,
    "districts": districts == null ? [] : List<dynamic>.from(districts!.map((x) => x.toJson())),
  };
}

// class District {
//   String? name;
//   String? id;
//
//   District({
//     this.name,
//     this.id,
//   });
//
//   factory District.fromJson(Map<String, dynamic> json) => District(
//     name: json["name"],
//     id: json["id"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "name": name,
//     "id": id,
//   };
// }
