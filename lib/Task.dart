// import 'package:flutter/cupertino.dart';
// ignore_for_file: prefer_const_constructors, avoid_print, unused_import, prefer_const_constructors_in_immutables

import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;
import 'package:teacherevaluation/Admin.dart';
import 'package:teacherevaluation/controllers/AdminController.dart';
import 'package:teacherevaluation/controllers/DirectorController.dart';
import 'package:teacherevaluation/controllers/Utilities.dart';
import 'package:teacherevaluation/controllers/widgets.dart';
import 'package:teacherevaluation/models/questionmodel.dart';

import 'models/navbar.dart';

// ignore: must_be_immutable
class ReportTask extends StatefulWidget {
  ReportTask({Key? key}) : super(key: key);

  @override
  State<ReportTask> createState() => _ReportTask();
}

class _ReportTask extends State<ReportTask> {

// var password = TextEditingController();
DirectorController dir=DirectorController();
AdminController adm=AdminController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  CupertinoNavigationBar(
        middle: Text("Admin Dasboard"),
        backgroundColor: Colors.deepPurple,
        brightness: Brightness.dark,
      ),
        body: MyBackground(
            child: SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            
            SizedBox(
              height: 250,

            ),
            MyButton(text: "Add Report Template ",fontWeight: FontWeight.bold, onTap: ()async {
                 await dir.getallcourses();
                 await dir.getallsemester();
                 await dir.getallteachers();
                 EasyLoading.dismiss();
              Navigator.pushNamed(context, '/Report');

            }),
            SizedBox(
              height: 20,

            ),
            MyButton(text: "Add Questions",fontWeight: FontWeight.bold, onTap: ()async{
              await adm.getallquestions(context);

            }),
            const SizedBox(
              height: 20,
            ),
            
          ],
        ),
      ),
    )));
  }
  }
