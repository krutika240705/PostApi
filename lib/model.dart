// To parse this JSON data, do
//
//     final getUserData = getUserDataFromJson(jsonString);
import 'dart:convert';
List<GetUserData> getUserDataFromJson(String str) => List<GetUserData>.from(json.decode(str).map((x) => GetUserData.fromJson(x)));
String getUserDataToJson(List<GetUserData> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
class GetUserData {
    int? userId;
    int? id;
    String? title;
    String? body;
    GetUserData({
        this.userId,
        this.id,
        this.title,
        this.body,
    });
    factory GetUserData.fromJson(Map<String, dynamic> json) => GetUserData(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        body: json["body"],
    );
    Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
        "body": body,
    };
}