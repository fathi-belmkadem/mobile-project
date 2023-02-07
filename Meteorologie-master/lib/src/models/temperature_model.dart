// To parse this JSON data, do
//
//     final humidity = humidityFromJson(jsonString);

import 'dart:convert';

Temperature? temperatureFromJson(String str) =>
    Temperature.fromJson(json.decode(str));

String temperatureToJson(Temperature? data) => json.encode(data!.toJson());

class Temperature {
  Temperature({
    this.success,
    this.data,
    this.message,
  });

  bool? success;
  Map<String, num?>? data;
  String? message;

  factory Temperature.fromJson(Map<String, dynamic> json) => Temperature(
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
