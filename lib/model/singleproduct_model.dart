import 'dart:convert';

class Singleproductmodel {
  String? id;
  String? name;
  Data? data;

  Singleproductmodel({
    this.id,
    this.name,
    this.data,
  });

  factory Singleproductmodel.fromRawJson(String str) =>
      Singleproductmodel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Singleproductmodel.fromJson(Map<String, dynamic> json) =>
      Singleproductmodel(
        id: json["id"],
        name: json["name"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "data": data?.toJson(),
      };
}

class Data {
  String? color;
  String? capacity;

  Data({
    this.color,
    this.capacity,
  });

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        color: json["color"],
        capacity: json["capacity"],
      );

  Map<String, dynamic> toJson() => {
        "color": color,
        "capacity": capacity,
      };
}
