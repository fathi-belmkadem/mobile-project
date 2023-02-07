// // To parse this JSON data, do
// //
// //     final humidity = humidityFromJson(jsonString);

// import 'dart:convert';

// Precipitations? precipitationsFromJson(String str) =>
//     Precipitations.fromJson(json.decode(str));

// String precipitationsToJson(Precipitations? data) =>
//     json.encode(data!.toJson());

// class Precipitations {
//   Precipitations({
//     this.success,
//     this.data,
//     this.message,
//   });

//   bool? success;
//   Map<String, num?>? data;
//   String? message;

//   factory Precipitations.fromJson(Map<String, dynamic> json) => Precipitations(
//         success: json["success"],
//         data:
//             Map.from(json["data"]!).map((k, v) => MapEntry<String, num?>(k, v)),
//         message: json["message"],
//       );

//   Map<String, dynamic> toJson() => {
//         "success": success,
//         "data": Map.from(data!).map((k, v) => MapEntry<String, dynamic>(k, v)),
//         "message": message,
//       };
// }
