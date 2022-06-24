// To parse this JSON data, do
//
//     final teacherModel = teacherModelFromJson(jsonString);

import 'dart:convert';

TeacherModel teacherModelFromJson(String str) => TeacherModel.fromJson(json.decode(str));

String teacherModelToJson(TeacherModel data) => json.encode(data.toJson());

class TeacherModel {
    TeacherModel({
        required this.empNo,
        required this.name,
    });

    String empNo;
    String name;

    factory TeacherModel.fromJson(Map<String, dynamic> json) => TeacherModel(
        empNo: json["Emp_no"],
        name: json["Name"],
    );

    Map<String, dynamic> toJson() => {
        "Emp_no": empNo,
        "Name": name,
    };
}
