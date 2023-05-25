// To parse this JSON data, do
//
//     final sharedDataModel = sharedDataModelFromJson(jsonString);

import 'dart:convert';

SharedDataModel sharedDataModelFromJson(String str) => SharedDataModel.fromJson(json.decode(str));

String sharedDataModelToJson(SharedDataModel data) => json.encode(data.toJson());

class SharedDataModel {
  String? path;

  SharedDataModel({
    this.path,
  });

  factory SharedDataModel.fromJson(Map<String, dynamic> json) => SharedDataModel(
    path: json["path"],
  );

  Map<String, dynamic> toJson() => {
    "path": path,
  };
}
