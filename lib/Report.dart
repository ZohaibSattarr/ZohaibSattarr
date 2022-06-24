// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_const_constructors_in_immutables, duplicate_ignore, dead_code, prefer_final_fields

import 'dart:convert';

import 'package:charts_flutter/flutter.dart' as charts;
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:teacherevaluation/controllers/Utilities.dart';
import 'package:teacherevaluation/controllers/widgets.dart';
import 'package:http/http.dart' as http;
import 'models/bar_chart_model.dart';

class Report extends StatefulWidget {
  Report({Key? key}) : super(key: key);

  @override
  State<Report> createState() => _Report();
}

class _Report extends State<Report> {
   final List<SubscriberSeries> data = [
    SubscriberSeries(
      year: "2008",
      subscribers: 10000000,
      barColor: charts.ColorUtil.fromDartColor(Colors.blue),
    ),
    SubscriberSeries(
      year: "2009",
      subscribers: 11000000,
      barColor: charts.ColorUtil.fromDartColor(Colors.blue),
    ),
    SubscriberSeries(
      year: "2010",
      subscribers: 12000000,
      barColor: charts.ColorUtil.fromDartColor(Colors.blue),
    ),
    SubscriberSeries(
      year: "2011",
      subscribers: 10000000,
      barColor: charts.ColorUtil.fromDartColor(Colors.blue),
    ),
    SubscriberSeries(
      year: "2012",
      subscribers: 8500000,
      barColor: charts.ColorUtil.fromDartColor(Colors.blue),
    ),
    SubscriberSeries(
      year: "2013",
      subscribers: 7700000,
      barColor: charts.ColorUtil.fromDartColor(Colors.blue),
    ),
    SubscriberSeries(
      year: "2014",
      subscribers: 7600000,
      barColor: charts.ColorUtil.fromDartColor(Colors.blue),
    ),
    SubscriberSeries(
      year: "2015",
      subscribers: 5500000,
      barColor: charts.ColorUtil.fromDartColor(Colors.blue),
    ),
  ];
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


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ignore: prefer_const_constructors
      appBar:  CupertinoNavigationBar(
        middle: Text("Report"),
        backgroundColor: Colors.deepPurple,
        brightness: Brightness.dark,
      ),
        body: MyBackground(
            child: SafeArea(
      child: SingleChildScrollView(
        child: Column(
          
          children: [
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
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // ignore: deprecated_member_use
                RaisedButton(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)), 
                
                  child: Text('Get Performance') ,
                  color: Colors.deepPurple,
                  splashColor: Colors.red,
                  padding: EdgeInsets.symmetric(vertical: 15.0),
                  onPressed: () async {
                    print(Utilities.coursedropdownvalue+""+Utilities.semesterdropdownvalue+""+Utilities.teacherdropdownvalue);
                    List<Map<String, String>> payload = [];
                    for (var i = 0; i < Utilities.reportSelectorCounter; i++) {
                      payload.add({});
                    }
                    print("Calling API...");
                    
                    for (var element in Utilities.selectedCourcesreport) {
                      payload.insert(element['count'], {
                        
                      });
                    }
                    return;
                    try{
                      String url = Utilities.baseurl + "/TeacherEvalutionV2/api/Director/getAverage1";
                      List<Map<String, String>> payload = 
                        [
                          {
                            "Emp_no" : "BIIT179",
                            "Course_no": "CS-542",
                            "Semester_no": "2015FM"
                          }
                        ];
                      
                      // var response = await http.post(Uri.parse(url), body: jsonEncode(payload));
                      // print(response.body);
                      var response = await Dio().post(url, data: jsonEncode(payload));
                      //print(response.data);
                    }catch(ex){
                      print(ex);
                    }
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
            SubscriberChart(
                    data: data,
                  )
           
    
          ]),
          ),
           
    )));
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