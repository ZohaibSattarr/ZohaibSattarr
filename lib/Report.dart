// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_const_constructors_in_immutables, duplicate_ignore, dead_code, prefer_final_fields, avoid_print, unnecessary_new, sized_box_for_whitespace, unused_local_variable, unused_import, non_constant_identifier_names

import 'dart:convert';
import 'dart:developer';
import 'dart:ffi';

import 'package:charts_flutter/flutter.dart' as charts;
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:teacherevaluation/controllers/AdminController.dart';
import 'package:teacherevaluation/controllers/DirectorController.dart';
import 'package:teacherevaluation/controllers/Utilities.dart';
import 'package:teacherevaluation/controllers/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:teacherevaluation/models/averagemodel.dart';
import 'models/bar_chart_model.dart';

class Report extends StatefulWidget {
  Report({Key? key}) : super(key: key);

  @override
  State<Report> createState() => _Report();
}

class _Report extends State<Report> {
   List<ReportSeries> data=[];
 
List<Widget> _cardList = [
  Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween, 
    children: [
  SemesterDropDown(count: 1,),
  TeacherDropDown(count: 1,),
  CourseDropDown(count: 1,)
  ]
  )
];
// @override
// initState()
// {
//   _getaverage();
// }
// _getaverage() async
// {
// Utilities.averagelist=await DirectorController().getaverage();
// print(Utilities.averagelist);
// }
AdminController ad= new AdminController();
var Template = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ignore: prefer_const_constructors
      appBar:  CupertinoNavigationBar(
        middle: Text("Add Template"),
        backgroundColor: Colors.deepPurple,
        brightness: Brightness.dark,
      ),
        body: MyBackground(
            child: SafeArea(
      child: SingleChildScrollView(
        child: Column(
          
          children: [
            MyInputField(controller: Template, hint: "Write Template Name"),
            SizedBox(
              height: 50,

            ),
            Container(
              height: 250,
              child: ListView.builder(
                itemCount: _cardList.length,
                itemBuilder:(context, index) {
                return _cardList[index];
              },),
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            // CourseDropDown(),
            // TeacherDropDown(),
            // SemesterDropDown(),

            // ],),
            SizedBox(
              height: 170,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // ignore: deprecated_member_use
                RaisedButton(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)), 
                
                  child: Text('Save') ,
                  color: Colors.deepPurple,
                  splashColor: Colors.red,
                  padding: EdgeInsets.symmetric(vertical: 15.0),
                  onPressed: (){
                    EasyLoading.show();
                   
                  AddTmp();
                  
                   EasyLoading.dismiss();

                    // for (int i=0;i<Utilities.reportSelectorCounter;i++) {
                    // //  print( Utilities.selectedCourcesreport.
                     
                    // //  );
                      
                    // }

  setState(() {
    
  });
                   
                  },
                  ), 
                  RaisedButton.icon(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)), 
                  icon: Icon(
                    Icons.add
                  ),
                  label: Text('ADD') ,
                  color: Colors.deepPurple,
                  splashColor: Colors.red,
                  padding: EdgeInsets.symmetric(vertical: 15.0),
                  onPressed: (){
                   if(_cardList.length <= 3){
                     Utilities.reportSelectorCounter++;
                     _cardList.add(
                     Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween, 
    children: [
  SemesterDropDown(count: Utilities.reportSelectorCounter,),
  TeacherDropDown(count: Utilities.reportSelectorCounter,),
  CourseDropDown(count: Utilities.reportSelectorCounter,)
  ]
  )
                   );
                   
                   setState(() {
                     
                   });
                   }
                  },
                  )

              ],
            ),
    
          ]),
          ),
           
    )));
  }
   AddTmp() async{
    if(Template.text.isEmpty)
    {
          ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("PLease Enter Template Name!!!!"),backgroundColor: Colors.red,));
    }
    else{
    for(int i=0;i<Utilities.reportSelectorCounter;i++)
    {

      String url = Utilities.baseurl + "/TeacherEvalutionV2/api/admin/AddTemplate";
    var payload = 
                        [
                           {
                              "TeacherName":i==0?Utilities.t1:i==1?Utilities.t2:Utilities.t3,
                              "CourseName":i==0?Utilities.c1:i==1?Utilities.c2:Utilities.c3,
                              "SemesterNo":i==0?Utilities.s1:i==1?Utilities.s2:Utilities.s3,
                              "Templatename":Template.text
                          }
    
                        ];

                       var response = await http.post(Uri.parse(url),body: jsonEncode(payload),headers: {"Content-Type": "application/json"});
                       if(response.statusCode == 200){
                        print(response.body);
                           ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Data Saved Successfully!!!!"),backgroundColor: Colors.green,));
                       }
   // }
                       
  }
}
   }
}