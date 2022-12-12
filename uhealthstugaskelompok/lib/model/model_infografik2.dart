import 'dart:convert';

List<CommentInfografik2> komen2FromJson(String str) =>
    List<CommentInfografik2>.from(json.decode(str).map((x) => CommentInfografik2.fromJson(x)));

String komen2ToJson(List<CommentInfografik2> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CommentInfografik2 {
  CommentInfografik2({
    required this.user,
    required this.nama,
    required this.date,
    required this.comment
  });

  String user;
  String nama;
  DateTime date;
  String comment;

  factory CommentInfografik2.fromJson(Map<String, dynamic> json) => CommentInfografik2(
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