import 'dart:convert';

Chatlistmodel welcomeFromJson(String str) =>
    Chatlistmodel.fromJson(json.decode(str));

String welcomeToJson(Chatlistmodel data) => json.encode(data.toJson());

class Chatlistmodel {
  List<Datum> data;

  Chatlistmodel({
    required this.data,
  });

  factory Chatlistmodel.fromJson(Map<String, dynamic> json) => Chatlistmodel(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  String type;
  String id;
  Attributes attributes;

  Datum({
    required this.type,
    required this.id,
    required this.attributes,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        type: json["type"],
        id: json["id"],
        attributes: Attributes.fromJson(json["attributes"]),
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "id": id,
        "attributes": attributes.toJson(),
      };
}

class Attributes {
  int chatPartnerId;
  String name;
  String username;
  String email;
  dynamic profilePhotoPath;
  dynamic profilePhotoId;
  String phone;
  String gender;
  dynamic countryId;
  dynamic countryName;
  dynamic stateId;
  dynamic stateName;
  dynamic cityId;
  dynamic cityName;
  dynamic customCityName;
  bool isActive;
  String customerCode;
  bool isPremiumCustomer;
  dynamic bioIntroText;
  dynamic lastActiveAt;
  String profilePhotoUrl;
  String square100ProfilePhotoUrl;
  String square300ProfilePhotoUrl;
  String square500ProfilePhotoUrl;
  dynamic age;

  Attributes({
    required this.chatPartnerId,
    required this.name,
    required this.username,
    required this.email,
    required this.profilePhotoPath,
    required this.profilePhotoId,
    required this.phone,
    required this.gender,
    required this.countryId,
    required this.countryName,
    required this.stateId,
    required this.stateName,
    required this.cityId,
    required this.cityName,
    required this.customCityName,
    required this.isActive,
    required this.customerCode,
    required this.isPremiumCustomer,
    required this.bioIntroText,
    required this.lastActiveAt,
    required this.profilePhotoUrl,
    required this.square100ProfilePhotoUrl,
    required this.square300ProfilePhotoUrl,
    required this.square500ProfilePhotoUrl,
    required this.age,
  });

  factory Attributes.fromJson(Map<String, dynamic> json) => Attributes(
        chatPartnerId: json["chat_partner_id"],
        name: json["name"],
        username: json["username"],
        email: json["email"],
        profilePhotoPath: json["profile_photo_path"],
        profilePhotoId: json["profile_photo_id"],
        phone: json["phone"],
        gender: json["gender"],
        countryId: json["country_id"],
        countryName: json["country_name"],
        stateId: json["state_id"],
        stateName: json["state_name"],
        cityId: json["city_id"],
        cityName: json["city_name"],
        customCityName: json["custom_city_name"],
        isActive: json["is_active"],
        customerCode: json["customer_code"],
        isPremiumCustomer: json["is_premium_customer"],
        bioIntroText: json["bio_intro_text"],
        lastActiveAt: json["last_active_at"],
        profilePhotoUrl: json["profile_photo_url"],
        square100ProfilePhotoUrl: json["square100_profile_photo_url"],
        square300ProfilePhotoUrl: json["square300_profile_photo_url"],
        square500ProfilePhotoUrl: json["square500_profile_photo_url"],
        age: json["age"],
      );

  Map<String, dynamic> toJson() => {
        "chat_partner_id": chatPartnerId,
        "name": name,
        "username": username,
        "email": email,
        "profile_photo_path": profilePhotoPath,
        "profile_photo_id": profilePhotoId,
        "phone": phone,
        "gender": gender,
        "country_id": countryId,
        "country_name": countryName,
        "state_id": stateId,
        "state_name": stateName,
        "city_id": cityId,
        "city_name": cityName,
        "custom_city_name": customCityName,
        "is_active": isActive,
        "customer_code": customerCode,
        "is_premium_customer": isPremiumCustomer,
        "bio_intro_text": bioIntroText,
        "last_active_at": lastActiveAt,
        "profile_photo_url": profilePhotoUrl,
        "square100_profile_photo_url": square100ProfilePhotoUrl,
        "square300_profile_photo_url": square300ProfilePhotoUrl,
        "square500_profile_photo_url": square500ProfilePhotoUrl,
        "age": age,
      };
}
