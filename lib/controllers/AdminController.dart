// ignore_for_file: unused_import, non_constant_identifier_names

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:teacherevaluation/Admin.dart';
import 'package:teacherevaluation/controllers/Utilities.dart';
import 'package:teacherevaluation/models/CourseModel.dart';
import 'package:http/http.dart' as http;
import 'package:teacherevaluation/models/SemesterModel.dart';
import 'package:teacherevaluation/models/Teachermodel.dart';
import 'package:dio/dio.dart';
import 'package:teacherevaluation/models/questionmodel.dart';


class AdminController{
Future<List<Questionmodel>> getallquestions(BuildContext context) async {
    final response = await http.get(
        Uri.parse(Utilities.baseurl+'/TeacherEvalutionV2/api/student/GetQuestions'));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      Utilities.questionlist.clear();
      for (Map<String, dynamic> i in data) {
        Utilities.questionlist.add(Questionmodel.fromJson(i));
      }
      Navigator.push(context, MaterialPageRoute(builder: (context)=>CheckBoxInListView()));
      EasyLoading.dismiss();
      return Utilities.questionlist;
      
    } else {
      EasyLoading.dismiss();
      return Utilities.questionlist;
    }
  }
 
}