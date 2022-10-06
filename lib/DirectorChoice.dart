// ignore_for_file: prefer_const_constructors, unused_import, prefer_const_constructors_in_immutables

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
class DirectorChoiceTask extends StatefulWidget {
  DirectorChoiceTask({Key? key}) : super(key: key);

  @override
  State<DirectorChoiceTask> createState() => _DirectorChoiceTask();
}

class _DirectorChoiceTask extends State<DirectorChoiceTask> {
DirectorController dir=DirectorController();
// var password = TextEditingController();

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
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            
            SizedBox(
              height: 200,

            ),
            MyButton(text: "View Report Template",fontWeight: FontWeight.bold, onTap: ()async {
              await dir.gettemplate();
              Navigator.pushNamed(context, '/Template');

            }),
            SizedBox(
              height: 20,

            ),
            MyButton(text: "View List Of Teachers",fontWeight: FontWeight.bold, onTap: (){
              Navigator.pushNamed(context, '/Performance');

            }),
            const SizedBox(
              height: 20,
            ),
            MyButton(text: "View Graph Of Best Teacher",fontWeight: FontWeight.bold, onTap: (){
              Navigator.pushNamed(context, '/TopTeacher');

            }),
          ],
        ),
      ),
    )));
  }
  }