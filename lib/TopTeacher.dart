
// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
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

import 'models/bar_chart_model.dart';
import 'models/chart_model_data.dart';
import 'models/navbar.dart';

// ignore: must_be_immutable
class TopTeacherTask extends StatefulWidget {
  TopTeacherTask({Key? key}) : super(key: key);

  @override
  State<TopTeacherTask> createState() => _TopTeacherTask();
}

class _TopTeacherTask extends State<TopTeacherTask> {
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
@override
  void initState() {
    tooltip = TooltipBehavior(enable: true);
  //  Getdata(payload);
    super.initState();
  }
  
var username = TextEditingController();
var password = TextEditingController();
var semester = TextEditingController();
var course = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  CupertinoNavigationBar(
        middle: Text("Get Teacher Performance"),
        backgroundColor: Colors.deepPurple,
        brightness: Brightness.dark,
      ),
        body: MyBackground(
            child: SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [ 
          Row(
            children:[
            MyButton(text: "Show", onTap:()async{
              EasyLoading.show();
              datax=[];
              datay=[];
              dataz=[];
              bool isshowing1=false;
              bool isshowing2=false;
              bool isshowing3=false;
              setState(() {
                
              });
              await Getdata();
            })
            ]),
            Container(
              height: 400,
              width: MediaQuery.of(context).size.width*1,
              child: SfCartesianChart(
              primaryXAxis: CategoryAxis(),
              primaryYAxis:NumericAxis(minimum: 0, maximum: 6, interval: 1),
              tooltipBehavior: tooltip,
              series: <ChartSeries<ReportSeries, String>>[
                ColumnSeries<ReportSeries, String>(
                    dataSource: datax,
                    xValueMapper: (ReportSeries datax, _) => datax.questionDesc.toString(),
                    yValueMapper: (ReportSeries datax, _) => datax.averageMarks,
                    name: t1,
                    color: Color.fromRGBO(8, 142, 255, 1)),
                    ColumnSeries<ReportSeries, String>(
                    dataSource: datay,
                    xValueMapper: (ReportSeries datay, _) => datay.questionDesc.toString(),
                    yValueMapper: (ReportSeries datay, _) => datay.averageMarks,
                    name: t2,
                    color: Color.fromARGB(255, 224, 128, 38)),
                    ColumnSeries<ReportSeries, String>(
                    dataSource: dataz,
                    xValueMapper: (ReportSeries dataz, _) => dataz.questionDesc.toString(),
                    yValueMapper: (ReportSeries dataz, _) => dataz.averageMarks,
                    name: t3,
                    color: Color.fromARGB(255, 15, 211, 25))
              ]), 
            ),
           Container(
            height: 100,
             child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Visibility(
                  visible: isshowing1,
                  child: Row(
                    children: [
                      CircleAvatar(radius: 12,backgroundColor: Color.fromRGBO(8, 142, 255, 1),),
                      SizedBox(width: 5,),
                      Text(Utilities.ratinglist[0].empName)
                    ],
                  ),
                ),
                
                // Visibility(
                //   visible: isshowing2,
                //   child: Row(
                //     children: [
                //       CircleAvatar(radius: 12,backgroundColor: Color.fromARGB(255, 224, 128, 38)), SizedBox(width: 5,),
                //       Text(t2)
                //     ],
                //   ),
                // ),
                // Visibility(
                //   visible: isshowing3,
                //   child: Row(
                //     children: [
                //       CircleAvatar(radius: 12,backgroundColor: Color.fromARGB(255, 15, 211, 25)), SizedBox(width: 5,),
                //       Text(t3)
                //     ],
                //   ),
                // ),
              ],
             ),
           )
          ]),
      ),
    )));
  }

Getdata() async{
EasyLoading.show();
      String url = Utilities.baseurl + "/TeacherEvalutionV2/api/Director/BestTeacher/"+Utilities.ratinglist[0].empNo;
        var response = await http.get(Uri.parse(url));
         if(response.statusCode == 200){
            var result=jsonDecode(response.body.toString());
           if(result.length==0)
           {
           EasyLoading.showToast("No Data");
           }
           else{
                        for(int i=0;i<result.length;i++)
                        {
                          for(int j=0;j<result[i].length;j++)
                          {
                            // print(result[i]);
                            if(result[i]==[])
                          {
                                EasyLoading.showToast("No Record");
                                return;
                          }  
                          else{
                            if(i==0)
                            {
                               datax.add( ReportSeries(questionDesc: result[i][j]["Question_Desc"],averageMarks:result[i][j]["AverageMarks"]));
                            }
                            else if(i==1)
                            {
                              datay.add( ReportSeries(questionDesc: result[i][j]["Question_Desc"],averageMarks:result[i][j]["AverageMarks"]));
                            }
                            else if(i==2)
                            {
                              dataz.add( ReportSeries(questionDesc: result[i][j]["Question_Desc"],averageMarks:result[i][j]["AverageMarks"]));
                            } 
                          }
                          }
                            EasyLoading.dismiss();
                             if(i==0)
                              {
                                isshowing1=true;
                                isshowing2=false; isshowing3=false;
                              }
                              else if(i==1)
                              {
                                isshowing1=true;
                                isshowing2=true;
                                isshowing3=false;
                              }
                              else if(i==2)
                              {
                                isshowing1=true;
                                isshowing2=true;
                                isshowing3=true;
                              }
                            setState(() {});
                        }
                        log(result.toString());
                        setState(() {
                          
                        });
                      }
                       
   }
                       
  }
}