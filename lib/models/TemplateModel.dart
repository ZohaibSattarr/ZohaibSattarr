import 'dart:convert';

TemplateModel templateModelFromJson(String str) => TemplateModel.fromJson(json.decode(str));

String templateModelToJson(TemplateModel data) => json.encode(data.toJson());

class TemplateModel {
    TemplateModel({
        required this.teacherName,
        required this.courseName,
        required this.semesterNo,
        required this.templatename,
    });

    String teacherName;
    String courseName;
    String semesterNo;
    String templatename;

    factory TemplateModel.fromJson(Map<String, dynamic> json) => TemplateModel(
        teacherName: json["TeacherName"],
        courseName: json["CourseName"],
        semesterNo: json["SemesterNo"],
        templatename: json["Templatename"],
    );

    Map<String, dynamic> toJson() => {
        "TeacherName": teacherName,
        "CourseName": courseName,
        "SemesterNo": semesterNo,
        "Templatename": templatename,
    };
}
