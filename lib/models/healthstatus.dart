// To parse this JSON data, do
//
//     final healthStatus = healthStatusFromJson(jsonString);

import 'dart:convert';

List<HealthStatus> healthStatusFromJson(String str) => List<HealthStatus>.from(json.decode(str).map((x) => HealthStatus.fromJson(x)));

String healthStatusToJson(List<HealthStatus> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class HealthStatus {
    HealthStatus({
        required this.model,
        required this.pk,
        required this.fields,
    });

    Model model;
    int pk;
    Fields fields;

    factory HealthStatus.fromJson(Map<String, dynamic> json) => HealthStatus(
        model: modelValues.map[json["model"]]!,
        pk: json["pk"],
        fields: Fields.fromJson(json["fields"]),
    );

    Map<String, dynamic> toJson() => {
        "model": modelValues.reverse[model],
        "pk": pk,
        "fields": fields.toJson(),
    };
}

class Fields {
    Fields({
        required this.user,
        required this.lastUpdate,
        required this.height,
        required this.weight,
        required this.age,
        required this.gender,
        required this.bmr,
        required this.bmi,
        required this.caloriesIntake,
    });

    int user;
    DateTime lastUpdate;
    int height;
    int weight;
    int age;
    String gender;
    double bmr;
    double bmi;
    int caloriesIntake;

    factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        user: json["user"],
        lastUpdate: DateTime.parse(json["last_update"]),
        height: json["height"],
        weight: json["weight"],
        age: json["age"],
        gender: json["gender"],
        bmr: json["bmr"].toDouble(),
        bmi: json["bmi"].toDouble(),
        caloriesIntake: json["calories_intake"],
    );

    Map<String, dynamic> toJson() => {
        "user": user,
        "last_update": lastUpdate.toIso8601String(),
        "height": height,
        "weight": weight,
        "age": age,
        "gender": gender,
        "bmr": bmr,
        "bmi": bmi,
        "calories_intake": caloriesIntake,
    };
}

enum Model { UHEALTHS_USERHEALTHSTATUS }

final modelValues = EnumValues({
    "uhealths.userhealthstatus": Model.UHEALTHS_USERHEALTHSTATUS
});

class EnumValues<T> {
    late Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        if (reverseMap == null) {
            reverseMap = map.map((k, v) => new MapEntry(v, k));
        }
        return reverseMap;
    }
}
