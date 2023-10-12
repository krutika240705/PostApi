// To parse this JSON data, do
//
//     final unsucess = unsucessFromJson(jsonString);

import 'dart:convert';

Unsucess unsucessFromJson(String str) => Unsucess.fromJson(json.decode(str));

String unsucessToJson(Unsucess data) => json.encode(data.toJson());

class Unsucess {
    String error;

    Unsucess({
        required this.error,
    });

    factory Unsucess.fromJson(Map<String, dynamic> json) => Unsucess(
        error: json["error"],
    );

    Map<String, dynamic> toJson() => {
        "error": error,
    };
}
