class RoomModel {
  int? id;
  String? city;
  String? type;
  List<String>? images;
  String? title;
  int? price;
  String? desc;
  List<Contact>? contacts;

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
            ? []
            : List<Contact>.from(
                json["contacts"]!.map((x) => Contact.fromJson(x))),
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
        "contacts": contacts == null
            ? []
            : List<dynamic>.from(contacts!.map((x) => x.toJson())),
      };
}

class Contact {
  String? whatsApp;
  String? messanger;
  String? phone;

  Contact({
    this.whatsApp,
    this.messanger,
    this.phone,
  });

  factory Contact.fromJson(Map<String, dynamic> json) => Contact(
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
