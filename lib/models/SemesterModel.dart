// To parse this JSON data, do
//
//     final semesterModel = semesterModelFromJson(jsonString);

import 'dart:convert';

SemesterModel semesterModelFromJson(String str) => SemesterModel.fromJson(json.decode(str));

String semesterModelToJson(SemesterModel data) => json.encode(data.toJson());

class SemesterModel {
    SemesterModel({
        required this.semesterNo,
        required this.semesterDesc,
    });

    String semesterNo;
    String semesterDesc;

    factory SemesterModel.fromJson(Map<String, dynamic> json) => SemesterModel(
        semesterNo: json["Semester_no"],
        semesterDesc: json["Semester_desc"],
    );

    Map<String, dynamic> toJson() => {
        "Semester_no": semesterNo,
        "Semester_desc": semesterDesc,
    };
}
