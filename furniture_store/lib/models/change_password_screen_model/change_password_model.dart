/*
import 'dart:convert';

ChangePasswordData changePasswordDataFromJson(String str) => ChangePasswordData.fromJson(json.decode(str));

String changePasswordDataToJson(ChangePasswordData data) => json.encode(data.toJson());

class ChangePasswordData {
  ChangePasswordData({
    required this.success,
    required this.message,
  });

  bool success;
  String message;

  factory ChangePasswordData.fromJson(Map<String, dynamic> json) => ChangePasswordData(
    success: json["success"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
  };
}
*/

// To parse this JSON data, do
//
//     final changePasswordData = changePasswordDataFromJson(jsonString);

import 'dart:convert';

ChangePasswordData changePasswordDataFromJson(String str) => ChangePasswordData.fromJson(json.decode(str));

String changePasswordDataToJson(ChangePasswordData data) => json.encode(data.toJson());

class ChangePasswordData {
  ChangePasswordData({
    required this.success,
    required this.message,
    required this.data,
  });

  bool success;
  String message;
  Data data;

  factory ChangePasswordData.fromJson(Map<String, dynamic> json) => ChangePasswordData(
    success: json["success"],
    message: json["message"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "data": data.toJson(),
  };
}

class Data {
  Data({
    required this.id,
    required this.name,
    required this.email,
    required this.emailVerifiedAt,
    required this.password,
    required this.rememberToken,
    required this.image,
    required this.country,
    required this.state,
    required this.city,
    required this.forgotpasswordToken,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String name;
  String email;
  String emailVerifiedAt;
  String password;
  String rememberToken;
  String image;
  int country;
  int state;
  int city;
  String forgotpasswordToken;
  String createdAt;
  String updatedAt;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"] == null ? 0 : json["id"],
    name: json["name"] == null ? "" : json["name"],
    email: json["email"] == null ? "" : json["email"],
    emailVerifiedAt: json["email_verified_at"] == null ? "" : json["email_verified_at"],
    password: json["password"] == null ? "" : json["password"],
    rememberToken: json["remember_token"] == null ? "" : json["remember_token"],
    image: json["image"] == null ? "" : json["image"],
    country: json["country"] == null ? 0 : json["country"],
    state: json["state"] == null ? 0 : json["state"],
    city: json["city"] == null ? 0 : json["city"],
    forgotpasswordToken: json["forgotpassword_token"] == null ? "" : json["forgotpassword_token"],
    createdAt: json["created_at"] == null ? "" : json["created_at"],
    updatedAt: json["updated_at"] == null ? "" : json["updated_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id.toString().isEmpty ? 0 : id,
    "name": name.isEmpty ? "" : name,
    "email": email.isEmpty ? "" : email,
    "email_verified_at": emailVerifiedAt.isEmpty ? "" : emailVerifiedAt,
    "password": password.isEmpty ? "" : password,
    "remember_token": rememberToken.isEmpty ? "" : rememberToken,
    "image": image.isEmpty ? "" : image,
    "country": country.toString().isEmpty ? 0 : country,
    "state": state.toString().isEmpty ? 0 : state,
    "city": city.toString().isEmpty ? 0 : city,
    "forgotpassword_token": forgotpasswordToken.isEmpty ? "" : forgotpasswordToken,
    "created_at": createdAt.isEmpty ? "" : createdAt,
    "updated_at": updatedAt.isEmpty ? "" : updatedAt,
  };
}
