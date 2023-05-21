class RoomModel {
  String? id;
  String? city;
  String? type;
  List<String>? images;
  String? title;
  dynamic? price;
  String? desc;
  Contacts? contacts;

  RoomModel({
    this.id,
    this.city,
    this.type,
    this.images,
    this.title,
    this.price,
    this.desc,
    this.contacts,
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
        contacts: json["contacts"] == null
            ? null
            : Contacts.fromJson(json["contacts"]),
      );

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
