import 'dart:convert';

class Allproductmodel {
  String? id;
  String? name;
  Data? data;

  Allproductmodel({
    this.id,
    this.name,
    this.data,
  });

  factory Allproductmodel.fromRawJson(String str) =>
      Allproductmodel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Allproductmodel.fromJson(Map<String, dynamic> json) =>
      Allproductmodel(
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
  int? capacityGb;

  Data({
    this.color,
    this.capacity,
    this.capacityGb,
  });

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        color: json["color"],
        capacity: json["capacity"],
        capacityGb: json["capacity GB"],
      );

  Map<String, dynamic> toJson() => {
        "color": color,
        "capacity": capacity,
        "capacity GB": capacityGb,
      };
}
