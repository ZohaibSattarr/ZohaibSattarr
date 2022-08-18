// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:teacherevaluation/Admin.dart';

import 'package:teacherevaluation/View_Course.dart';
import 'package:teacherevaluation/adminsrc.dart';
import 'package:teacherevaluation/evaluation.dart';
import 'login.dart';
import 'View_Course.dart';
import 'Report.dart';
import 'Task.dart';
import 'Template.dart';

void main() {
  // WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(MaterialApp(
    builder: EasyLoading.init(),
    debugShowCheckedModeBanner: false,
    initialRoute: '/login',
    routes: {
      '/login': (context) => UserLogin(),
      '/View_Course':(context) =>ViewCourses(),
      //'/teacher_evaluation':(context) =>TeacherEvaluation(),
      '/Report': (context) => Report(),
      '/Task':(context) => ReportTask(),
      '/Template':(context) => TemplateTask(),
    },
  ));
  // FlutterNativeSplash.remove();
}


                  
