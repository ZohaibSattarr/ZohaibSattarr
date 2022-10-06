// import 'package:flutter/cupertino.dart';
// ignore_for_file: prefer_const_constructors, avoid_print, unused_import, prefer_const_constructors_in_immutables

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
class TemplateTask extends StatefulWidget {
  TemplateTask({Key? key}) : super(key: key);

  @override
  State<TemplateTask> createState() => _TemplateTask();
}

class _TemplateTask extends State<TemplateTask> {
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
        middle: Text("Director Dasboard"),
        backgroundColor: Colors.deepPurple,
        brightness: Brightness.dark,
      ),
        body: MyBackground(
            child: SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [ 
            Row(
            mainAxisAlignment:MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: 100,
              ),
              Text("Choose Template :",
              style: TextStyle( fontSize: 20, letterSpacing: .3)),
              Container(
        margin: EdgeInsets.only(top: 5, bottom: 5),
          width: 120,
          padding: EdgeInsets.only(top: 1, bottom: 1,left: 1),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white),
            borderRadius: BorderRadius.circular(12),
          ),
        child:  DropdownButton<String>(
          value: Utilities.templatedropdownvalue,
            isExpanded: true,
          icon:  Icon(Icons.arrow_drop_down),
          //elevation: 40,
          style:  TextStyle(color: Colors.deepPurple,fontSize:20),
          underline: Container(
            height: 2,
            color: Colors.grey[300],
          ),
             onChanged: (String? newValue) {
              
            setState(() {
              Utilities.templatedropdownvalue = newValue!;
             // print(dropdownValue);
            }
            );
             },
            items: Utilities.TemplateList.map((data) {
                return DropdownMenuItem<String>(
                  value:data.templatename,
                  child: Text(
                    data.templatename,
                     style: TextStyle(color: Colors.deepPurpleAccent),
                  ),
                );
              }).toList(),
          ),
          ),
              const SizedBox(
                height: 20,
              ),
              
            ],
          ),
          // Container(
          //   height: 100,
          //   child: ListView.builder(
          //     itemCount: Utilities.TemplateList.length,
          //     itemBuilder: (BuildContext context, int index) {
          //       return InkWell(
          //         onTap: () async {
          //           body=[
          //             {
          //                "Emp_no" : Utilities.TemplateList[index].teacherName,
          //               "Course_no": Utilities.TemplateList[index].courseName,
          //               "Semester_no": Utilities.TemplateList[index].semesterNo
          //             }         
          //           ];
          //           showAlertDialog(context);
          //         },
          //         child: Padding(
          //           padding: const EdgeInsets.all(12.0),
          //           child: Container(
          //             decoration: BoxDecoration( color: Colors.green,borderRadius: BorderRadius.circular(20)),
          //             height: 36,     
          //             child: Center(child: Text(Utilities.TemplateList[index].templatename),),
          //           ),
          //         ),
          //       ); }),
          // ),
          SizedBox(
            height: 50,
          ),
          MyButton(text: "Update", onTap: (){
            showAlertDialog(context);
          }),
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
           await gettemplateby();
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
                      Text(t1)
                    ],
                  ),
                ),
                
                Visibility(
                  visible: isshowing2,
                  child: Row(
                    children: [
                      CircleAvatar(radius: 12,backgroundColor: Color.fromARGB(255, 224, 128, 38)), SizedBox(width: 5,),
                      Text(t2)
                    ],
                  ),
                ),
                Visibility(
                  visible: isshowing3,
                  child: Row(
                    children: [
                      CircleAvatar(radius: 12,backgroundColor: Color.fromARGB(255, 15, 211, 25)), SizedBox(width: 5,),
                      Text(t3)
                    ],
                  ),
                ),
              ],
             ),
           )
          ]),
      ),
    )));
  }

