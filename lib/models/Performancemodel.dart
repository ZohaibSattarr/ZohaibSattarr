import 'dart:convert';

Performancemodel performancemodelFromJson(String str) => Performancemodel.fromJson(json.decode(str));

String performancemodelToJson(Performancemodel data) => json.encode(data.toJson());

class Performancemodel {
    Performancemodel({
        required this.empName,
        required this.empNo,
        required this.questionCount,
        required this.rating,
    });

    String empName;
    String empNo;
    int questionCount;
    double rating;

    factory Performancemodel.fromJson(Map<String, dynamic> json) => Performancemodel(
        empName: json["Emp_name"],
        empNo: json["Emp_no"],
        questionCount: json["Question_Count"],
        rating: json["Rating"],
    );

    Map<String, dynamic> toJson() => {
        "Emp_name": empName,
        "Emp_no": empNo,
        "Question_Count": questionCount,
        "Rating": rating,
    };
}