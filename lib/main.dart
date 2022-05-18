// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:teacherevaluation/View_Course.dart';
import 'package:teacherevaluation/evaluation.dart';
import 'login.dart';
import 'View_Course.dart';

void main() {
  // WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/login',
    routes: {
      '/login': (context) => UserLogin(),
      '/View_Course':(context) =>ViewCourses(),
      '/teacher_evaluation':(context) =>TeacherEvaluation(),
    },
  ));
  // FlutterNativeSplash.remove();
}


                  
