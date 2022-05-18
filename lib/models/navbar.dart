// To parse this JSON data, do
//
//     final navbarmodel = navbarmodelFromJson(jsonString);

import 'dart:convert';

Navbarmodel navbarmodelFromJson(String str) => Navbarmodel.fromJson(json.decode(str));

String navbarmodelToJson(Navbarmodel data) => json.encode(data.toJson());

class Navbarmodel {
    Navbarmodel({
        required this.section,
        required this.discipline,
        required this.stFirstname,
        required this.stMiddlename,
        required this.stLastname,
        required this.regNo,
        required this.semesterNo,
        required this.semesterDesc,
    });

    String section;
    String discipline;
    String stFirstname;
    String stMiddlename;
    String stLastname;
    String regNo;
    String semesterNo;
    String semesterDesc;

    factory Navbarmodel.fromJson(Map<String, dynamic> json) => Navbarmodel(
        section: json["SECTION"],
        discipline: json["DISCIPLINE"],
        stFirstname: json["St_firstname"],
        stMiddlename: json["St_middlename"],
        stLastname: json["St_lastname"],
        regNo: json["Reg_No"],
        semesterNo: json["Semester_no"],
        semesterDesc: json["Semester_desc"],
    );

    Map<String, dynamic> toJson() => {
        "SECTION": section,
        "DISCIPLINE": discipline,
        "St_firstname": stFirstname,
        "St_middlename": stMiddlename,
        "St_lastname": stLastname,
        "Reg_No": regNo,
        "Semester_no": semesterNo,
        "Semester_desc": semesterDesc,
    };
}
