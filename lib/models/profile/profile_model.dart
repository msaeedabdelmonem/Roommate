// To parse this JSON data, do
//
//     final profileModel = profileModelFromJson(jsonString);

import 'dart:convert';

ProfileModel profileModelFromJson(String str) => ProfileModel.fromJson(json.decode(str));

String profileModelToJson(ProfileModel data) => json.encode(data.toJson());

class ProfileModel {
  String? id;
  String? name;
  String? mail;
  String? phone;
  String? image;

  ProfileModel({
    this.id,
    this.name,
    this.mail,
    this.phone,
    this.image,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
    id: json["id"],
    name: json["name"],
    mail: json["mail"],
    phone: json["phone"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "mail": mail,
    "phone": phone,
    "image": image,
  };
}
