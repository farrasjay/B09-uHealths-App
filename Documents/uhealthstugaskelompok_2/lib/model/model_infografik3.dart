import 'dart:convert';

List<CommentInfografik3> CommentInfografik3FromJson(String str) =>
    List<CommentInfografik3>.from(json.decode(str).map((x) => CommentInfografik3.fromJson(x)));

String CommentInfografik3ToJson(List<CommentInfografik3> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CommentInfografik3 {
  CommentInfografik3({
    required this.pk,
    required this.fields,
  });

  int pk;
  Fields fields;

  factory CommentInfografik3.fromJson(Map<String, dynamic> json) => CommentInfografik3(
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