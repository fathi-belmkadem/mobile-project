// To parse this JSON data, do
//
//     final humidity = humidityFromJson(jsonString);

import 'dart:convert';

Pressure? pressureFromJson(String str) => Pressure.fromJson(json.decode(str));

String pressureToJson(Pressure? data) => json.encode(data!.toJson());

class Pressure {
  Pressure({
    this.success,
    this.data,
    this.message,
  });

  bool? success;
  Map<String, num?>? data;
  String? message;

  factory Pressure.fromJson(Map<String, dynamic> json) => Pressure(
        success: json["success"],
        data:
            Map.from(json["data"]!).map((k, v) => MapEntry<String, num?>(k, v)),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": Map.from(data!).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "message": message,
      };
}
