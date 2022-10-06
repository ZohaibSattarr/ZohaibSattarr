class Averagemodel {
  String? empNo;
  int? questionDesc;
  int? questionCount;
  double? averageMarks;

  Averagemodel(
      {this.empNo, this.questionDesc, this.questionCount, this.averageMarks});

  Averagemodel.fromJson(Map<String, dynamic> json) {
    empNo = json['Emp_no'];
    questionDesc = json['Question_Desc'];
    questionCount = json['QuestionCount'];
    averageMarks = json['AverageMarks'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['Emp_no'] = this.empNo;
    data['Question_Desc'] = this.questionDesc;
    data['QuestionCount'] = this.questionCount;
    data['AverageMarks'] = this.averageMarks;
    return data;
  }
}