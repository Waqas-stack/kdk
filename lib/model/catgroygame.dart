// To parse this JSON data, do
//
//     final gameCatgroy = gameCatgroyFromJson(jsonString);

import 'dart:convert';

GameCatgroy gameCatgroyFromJson(String str) => GameCatgroy.fromJson(json.decode(str));

String gameCatgroyToJson(GameCatgroy data) => json.encode(data.toJson());

class GameCatgroy {
  GameCatgroy({
    this.data,
    this.meta,
  });

  List<Datum>? data;
  Meta? meta;

  factory GameCatgroy.fromJson(Map<String, dynamic> json) => GameCatgroy(
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
    this.title,
    this.parent,
    this.position,
    this.href,
    this.shopId,
  });

  int? id;
  String? title;
  int? parent;
  int? position;
  String? href;
  int? shopId;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    title: json["title"],
    parent: json["parent"],
    position: json["position"],
    href: json["href"],
    shopId: json["shop_id"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "parent": parent,
    "position": position,
    "href": href,
    "shop_id": shopId,
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
  dynamic nextPageUrl;
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
