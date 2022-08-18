// import 'package:flutter/cupertino.dart';
// ignore_for_file: prefer_const_constructors, avoid_print, unused_import, prefer_const_constructors_in_immutables

import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;
import 'package:teacherevaluation/Admin.dart';
import 'package:teacherevaluation/Report.dart';
import 'package:teacherevaluation/controllers/AdminController.dart';
import 'package:teacherevaluation/controllers/DirectorController.dart';
import 'package:teacherevaluation/controllers/Utilities.dart';
import 'package:teacherevaluation/controllers/widgets.dart';
import 'package:teacherevaluation/models/TemplateModel.dart';
import 'package:teacherevaluation/models/questionmodel.dart';

import 'models/navbar.dart';

// ignore: must_be_immutable
class TemplateTask extends StatefulWidget {
  TemplateTask({Key? key}) : super(key: key);

  @override
  State<TemplateTask> createState() => _TemplateTask();
}

class _TemplateTask extends State<TemplateTask> {
var username = TextEditingController();
var password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  CupertinoNavigationBar(
        middle: Text("Director Dasboard"),
        backgroundColor: Colors.deepPurple,
        brightness: Brightness.dark,
      ),
        body: MyBackground(
            child: SafeArea(
      child: Column(
        children: [ Row(
          mainAxisAlignment:MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: 100,
            ),
            Text("Choose Template :",
            style: TextStyle( fontSize: 20, letterSpacing: .3)),
            TemplateDropDown(),
            const SizedBox(
              height: 20,
            ),
            
          ],
        ),
        SizedBox(
          height: 50,
        ),
        Row(
          children:[
          MyButton(text: "Show", onTap:(){

          })
          ])
        
        ]),
    )));
  }
  
  }
