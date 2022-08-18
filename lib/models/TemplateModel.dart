import 'dart:convert';

Templatemodel questionmodelFromJson(String str) => Templatemodel.fromJson(json.decode(str));

String questionmodelToJson(Templatemodel data) => json.encode(data.toJson());

class Templatemodel {
    Templatemodel({
        required this.Teacher_name,
        required this.Course_no,
        required this.Semester,
        required this.Template_name,
    });

    String Teacher_name;
    String Course_no;
    String Semester;
    String Template_name;

    factory Templatemodel.fromJson(Map<String, dynamic> json) => Templatemodel(
        Teacher_name: json["Teacher_name"],
        Course_no: json["Course_no"],
        Semester: json["Semester"],
        Template_name: json["Template_name"],
    );

    Map<String, dynamic> toJson() => {
        "Teacher_name": Teacher_name,
        "Course_no": Course_no,
        "Semester": Semester,
        "Template_name": Template_name,
    };
}