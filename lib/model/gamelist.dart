// To parse this JSON data, do
//
//     final gaminglist = gaminglistFromJson(jsonString);

import 'dart:convert';

Gaminglist gaminglistFromJson(String str) => Gaminglist.fromJson(json.decode(str));

String gaminglistToJson(Gaminglist data) => json.encode(data.toJson());

class Gaminglist {
  Gaminglist({
    this.data,
    this.meta,
  });

  List<Datum>? data;
  Meta? meta;

  factory Gaminglist.fromJson(Map<String, dynamic> json) => Gaminglist(
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    meta: Meta.fromJson(json["meta"]),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
    "meta": meta!.toJson(),
  };
}

class Datum {
  Datum({
    this.id,
    this.name,
    this.title,
    this.category,
    this.device,
    this.denomination,
    this.view,
    this.label,
    this.jpg,
  });

  int? id;
  String? name;
  String? title;
  List<dynamic>? category;
  int? device;
  String? denomination;
  int? view;
  dynamic label;
  String? jpg;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    name: json["name"],
    title: json["title"],
    category: List<dynamic>.from(json["category"].map((x) => x)),
    device: json["device"],
    denomination: json["denomination"],
    view: json["view"],
    label: json["label"],
    jpg: json["jpg"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "title": title,
    "category": List<dynamic>.from(category!.map((x) => x)),
    "device": device,
    "denomination": denomination,
    "view": view,
    "label": label,
    "jpg": jpg,
  };
}

class Meta {
  Meta({
    this.total,
    this.perPage,
    this.currentPage,
    this.lastPage,
    this.nextPageUrl,
    this.prevPageUrl,
    this.from,
    this.to,
  });

  int? total;
  int? perPage;
  int? currentPage;
  int? lastPage;
  String? nextPageUrl;
  dynamic prevPageUrl;
  int? from;
  int? to;

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
    total: json["total"],
    perPage: json["per_page"],
    currentPage: json["current_page"],
    lastPage: json["last_page"],
    nextPageUrl: json["next_page_url"],
    prevPageUrl: json["prev_page_url"],
    from: json["from"],
    to: json["to"],
  );

  Map<String, dynamic> toJson() => {
    "total": total,
    "per_page": perPage,
    "current_page": currentPage,
    "last_page": lastPage,
    "next_page_url": nextPageUrl,
    "prev_page_url": prevPageUrl,
    "from": from,
    "to": to,
  };
}
