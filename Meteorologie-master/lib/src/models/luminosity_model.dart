// To parse this JSON data, do
//
//     final humidity = humidityFromJson(jsonString);

import 'dart:convert';

Luminosity? humidityFromJson(String str) =>
    Luminosity.fromJson(json.decode(str));

String luminosityToJson(Luminosity? data) => json.encode(data!.toJson());

class Luminosity {
  Luminosity({
    this.success,
    this.data,
    this.message,
  });

  bool? success;
  Map<String, num?>? data;
  String? message;

  factory Luminosity.fromJson(Map<String, dynamic> json) => Luminosity(
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
