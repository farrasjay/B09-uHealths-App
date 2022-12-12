// To parse this JSON data, do
//
//     final session = sessionFromJson(jsonString);

import 'dart:convert';

Session sessionFromJson(String str) => Session.fromJson(json.decode(str));

String sessionToJson(Session data) => json.encode(data.toJson());

class Session {
    Session({
        required this.recentlyViewedQuestion,
    });

    List<int> recentlyViewedQuestion;

    factory Session.fromJson(Map<String, dynamic> json) => Session(
        recentlyViewedQuestion: List<int>.from(json["recently_viewed_question"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "recently_viewed_question": List<dynamic>.from(recentlyViewedQuestion.map((x) => x)),
    };
}
