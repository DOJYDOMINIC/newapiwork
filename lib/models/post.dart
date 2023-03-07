// To parse this JSON data, do
//
//     final newspaper = newspaperFromJson(jsonString);

import 'dart:convert';

List<Newspaper> newspaperFromJson(String str) => List<Newspaper>.from(json.decode(str).map((x) => Newspaper.fromJson(x)));

String newspaperToJson(List<Newspaper> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Newspaper {
  Newspaper({
    required this.userId,
    required this.id,
    required this.title,
     required this.body,
  });

  int userId;
  int id;
  String title;
  String body;

  factory Newspaper.fromJson(Map<String, dynamic> json) => Newspaper(
    userId: json["userId"],
    id: json["id"],
    title: json["title"],
    body: json["body"],
  );

  Map<String, dynamic> toJson() => {
    "userId": userId,
    "id": id,
    "title": title,
    "body": body,
  };
}
