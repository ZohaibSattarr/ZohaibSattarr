// To parse this JSON data, do
//
//     final questionmodel = questionmodelFromJson(jsonString);

import 'dart:convert';

Questionmodel questionmodelFromJson(String str) => Questionmodel.fromJson(json.decode(str));

String questionmodelToJson(Questionmodel data) => json.encode(data.toJson());

class Questionmodel {
    Questionmodel({
        required this.questionId,
        required this.question1,
        this.description,
    });

    int questionId;
    String question1;
    dynamic description;

    factory Questionmodel.fromJson(Map<String, dynamic> json) => Questionmodel(
        questionId: json["Question_ID"],
        question1: json["Question1"],
        description: json["Description"],
    );

    Map<String, dynamic> toJson() => {
        "Question_ID": questionId,
        "Question1": question1,
        "Description": description,
    };
}
