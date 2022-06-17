import 'package:flutter/material.dart';

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
    static var baseurl="http://192.168.1.13";
    static String regno='';
    static String dropdownValue = 'Student';
     static String radiovalue = '';
    static String semestervalue = '2022SM';
    static String semester='';
    static List<dynamic> post=[];
    static List<Navbarmodel> navbarlist=[];
    static List<Courses> courseslist=[];
     static List<Questionmodel> questionlist=[];
    // static List<dynamic> questionlist= [];
    static String teachername="";


}
