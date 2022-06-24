import 'dart:convert';

import 'package:teacherevaluation/controllers/Utilities.dart';
import 'package:teacherevaluation/models/CourseModel.dart';
import 'package:http/http.dart' as http;
import 'package:teacherevaluation/models/SemesterModel.dart';
import 'package:teacherevaluation/models/Teachermodel.dart';

class DirectorController
{
    Future<List<CourseModel>> getallcourses() async {
    final response = await http.get(
        Uri.parse(Utilities.baseurl+'/TeacherEvalutionV2/api/Director/get_Course_List'));
    var data =await jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      Utilities.CourseList.clear();
      for (Map<String, dynamic> i in data) {
        var key = true;
        if(Utilities.CourseList.isNotEmpty){
          Utilities.CourseList.forEach((element) {
            if(element.title.toLowerCase() == i['Title'].toString().toLowerCase()){
              key = false;
              print(i['Title']);
            }
          });
        }
        if(key){
          Utilities.CourseList.add(CourseModel.fromJson(i));
        }
      }
      print(Utilities.CourseList);
      return Utilities.CourseList;
      
    } else {
      return Utilities.CourseList;
    }
  }
  ///teacher
  ///
  ///
     Future<List<TeacherModel>> getallteachers() async {
    final response = await http.get(
        Uri.parse(Utilities.baseurl+'/TeacherEvalutionV2/api/Director/get_Teachers_List'));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {

      Utilities.TeacherList.clear();
      for (Map<String, dynamic> i in data) {
        Utilities.TeacherList.add(TeacherModel.fromJson(i));
      }
      print(Utilities.TeacherList);
      return Utilities.TeacherList;
      
    } else {
      return Utilities.TeacherList;
    }
  }
    ///semester
  ///
  ///
      Future<List<SemesterModel>> getallsemester() async {
    final response = await http.get(
        Uri.parse(Utilities.baseurl+'/TeacherEvalutionV2/api/Director/get_Semester_List'));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {

      Utilities.SemesterList.clear();
      for (Map<String, dynamic> i in data) {
        Utilities.SemesterList.add(SemesterModel.fromJson(i));
      }
      print(Utilities.SemesterList);
      
      return Utilities.SemesterList;
      
    } else {
      return Utilities.SemesterList;
    }
  }
}