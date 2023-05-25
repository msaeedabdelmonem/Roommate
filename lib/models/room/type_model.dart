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
  SheetItemModel({
    this.id,
    this.type,
    this.name,
  });

  factory SheetItemModel.fromJson(Map<String, dynamic> json) => SheetItemModel(
    id: json["id"],
    type: json["type"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "type": type,
    "name": name,
  };
}
