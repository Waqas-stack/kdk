// To parse this JSON data, do
//
//     final profileModels = profileModelsFromJson(jsonString);

import 'dart:convert';

ProfileModels profileModelsFromJson(String str) => ProfileModels.fromJson(json.decode(str));

String profileModelsToJson(ProfileModels data) => json.encode(data.toJson());

class ProfileModels {
  ProfileModels({
    this.id,
    this.username,
    this.balance,
    this.totalIn,
    this.totalOut,
    this.refunds,
    this.roleId,
    this.status,
    this.language,
    this.currency,
    this.lastLogin,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? username;
  String? balance;
  int? totalIn;
  int? totalOut;
  String? refunds;
  int? roleId;
  String? status;
  String? language;
  String? currency;
  DateTime? lastLogin;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory ProfileModels.fromJson(Map<String, dynamic> json) => ProfileModels(
    id: json["id"],
    username: json["username"],
    balance: json["balance"],
    totalIn: json["total_in"],
    totalOut: json["total_out"],
    refunds: json["refunds"],
    roleId: json["role_id"],
    status: json["status"],
    language: json["language"],
    currency: json["currency"],
    lastLogin: DateTime.parse(json["last_login"]),
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "username": username,
    "balance": balance,
    "total_in": totalIn,
    "total_out": totalOut,
    "refunds": refunds,
    "role_id": roleId,
    "status": status,
    "language": language,
    "currency": currency,
    "last_login": lastLogin!.toIso8601String(),
    "created_at": createdAt!.toIso8601String(),
    "updated_at": updatedAt!.toIso8601String(),
  };
}
