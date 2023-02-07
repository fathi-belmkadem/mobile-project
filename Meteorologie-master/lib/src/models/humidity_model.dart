// To parse this JSON data, do
//
//     final humidity = humidityFromJson(jsonString);

import 'dart:convert';

Humidity? humidityFromJson(String str) => Humidity.fromJson(json.decode(str));

String humidityToJson(Humidity? data) => json.encode(data!.toJson());

class Humidity {
  Humidity({
    this.success,
    this.data,
    this.message,
  });

  bool? success;
  Map<String, num?>? data;
  String? message;

  factory Humidity.fromJson(Map<String, dynamic> json) => Humidity(
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
