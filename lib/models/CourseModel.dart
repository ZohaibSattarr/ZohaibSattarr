// To parse this JSON data, do
//
//     final courseModel = courseModelFromJson(jsonString);

import 'dart:convert';

CourseModel courseModelFromJson(String str) => CourseModel.fromJson(json.decode(str));

String courseModelToJson(CourseModel data) => json.encode(data.toJson());

class CourseModel {
    CourseModel({
        required this.courseNo,
        required this.courseDesc,
        required this.title,
    });

    String courseNo;
    String courseDesc;
    String title;

    factory CourseModel.fromJson(Map<String, dynamic> json) => CourseModel(
        courseNo: json["Course_No"],
        courseDesc: json["Course_Desc"],
        title: json["Title"],
    );

    Map<String, dynamic> toJson() => {
        "Course_No": courseNo,
        "Course_Desc": courseDesc,
        "Title": title,
    };
}