Getdata(List body) async{
  print(body);
EasyLoading.show();
      String url = Utilities.baseurl + "/TeacherEvalutionV2/api/Director/getAverage1";
        var response = await http.post(Uri.parse(url),body:jsonEncode(body),headers: {"Content-Type": "application/json"});
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
  showAlertDialog(BuildContext context) {

  // set up the buttons
  Widget cancelButton = TextButton(
    child: Text("Update Semester"),
    onPressed:  () {
      Navigator.pop(context);
      UpdateSemester(context);
      
    },
  );
  Widget continueButton = TextButton(
    child: Text("Update Course"),
    onPressed:  (){
 Navigator.pop(context);
 UpdateCourse(context);
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    content: Text("What Do you Want to Update ?"),
    actions: [
      cancelButton,
      continueButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
UpdateSemester(BuildContext context) {

  // set up the buttons
  Widget cancelButton = TextButton(
    child: Text("Update"),
    onPressed:  () {
      updatesem();
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Semester Updated"),backgroundColor: Colors.green,));
          Navigator.pop(context);
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    content: MyInputField(controller: semester, hint: "Enter Semester"),
    actions: [
      cancelButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
UpdateCourse(BuildContext context) {

  // set up the buttons
  Widget cancelButton = TextButton(
    child: Text("Update"),
    onPressed:  () {
      updatecors();
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Course Updated"),backgroundColor: Colors.green,));
          Navigator.pop(context);
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    content: MyInputField(controller: course, hint: "Enter Course"),
    actions: [
      cancelButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
 
    gettemplateby() async {
      List<TemplateModel> template=[];
       var request = await http.get(Uri.parse(Utilities.baseurl+"/TeacherEvalutionV2/api/Admin/gettemplatebyname/"+ Utilities.templatedropdownvalue));
    print('sending request...');
    if (request.statusCode == 200) {
      var data=jsonDecode(request.body.toString());
      print(data);
      for (var i in data) {
        template.add(TemplateModel.fromJson(i));
      }
      if(template.length==1)
      {
        body=[
          {
             "Emp_no" : template[0].teacherName.toString(),
                      "Course_no": template[0].courseName.toString(),
                      "Semester_no": template[0].semesterNo.toString()
          }
        ];
        t1=template[0].teacherName.toString()+" "+template[0].courseName.toString()+" "+template[0].semesterNo.toString();
      }
     else if(template.length==2)
      {
        body=[
          {
             "Emp_no" : template[0].teacherName.toString(),
                      "Course_no": template[0].courseName.toString(),
                      "Semester_no": template[0].semesterNo.toString()
          },
          {
             "Emp_no" : template[1].teacherName.toString(),
                      "Course_no": template[1].courseName.toString(),
                      "Semester_no": template[1].semesterNo.toString()
          }
        ];
        t1=template[0].teacherName.toString()+" "+template[0].courseName.toString()+" "+template[0].semesterNo.toString();
        t2=template[1].teacherName.toString()+" "+template[1].courseName.toString()+" "+template[1].semesterNo.toString();
      }
     else if(template.length==3)
      {
        body=[
          {
             "Emp_no" : template[0].teacherName.toString(),
                      "Course_no": template[0].courseName.toString(),
                      "Semester_no": template[0].semesterNo.toString()
          },
          {
             "Emp_no" : template[1].teacherName.toString(),
                      "Course_no": template[1].courseName.toString(),
                      "Semester_no": template[1].semesterNo.toString()
          },
          {
             "Emp_no" : template[2].teacherName.toString(),
                      "Course_no": template[2].courseName.toString(),
                      "Semester_no": template[2].semesterNo.toString()
          }
        ];
        t1=template[0].teacherName.toString()+" "+template[0].courseName.toString()+" "+template[0].semesterNo.toString();
        t2=template[1].teacherName.toString()+" "+template[1].courseName.toString()+" "+template[1].semesterNo.toString();
         t3=template[2].teacherName.toString()+" "+template[2].courseName.toString()+" "+template[2].semesterNo.toString();
      }
      else{

      }
      print('OK Call');
      EasyLoading.dismiss();
   await Getdata(body);
    } else {
      EasyLoading.dismiss();
      }
  } 
  updatesem() async {

  final uri = Uri.parse(Utilities.baseurl+'/TeacherEvalutionV2/api/admin/updatesemester');
  final headers = {'Content-Type': 'application/json'};
  Map<String, dynamic> body = {'TemplateName': Utilities.templatedropdownvalue.toString(), 'SemesterNo':semester.text};
  String jsonBody = json.encode(body);
  final encoding = Encoding.getByName('utf-8');

  http.Response response = await post(
    uri,
    headers: headers,
    body: jsonBody,
    encoding: encoding,
  );

  int statusCode = response.statusCode;
  String responseBody = response.body;
  //print(responseBody);
  EasyLoading.dismiss();
}
 updatecors() async {

  final uri = Uri.parse(Utilities.baseurl+'/TeacherEvalutionV2/api/admin/updatecourse');
  final headers = {'Content-Type': 'application/json'};
  Map<String, dynamic> body = {'TemplateName': Utilities.templatedropdownvalue.toString(), 'CourseName':course.text};
  String jsonBody = json.encode(body);
  final encoding = Encoding.getByName('utf-8');

  http.Response response = await post(
    uri,
    headers: headers,
    body: jsonBody,
    encoding: encoding,
  );

  int statusCode = response.statusCode;
  String responseBody = response.body;
  print(responseBody);
  EasyLoading.dismiss();
}
}
