// To parse this JSON data, do
//
//     final forumComment = forumCommentFromJson(jsonString);

import 'dart:convert';

List<ForumComment> forumCommentFromJson(String str) => List<ForumComment>.from(json.decode(str).map((x) => ForumComment.fromJson(x)));

String forumCommentToJson(List<ForumComment> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ForumComment {
  ForumComment({
    required this.pk,
    required this.creator,
    required this.parentForum,
    required this.description,
    required this.dateCreated,
  });

  int pk;
  String creator;
  int parentForum;
  String description;
  DateTime dateCreated;

  factory ForumComment.fromJson(Map<String, dynamic> json) => ForumComment(
    pk: json["pk"],
    creator: json["author"],
    parentForum: json["parentForum"],
    description: json["description"],
    dateCreated: DateTime.parse(json["date_created"]),
  );

  Map<String, dynamic> toJson() => {
    "pk": pk,
    "author": creator,
    "parentForum": parentForum,
    "description": description,
    "date_created": "${dateCreated.year.toString().padLeft(4, '0')}-${dateCreated.month.toString().padLeft(2, '0')}-${dateCreated.day.toString().padLeft(2, '0')}",
  };
}
