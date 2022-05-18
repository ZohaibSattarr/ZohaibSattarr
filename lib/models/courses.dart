// To parse this JSON data, do
//
//     final courses = coursesFromJson(jsonString);

import 'dart:convert';

Courses coursesFromJson(String str) => Courses.fromJson(json.decode(str));

String coursesToJson(Courses data) => json.encode(data.toJson());

class Courses {
    Courses({
        required this.courseNo,
        required this.courseDesc,
        required this.discipline,
        required this.section,
        required this.semesterNo,
        required this.empFirstname,
        required this.empLastname,
    });

    String courseNo;
    String courseDesc;
    String discipline;
    String section;
    String semesterNo;
    String empFirstname;
    String empLastname;

    factory Courses.fromJson(Map<String, dynamic> json) => Courses(
        courseNo: json["Course_no"],
        courseDesc: json["Course_desc"],
        discipline: json["DISCIPLINE"],
        section: json["SECTION"],
        semesterNo: json["SEMESTER_NO"],
        empFirstname: json["Emp_firstname"],
        empLastname: json["Emp_lastname"],
    );

    Map<String, dynamic> toJson() => {
        "Course_no": courseNo,
        "Course_desc": courseDesc,
        "DISCIPLINE": discipline,
        "SECTION": section,
        "SEMESTER_NO": semesterNo,
        "Emp_firstname": empFirstname,
        "Emp_lastname": empLastname,
    };
}
