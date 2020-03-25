// To parse this JSON data, do
//
//     final tagData = tagDataFromJson(jsonString);

import 'dart:convert';

List<TagData> tagDataFromJson(String str) =>
    List<TagData>.from(json.decode(str).map((x) => TagData.fromJson(x)));

String tagDataToJson(List<TagData> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TagData {
  int id;
  String name;
  int count;
  int type;
  bool ambiguous;

  TagData({
    this.id,
    this.name,
    this.count,
    this.type,
    this.ambiguous,
  });

  factory TagData.fromJson(Map<String, dynamic> json) => TagData(
        id: json["id"],
        name: json["name"],
        count: json["count"],
        type: json["type"],
        ambiguous: json["ambiguous"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "count": count,
        "type": type,
        "ambiguous": ambiguous,
      };
}
