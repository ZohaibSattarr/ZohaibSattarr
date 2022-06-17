// To parse this JSON data, do
//
//     final courses = coursesFromJson(jsonString);

// ignore_for_file: non_constant_identifier_names

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
        required this.emp_no,
    });

    String courseNo;
    String courseDesc;
    String discipline;
    String section;
    String semesterNo;
    String empFirstname;
    String empLastname;
    String emp_no;

    factory Courses.fromJson(Map<String, dynamic> json) => Courses(
        courseNo: json["Course_no"],
        courseDesc: json["Course_desc"],
        discipline: json["DISCIPLINE"],
        section: json["SECTION"],
        semesterNo: json["SEMESTER_NO"],
        empFirstname: json["Emp_firstname"],
        empLastname: json["Emp_lastname"],
        emp_no: json["Emp_no"],
    );

    Map<String, dynamic> toJson() => {
        "Course_no": courseNo,
        "Course_desc": courseDesc,
        "DISCIPLINE": discipline,
        "SECTION": section,
        "SEMESTER_NO": semesterNo,
        "Emp_firstname": empFirstname,
        "Emp_lastname": empLastname,
        "Emp_no":emp_no,
    };
}
