import 'dart:convert';

List<CommentInfografik1> CommentInfografik1FromJson(String str) =>
    List<CommentInfografik1>.from(json.decode(str).map((x) => CommentInfografik1.fromJson(x)));

String CommentInfografik1ToJson(List<CommentInfografik1> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CommentInfografik1 {
  CommentInfografik1({
    required this.pk,
    required this.fields,
  });

  int pk;
  Fields fields;

  factory CommentInfografik1.fromJson(Map<String, dynamic> json) => CommentInfografik1(
        pk: json["pk"],
        fields: Fields.fromJson(json["fields"]),
      );

  Map<String, dynamic> toJson() => {
        "pk": pk,
        "fields": fields.toJson(),
      };
}


class Fields {
  Fields({
    required this.user,
    required this.nama,
    required this.date,
    required this.comment
  });

  int user;
  String nama;
  DateTime date;
  String comment;

  factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        user: json["user"],
        nama: json["nama"],
        date: DateTime.parse(json["date"]),
        comment: json["comment"]
      );

  Map<String, dynamic> toJson() => {
        "user": user,
        "nama": nama,
        "date": "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "comment": comment
      };
}