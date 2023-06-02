// To parse this JSON data, do
//
//     final typeModel = typeModelFromJson(jsonString);

import 'dart:convert';

SheetItemModel typeModelFromJson(String str) => SheetItemModel.fromJson(json.decode(str));

String typeModelToJson(SheetItemModel data) => json.encode(data.toJson());

class SheetItemModel {
  String? id;
  int? type;
  String? name;
  String? nameAr;
  dynamic min;
  dynamic max;
  bool isActive;
  SheetItemModel({
    this.id,
    this.type,
    this.name,
    this.max,
    this.min,
    this.nameAr,
    this.isActive=false
  });

  factory SheetItemModel.fromJson(Map<String, dynamic> json) => SheetItemModel(
    id: json["id"],
    type: json["type"],
    name: json["name"],
    nameAr: json["name_ar"],
    min: json["min"],
    max: json["max"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "type": type,
    "name": name,
    "name_ar": nameAr,
    "min": min,
    "max": max,
  };
}
