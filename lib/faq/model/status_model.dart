// To parse this JSON data, do
//
//     final status = statusFromJson(jsonString);

import 'dart:convert';

Status statusFromJson(String str) => Status.fromJson(json.decode(str));

String statusToJson(Status data) => json.encode(data.toJson());

class Status {
    Status({
        required this.statusUser,
        required this.user,
    });

    bool statusUser;
    int user;

    factory Status.fromJson(Map<String, dynamic> json) => Status(
        statusUser: json["status_user"],
        user: json["user"],
    );

    Map<String, dynamic> toJson() => {
        "status_user": statusUser,
        "user": user,
    };
}
