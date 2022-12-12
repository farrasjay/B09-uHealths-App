// To parse this JSON data, do
//
//     final question = questionFromJson(jsonString);

import 'dart:convert';

List<Question> questionFromJson(String str) => List<Question>.from(json.decode(str).map((x) => Question.fromJson(x)));

String questionToJson(List<Question> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Question {
    Question({
        required this.model,
        required this.pk,
        required this.fields,
    });

    String model;
    int pk;
    Fields fields;

    factory Question.fromJson(Map<String, dynamic> json) => Question(
        model: json["model"],
        pk: json["pk"],
        fields: Fields.fromJson(json["fields"]),
    );

    Map<String, dynamic> toJson() => {
        "model": model,
        "pk": pk,
        "fields": fields.toJson(),
    };
}

class Fields {
    Fields({
        required this.question,
        required this.answer,
        required this.numLiked,
        required this.liked,
    });

    String question;
    String answer;
    int numLiked;
    List<dynamic> liked;

    factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        question: json["question"],
        answer: json["answer"],
        numLiked: json["num_liked"],
        liked: List<dynamic>.from(json["liked"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "question": question,
        "answer": answer,
        "num_liked": numLiked,
        "liked": List<dynamic>.from(liked.map((x) => x)),
    };
}
