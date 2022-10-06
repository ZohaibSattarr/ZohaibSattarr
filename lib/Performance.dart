// ignore_for_file: prefer_const_constructors, unused_import, prefer_const_constructors_in_immutables, prefer_is_empty, unnecessary_new, sized_box_for_whitespace

import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:teacherevaluation/Admin.dart';
import 'package:teacherevaluation/controllers/AdminController.dart';
import 'package:teacherevaluation/controllers/DirectorController.dart';
import 'package:teacherevaluation/controllers/Utilities.dart';
import 'package:teacherevaluation/controllers/widgets.dart';
import 'package:teacherevaluation/evaluation.dart';
import 'package:teacherevaluation/models/Performancemodel.dart';
import 'package:teacherevaluation/models/questionmodel.dart';

import 'models/bar_chart_model.dart';
import 'models/navbar.dart';

// ignore: must_be_immutable
class PerformanceTask extends StatefulWidget {
  PerformanceTask({Key? key}) : super(key: key);

  @override
  State<PerformanceTask> createState() => _PerformanceTask();
}

class _PerformanceTask extends State<PerformanceTask> {
bool isshowing1=false;
  bool isshowing2=false;
  bool isshowing3=false;
  String t1="";
  String t2="";
  String t3="";
  var body=[];
    List<ReportSeries> datax=[];
    var abc;
    List<ReportSeries> datay=[];
    List<ReportSeries> dataz=[];
   TooltipBehavior tooltip=TooltipBehavior(enable: false);
// var password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  CupertinoNavigationBar(
        middle: Text("Teacher Performance"),
        backgroundColor: Colors.deepPurple,
        brightness: Brightness.dark,
      ),
        body: MyBackground(
            child: SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            
            SizedBox(
              height: 100,
              ),
    //           Text("Choose Question No :",
    //           style: TextStyle( fontSize: 30, letterSpacing: .3)),
    //           Container(
    //   //margin: EdgeInsets.only(top: 5, bottom: 5),
    //     width: Utilities.getSize(context).width * 0.9,
    //     padding: EdgeInsets.only(top: 1, bottom: 1,left: 10),
    //     decoration: BoxDecoration(
    //       border: Border.all(color: Colors.white),
    //       borderRadius: BorderRadius.circular(12),
    //     ),
    //   child: DropdownButton<int>(
    //     hint: Text("Pick"),
    //     isExpanded: true,
    //     value: Utilities.questiondropdownvalue,
    //     items: <int>[1, 2, 3, 4, 5, 6, 7, 8, 9, 10,11,12,13,14,15].map((int value) {
    //       // ignore: unnecessary_new
    //       return new DropdownMenuItem<int>(
    //         value: value,
    //         child: new Text(value.toString()),
    //       );
    //     }).toList(),
    //     onChanged: (newVal) {
    //       setState(() {
    //         Utilities.questiondropdownvalue = newVal!;
    //       });
    //     }),
    // ),
            MyButton(text: "Show List",fontWeight: FontWeight.bold, onTap: () async {
             await ratting(); 
             setState(() {
               
             }); 
               
                  }
              
              
               ),
               Container(
            height: 500,
            child: ListView.builder(

          itemCount: Utilities.ratinglist.length,

          itemBuilder: (BuildContext context, int index) {

            return ListTile(

                leading: const Icon(Icons.list),

                trailing:  Text(

                  Utilities.ratinglist[index].rating.toString(),

                  style: TextStyle(color: Colors.green, fontSize: 15),

                ),

                title: Text(Utilities.ratinglist[index].empName));

          }),
      ),
      ]),
      ),
      
            
  )));}
  Future<List<Performancemodel>> ratting() async {
    
    final response = await http.get(
        Uri.parse(Utilities.baseurl + '/TeacherEvalutionV2/api/Director/getTopTeacher'));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      Utilities.ratinglist.clear();
      print(data);
      for (Map<String, dynamic> i in data) {
        Utilities.ratinglist.add(Performancemodel.fromJson(i));
      }
      EasyLoading.dismiss();
      print(Utilities.ratinglist);
      return Utilities.ratinglist;
      
    } else {
      EasyLoading.dismiss();
      return Utilities.ratinglist;
    }
  }
  
}