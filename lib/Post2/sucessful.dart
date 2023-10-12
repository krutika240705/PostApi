// To parse this JSON data, do
//
//     final sucess = sucessFromJson(jsonString);

import 'dart:convert';

Sucess sucessFromJson(String str) => Sucess.fromJson(json.decode(str));

String sucessToJson(Sucess data) => json.encode(data.toJson());

class Sucess {
    String token;

    Sucess({
        required this.token,
    });

    factory Sucess.fromJson(Map<String, dynamic> json) => Sucess(
        token: json["token"],
    );

    Map<String, dynamic> toJson() => {
        "token": token,
    };
}
