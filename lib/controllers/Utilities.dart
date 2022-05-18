import 'package:flutter/material.dart';

import '../models/courses.dart';
import '../models/navbar.dart';

class Utilities {
  static Size getSize(BuildContext context) {
    return MediaQuery.of(context).size;
  // ignore: dead_code
  // bool isloading=false;
  // List<dynamic> data=[];

  }
    static var baseurl="http://192.168.40.207";
    static String regno='';
    static String semester='';
    static List<Navbarmodel> navbarlist=[];
    static List<Courses> courseslist=[];
    static String teachername="";


}
