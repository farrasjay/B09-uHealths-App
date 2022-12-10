import 'dart:convert';

List<CommentInfografik1> komen1FromJson(String str) =>
    List<CommentInfografik1>.from(json.decode(str).map((x) => CommentInfografik1.fromJson(x)));

String komen1ToJson(List<CommentInfografik1> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CommentInfografik1 {
  CommentInfografik1({
    required this.user,
    required this.nama,
    required this.date,
    required this.comment
  });

  String user;
  String nama;
  DateTime date;
  String comment;

  factory CommentInfografik1.fromJson(Map<String, dynamic> json) => CommentInfografik1(
        user: json["user"],
        nama: json["nama"],
        date: json["date"],
        comment: json["comment"]
      );

  Map<String, dynamic> toJson() => {
        "user": user,
        "nama": nama,
        "date": date,
        "comment": comment
      };
}