import 'dart:convert';

import 'package:roommate/core/constants/routes.dart';

RoomModel roomModelFromJson(String str) => RoomModel.fromJson(json.decode(str));

String roomModelToJson(RoomModel data) => json.encode(data.toJson());

class RoomModel {
  String? id;
  String? city;
  dynamic type;
  List<String>? images;
  String? title;
  dynamic price;
  String? desc;
  Contacts? contacts;
  String? path;
  String? district;
  String? descAr;
  String? titleAr;
  String? districtAr;

  RoomModel({
    this.id,
    this.city,
    this.type,
    this.images,
    this.title,
    this.price,
    this.desc,
    this.contacts,
    this.path,
    this.district,
    this.titleAr,
    this.descAr,
    this.districtAr,
  });

  factory RoomModel.fromJson(Map<String, dynamic> json) => RoomModel(
      id: json["id"],
      city: json["city"],
      type: json["type"],
      images: json["images"] == null
          ? ['']
          : List<String>.from(json["images"]!.map((x) => x)),
      title: json["title"],
      price: json["price"],
      desc: json["desc"],
      titleAr: json["title_ar"],
      descAr: json["desc_ar"],
      districtAr: json["district_ar"],
      contacts:
          json["contacts"] == null ? null : Contacts.fromJson(json["contacts"]),
      path: json["path"],
      district: json["district"]);

  Map<String, dynamic> toJson() => {
        "id": id,
        "city": city,
        "type": type,
        "images":
            images == null ? [] : List<dynamic>.from(images!.map((x) => x)),
        "title": title,
        "price": price,
        "desc": desc,
        "contacts": contacts?.toJson(),
        "path": RoutesNames.room,
        "district": district,
        "district_ar": districtAr,
        "title_ar": titleAr,
        "desc_ar": descAr,
      };
}

class Contacts {
  String? whatsApp;
  String? messanger;
  String? phone;

  Contacts({
    this.whatsApp,
    this.messanger,
    this.phone,
  });

  factory Contacts.fromJson(Map<String, dynamic> json) => Contacts(
        whatsApp: json["whatsApp"],
        messanger: json["messanger"],
        phone: json["phone"],
      );

  Map<String, dynamic> toJson() => {
        "whatsApp": whatsApp,
        "messanger": messanger,
        "phone": phone,
      };
}
