// To parse this JSON data, do
//
//     final forumDiscussion = forumDiscussionFromJson(jsonString);

import 'dart:convert';

List<ForumDiscussion> forumPostFromJson(String str) => List<ForumDiscussion>.from(json.decode(str).map((x) => ForumDiscussion.fromJson(x)));

String forumPostToJson(List<ForumDiscussion> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ForumDiscussion {
  ForumDiscussion({
    required this.pk,
    required this.creator,
    required this.topic,
    required this.description,
    required this.dateCreated,
  });

  int pk;
  String creator;
  String topic;
  String description;
  DateTime dateCreated;

  factory ForumDiscussion.fromJson(Map<String, dynamic> json) => ForumDiscussion(
    pk: json["pk"],
    creator: json["author"],
    topic: json["topic"],
    description: json["description"],
    dateCreated: DateTime.parse(json["date_created"]),
  );

  Map<String, dynamic> toJson() => {
    "pk": pk,
    "author": creator,
    "topic": topic,
    "description": description,
    "date_created": "${dateCreated.year.toString().padLeft(4, '0')}-${dateCreated.month.toString().padLeft(2, '0')}-${dateCreated.day.toString().padLeft(2, '0')}",
  };
}
