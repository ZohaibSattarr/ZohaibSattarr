// ignore_for_file: file_names, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:teacherevaluation/models/CourseModel.dart';
import 'package:teacherevaluation/models/SemesterModel.dart';
import 'package:teacherevaluation/models/Teachermodel.dart';
import 'package:teacherevaluation/models/TemplateModel.dart';
import 'package:teacherevaluation/models/averagemodel.dart';

import '../models/courses.dart';
import '../models/navbar.dart';
import '../models/questionmodel.dart';

class Utilities {
  static Size getSize(BuildContext context) {
    return MediaQuery.of(context).size;
  // ignore: dead_code
  // bool isloading=false;
  // List<dynamic> data=[];

  }
    static var baseurl="http://192.168.1.3";
    static String dropdownValue = 'Student';
    static String semesterdropdownvalue = '2022SM';
    static String templatedropdownvalue = 'Amir_we';
    static String coursedropdownvalue = 'AI';
     static String teacherdropdownvalue = 'AAMIR  ';
     static String radiovalue = '';
    static String semestervalue = '2022SM';
    static String semester='';
    static List<dynamic> post=[];
    //static List<String> semesterdropdownvalue=[];
    static List<Navbarmodel> navbarlist=[];
    static List<Courses> courseslist=[];
     static List<Questionmodel> questionlist=[];
     static bool flag1=false;
      static bool flag2=false;
       static bool flag3=false;
        static bool flag4=false;
         static bool flag5=false;
          static bool flag6=false;
          static int val=1;
    static List<SemesterModel> SemesterList=[];
    static List<CourseModel> CourseList=[];
    static List<TeacherModel> TeacherList=[];
    static List<Templatemodel> TemplateList=[];
    static List<dynamic> averagelist=[];
    // static List<dynamic> questionlist= [];
    static String teachername="";
    static String regno="";
    static int reportSelectorCounter = 1;
    static List<Map<String, dynamic>> selectedCourcesreport = [
      
    ];

}
