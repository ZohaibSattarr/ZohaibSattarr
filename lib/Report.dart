// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_const_constructors_in_immutables, duplicate_ignore, dead_code, prefer_final_fields, avoid_print, unnecessary_new, sized_box_for_whitespace, unused_local_variable, unused_import, non_constant_identifier_names

import 'dart:convert';
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
                   Navigator.push(context, MaterialPageRoute(builder: (context) => Report()));
                   ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Data Saved Successfully!!!!"),backgroundColor: Colors.green,));
                   EasyLoading.dismiss();

                    // for (int i=0;i<Utilities.reportSelectorCounter;i++) {
                    // //  print( Utilities.selectedCourcesreport.
                     
                    // //  );
                      
                    // }
                    // Utilities.averagelist=await DirectorController().getaverage();
                    // print(Utilities.averagelist.length);
                   // print(Utilities.averagelist);
                   // print(Utilities.averagelist[1][14]['Question_Desc']);
                    
  //   data = [
  //  SubscriberSeries(questionDesc: Utilities.averagelist[0][13]['Question_Desc'], averageMarks: Utilities.averagelist[0][14]['AverageMarks'], barColor: charts.ColorUtil.fromDartColor(Colors.blue))
  // ];
  // for(int i=0;i<Utilities.averagelist.length;i++)
  // {
  //   for(int j=0;j<15;j++)
  //   {
  // data.add(ReportSeries(questionDesc: Utilities.averagelist[i][j]['Question_Desc'], 
  // averageMarks: Utilities.averagelist[i][j]['AverageMarks'], 
  // barColor: charts.ColorUtil.fromDartColor(Colors.blue)));
  // // var data1= [
  // //   new ReportSeries(questionDesc: Utilities.averagelist[i][j]['Question_Desc'],
  // //    averageMarks: Utilities.averagelist[i][j]['AverageMarks'],
  // //     barColor: charts.ColorUtil.fromDartColor(Colors.blue)),
  // // ];
  //   }
  //   print(data.length);
  // }
  setState(() {
    
  });
                   
                   //print(Utilities.coursedropdownvalue+""+Utilities.semesterdropdownvalue+""+Utilities.teacherdropdownvalue);
                    // List<Map<String, String>> payload = [];
                    // for (var i = 0; i < Utilities.reportSelectorCounter; i++) {
                    //   payload.add({});
                    // }
                    // print("Calling API...");
                    
                    // for (var element in Utilities.selectedCourcesreport) {
                    //   payload.insert(element['count'], {
                    //         "Emp_no" : "BIIT179",
                    //         "Course_no": "CS-542",
                    //         "Semester_no": "2015FM"
                    //   });
                    // }
                    // return;
                    // try{
                    //   String url = Utilities.baseurl + "/TeacherEvalutionV2/api/Director/getAverage1";
                    //   List<Map<String, String>> payload = 
                    //     [
                    //       {
                    //         "Emp_no" : "BIIT179",
                    //         "Course_no": "CS-542",
                    //         "Semester_no": "2015FM"
                    //       }
                    //     ];
                      
                    //   //var response = await http.post(Uri.parse(url), body: jsonEncode(payload));
                    //   // print(response.body);
                    //    var response = await Dio().post(url, data: jsonEncode(payload));
                    //   if(response.statusCode==200)
                    //   {
                    //      List<Map<String,dynamic>> res=jsonDecode(response.data.toString());
                    //      print(res);
                    //      for (Map<String,dynamic> element in res) {
                    //        Utilities.averagelist.clear();
                    //        Utilities.averagelist.add(Averagemodel.fromJson(element));
                    //      }
                    //   }
                      
                    //   else{
                    //        print(response.statusCode);
                    //   }
                     
                    // }catch(ex){
                    //   print(ex);
                    // }
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
            //  Visibility(
            //    visible: Utilities.averagelist.isNotEmpty,
            //    child: ReportChart(
            //           data: data,

            //         ),
            //  )
           
    
          ]),
          ),
           
    )));
  }
   AddTmp() async{
      String url = Utilities.baseurl + "/TeacherEvalutionV2/api/admin/addtemplate";
    List<dynamic> payload = 
                        [
                           {
                              "Teacher_name":Utilities.teacherdropdownvalue,
                              "Course_no":Utilities.coursedropdownvalue,
                              "Semester":Utilities.semesterdropdownvalue,
                              "Template_name":Template.text
                          }
                          // {
                          //     "Teacher_name":"Adil",
                          //     "Course_no":"AI",
                          //     "Semester":"2021FM",
                          //     "Template_name":"Adil_Ai"
                          // },
                          // {
                          //     "Teacher_name":"Aiman",
                          //     "Course_no":"NOS",
                          //     "Semester":"2020FM",
                          //     "Template_name":"Aiman_OP"
                          // },
                        ];

                       var response = await http.post(Uri.parse(url),body: payload);
                       if(response.statusCode == 200){
                          print("Done..........");
                       }
                       
  }
}













// class SimpleBarChart extends StatelessWidget {
//   final List<charts.Series<dynamic,String>> seriesList;
//   final bool animate;

//   const SimpleBarChart(this.seriesList, {required this.animate});

//   /// Creates a [BarChart] with sample data and no transition.
//   factory SimpleBarChart.withSampleData() {
//     return SimpleBarChart(
//       _createSampleData(),
//       // Disable animations for image tests.
//       animate: false,
//     );
//   }


//   @override
//   Widget build(BuildContext context) {
//     // ignore: unnecessary_new
//     return new charts.BarChart(
//       seriesList,
//       animate: animate,
//     );
//   }

//   /// Create one series with sample hard coded data.
//   static List<charts.Series<OrdinalSales, String>> _createSampleData() {
//     final data = [
//       OrdinalSales('2014', 5),
//       OrdinalSales('2015', 25),
//       OrdinalSales('2016', 100),
//       OrdinalSales('2017', 75),
//     ];

//     return [
//       charts.Series<OrdinalSales, String>(
//         id: 'Sales',
//         colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
//         domainFn: (OrdinalSales sales, _) => sales.year,
//         measureFn: (OrdinalSales sales, _) => sales.sales,
//         data: data,
//       )
//     ];
//   }
// }

// /// Sample ordinal data type.
// class OrdinalSales {
//   final String year;
//   final int sales;

//   OrdinalSales(this.year, this.sales);
// }