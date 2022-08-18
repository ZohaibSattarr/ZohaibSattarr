// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_this, dead_code, avoid_unnecessary_containers, camel_case_types, unnecessary_import, unused_label, override_on_non_overriding_member, sized_box_for_whitespace, annotate_overrides, unnecessary_string_interpolations, avoid_print

import 'dart:convert';

import 'package:custom_radio_grouped_button/custom_radio_grouped_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart';
import 'package:teacherevaluation/View_Course.dart';

import 'package:teacherevaluation/controllers/widgets.dart';
import 'package:teacherevaluation/models/courses.dart';
import 'package:teacherevaluation/models/questionmodel.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';

import 'controllers/Utilities.dart';

class TeacherEvaluation extends StatefulWidget {
  Courses course;
  TeacherEvaluation({ Key? key, required this.course}) : super(key: key);

  @override
  State<TeacherEvaluation> createState() => _TeacherEvaluationState();
}
enum EvaluationAns {excellent, average,belowAverage,good,poor}
class _TeacherEvaluationState extends State<TeacherEvaluation> {
    EvaluationAns? _value = EvaluationAns.excellent;
  //   Map<int,String> selectedValues= new Map<int,String>();
  @override
  void initState(){
    // print("jdsjshdkjshslkansk"+Utilities.val.toString());
    super.initState();
  }


    final TextStyle dropdownmenuitem =
      TextStyle(color: Colors.black, fontSize: 19);
  final primary = Color.fromARGB(255, 71, 153, 207);
  final secondary = Color(0xfff29a94);
    bool valuefirst = false;  
  bool valuesecond = false;  
  bool valuethird=false;


 
  Future<List<Questionmodel>> getallquestions() async {
    final response = await http.get(
        Uri.parse(Utilities.baseurl+'/TeacherEvalutionV2/api/student/GetQuestions'));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {

      Utilities.questionlist.clear();
      for (Map<String, dynamic> i in data) {
        Utilities.questionlist.add(Questionmodel.fromJson(i));
        options.add("0");
      }
      print(Utilities.questionlist.length);
      
      return Utilities.questionlist;
      
    } else {
      return Utilities.questionlist;
    }
  }

  List<String> options = [];

  @override
  // void initState() {
  //   super.initState();
  // }
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff0f0f0),
      body: SingleChildScrollView(
        child: MyBackground(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: FutureBuilder(
                future: getallquestions(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                      child: CircularProgressIndicator(
                        color: Colors.blueAccent,
                        backgroundColor: Colors.grey,
                        value: 0.8,
                      ),
                    );
                  } else {
                    return Stack(
                      children: [
                        Container(
                          padding: EdgeInsets.only(bottom: 60,top: 225),
                          height: MediaQuery.of(context).size.height,
                          width: double.infinity,
                          child: ListView.builder(
                              itemCount: Utilities.questionlist.length,
                              itemBuilder: (BuildContext context, int index) {
                                return buildList(context, index);
    //                             return Container(
    //   decoration: BoxDecoration(
    //     borderRadius: BorderRadius.circular(25),
    //     color: Colors.white,
    //   ),
    //   width: double.infinity,
    //   //height: 400,
    //   margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
    //   padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
    //   child: InkWell(
    //     onTap: () {
    //     },
    //     child: Row(
    //       crossAxisAlignment: CrossAxisAlignment.start,
    //       children: <Widget>[
    //         Expanded(
    //           child: Padding(
    //             padding: const EdgeInsets.only(left:12.0,top: 10.0),
    //             child: Column(
    //               crossAxisAlignment: CrossAxisAlignment.start,
    //               children: <Widget>[
    //                 Text(
    //                   Utilities.questionlist[index].question1,
    //                   style: TextStyle(
    //                       color: primary,
    //                       fontWeight: FontWeight.bold,
    //                       fontSize: 18),
    //                 ),
    //                 SizedBox(
    //                   height: 6,
    //                 ),
    //                 Container(
    //                   child: Column(
    //                     crossAxisAlignment: CrossAxisAlignment.center,
    //                     children: [
    //                       InkWell(
    //                         onTap: () {
    //                           options[index+1] = "Excellent";
    //                           setState(() {
                                
    //                           });
    //                         },
    //                         child: Container(
    //                           padding: const EdgeInsets.symmetric(vertical: 8),
    //                           margin: const EdgeInsets.symmetric(vertical: 8),
    //                           decoration: BoxDecoration(
    //                             color : options[index+1] != "Excellent" ? Colors.white : Colors.blue,
    //                             border: Border.all(
    //                               color: Colors.blue
    //                             )
    //                           ),
    //                           alignment: Alignment.center,
    //                           child: Text('Excellent', style: TextStyle(
    //                             color: options[index+1] != "Excellent" ? Colors.black : Colors.white,
    //                           ),),
    //                         ),
    //                       ),
    //                       InkWell(
    //                         onTap: () {
    //                           options[index+1] = "Average";
    //                           setState(() {
                                
    //                           });
    //                         },
    //                         child: Container(
    //                           padding: const EdgeInsets.symmetric(vertical: 8),
    //                           margin: const EdgeInsets.symmetric(vertical: 8),
    //                           decoration: BoxDecoration(
    //                             color : options[index+1] != "Average" ? Colors.white : Colors.blue,
    //                             border: Border.all(
    //                               color: Colors.blue
    //                             )
    //                           ),
    //                           alignment: Alignment.center,
    //                           child: Text('Average', style: TextStyle(
    //                             color: options[index+1] != "Average" ? Colors.black : Colors.white,
    //                           ),),
    //                         ),
    //                       ),
    //                       InkWell(
    //                         onTap: () {
    //                           options[index+1] = "Below Average";
    //                           setState(() {
                                
    //                           });
    //                         },
    //                         child: Container(
    //                           padding: const EdgeInsets.symmetric(vertical: 8),
    //                           margin: const EdgeInsets.symmetric(vertical: 8),
    //                           decoration: BoxDecoration(
    //                             color : options[index+1] != "Below Average" ? Colors.white : Colors.blue,
    //                             border: Border.all(
    //                               color: Colors.blue
    //                             )
    //                           ),
    //                           alignment: Alignment.center,
    //                           child: Text('Below Average', style: TextStyle(
    //                             color: options[index+1] != "Below Average" ? Colors.black : Colors.white,
    //                           ),),
    //                         ),
    //                       ),
    //                       InkWell(
    //                         onTap: () {
    //                           options[index+1] = "Good";
    //                           setState(() {
                                
    //                           });
    //                         },
    //                         child: Container(
    //                           padding: const EdgeInsets.symmetric(vertical: 8),
    //                           margin: const EdgeInsets.symmetric(vertical: 8),
    //                           decoration: BoxDecoration(
    //                             color : options[index+1] != "Good" ? Colors.white : Colors.blue,
    //                             border: Border.all(
    //                               color: Colors.blue
    //                             )
    //                           ),
    //                           alignment: Alignment.center,
    //                           child: Text('Good', style: TextStyle(
    //                             color: options[index+1] != "Good" ? Colors.black : Colors.white,
    //                           ),),
    //                         ),
    //                       ),
    //                       InkWell(
    //                         onTap: () {
    //                           options[index+1] = "Poor";
    //                           setState(() {
                                
    //                           });
    //                         },
    //                         child: Container(
    //                           padding: const EdgeInsets.symmetric(vertical: 8),
    //                           margin: const EdgeInsets.symmetric(vertical: 8),
    //                           decoration: BoxDecoration(
    //                             color : options[index+1] != "Poor" ? Colors.white : Colors.blue,
    //                             border: Border.all(
    //                               color: Colors.blue
    //                             )
    //                           ),
    //                           alignment: Alignment.center,
    //                           child: Text('Poor', style: TextStyle(
    //                             color: options[index+1] != "Poor" ? Colors.black : Colors.white,
    //                           ),),
    //                         ),
    //                       )
    //                     ],
    //                   ),
    //                 )
       
    //             ],
    //            ),
    //           ), 
    //         )
    //       ],
    //     ),  
    //   ),
    // );
                              }),
                        ),
                        Container(
                          height: 240,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: primary,
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(30),
                                  bottomRight: Radius.circular(30))),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: SafeArea(
                              child: Column(
                                children: <Widget>[
                                 
                                  SizedBox(height: 10,),
                                  Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Student Name:",style: TextStyle(
                                            color: Colors.white, fontSize: 24),),
                                      Text("${Utilities.navbarlist[0].stFirstname.toString()}"+" ${Utilities.navbarlist[0].stMiddlename.toString()}"+" ${Utilities.navbarlist[0].stLastname.toString()}",
                                       style: TextStyle(
                                            color: Colors.white, fontSize: 24),)
                                     ],
                                  ),
                                  SizedBox(height: 10,),
                                  // IconButton(
                                  //   onPressed: () {
                                  //     Navigator.pop(context);
                                  //   },
                                  //   icon: Icon(
                                  //     Icons.arrow_back_ios_new,
                                  //     color: Colors.white,
                                  //   ),
                                  // ),
                                  Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Reg No:",style: TextStyle(
                                            color: Colors.white, fontSize: 24)),
                                      Text(
                                        Utilities.navbarlist[0].regNo.toUpperCase(),
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 24),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 10,),
                                  Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Section:",style: TextStyle(
                                            color: Colors.white, fontSize: 24),),
                                      Text(
                                        Utilities.navbarlist[0].section.toUpperCase(),
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 24),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 10,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [

                                      Text("Semester No:",style: TextStyle(
                                            color: Colors.white, fontSize: 24),),
                                      Text(
                                        Utilities.navbarlist[0].semesterNo.toUpperCase(),
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 24),
                                      ),
                                    ],
                                  ),
                                   SizedBox(height: 20,),
                                   Center(
                                     child: Text("${Utilities.teachername.toString()}",
                                      style: TextStyle(
                                           color: Colors.white, fontSize: 24),),
                                   ),
                                  // IconButton(
                                  //   onPressed: () {},
                                  //   icon: Icon(
                                  //     Icons.filter_list,
                                  //     color: Colors.white,
                                  //   ),
                                  // ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Container(
                          child: Column(
                            children: <Widget>[
                              SizedBox(
                                height: 724,
                              ),
                              MyButton(text: "Save",fontWeight: FontWeight.bold, onTap: () async {

                                EasyLoading.show();
                                int j=0;
                                try{
                                  //String url = Utilities.baseurl + "/TeacherEvalutionV2/api/student/addStdEvaluation?op1="+widget.course.emp_no.toString()+"&op2="+Utilities.regno.toString()+"&op3="+widget.course.courseNo.toString()+"&op4="+Utilities.navbarlist[0].discipline.toString()+"&op5="+Utilities.semester+"&op6="+j.toString()+"&op7=good"+"&op8=5"+"";
                                    for(;j<=15;j++)
                                    {
                                      String no=options[j] == "Excellent" ? '5' : options[j] == "Good" ? '4' : options[j] == "Average" ? '3' : options[j] == "Below Average" ? '2' : options[j] == "Poor" ? '1' : '0';
                                       String url = Utilities.baseurl + "/TeacherEvalutionV2/api/student/addStdEvaluation?op1="+widget.course.emp_no.toString()+"&op2="+Utilities.regno.toString()+"&op3="+widget.course.courseNo.toString()+"&op4="+Utilities.navbarlist[0].discipline.toString()+"&op5="+Utilities.semester.toString()+"&op6="+j.toString()+"&op7="+options[j].toString()+"&op8="+no.toString()+"";
                                  //   var payload = {
                                  //   'Emp_no' : widget.course.emp_no.toString(),
                                  //   'Reg_No' : Utilities.regno.toString(),
                                  //   'Course_no' : widget.course.courseNo.toString(),
                                  //   'Discipline' : Utilities.navbarlist[0].discipline.toString(),
                                  //   'Semester_no' : Utilities.navbarlist[0].semesterNo.toString(),
                                  //   'Question_Desc' : i.toString(),
                                  //   'Answer_Desc' : options[i].toString(),
                                  //   'Answer_Marks' : options[i] == "Excellent" ? '5' : options[i] == "Good" ? '4' : options[i] == "Average" ? '3' : options[i] == "Below Average" ? '2' : options[i] == "Poor" ? '1' : '0'
                                  // };
                                  
                                  //var response = await Dio().post(url, data: payload, options: Options(headers: {'Accept': "application/json"}));
                                  var response = await http.post(Uri.parse(url),
                                   //body: payload
                                   );
                                  print(response.body);
                                  print(response.statusCode);
                                  //  print(response.statusCode);
                                  //  print(response.data);
                                  if(response.statusCode == 200){
                                      print("Done..........");
                                      if(Utilities.val==1){
                                      Utilities.flag1=true;
                                      }
                                  }
                                    }
                                    
                                      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Center(child: Text("${Utilities.teachername.toString()} Evaluated Successfully!",textAlign: TextAlign.center, style: TextStyle(fontSize: 16.0, fontWeight: 
     FontWeight.bold),)),duration: Duration(seconds: 3),backgroundColor: Colors.green,));
                                     Navigator.push(context, MaterialPageRoute(builder: (context) => ViewCourses()));
                                    EasyLoading.dismiss();
                                  

                                  // var payload = {
                                  //   'Emp_no' : widget.course.emp_no.toString(),
                                  //   'Reg_No' : Utilities.regno.toString(),
                                  //   'Course_no' : widget.course.courseNo.toString(),
                                  //   'Discipline' : Utilities.navbarlist[0].discipline.toString(),
                                  //   'Semester_no' : Utilities.navbarlist[0].semesterNo.toString(),
                                  //   'Question_Desc' : "1",
                                  //   'Answer_Desc' : "Average",
                                  //   'Answer_Marks' : "2"
                                  // };
                                  // //var response = await Dio().post(url, data: payload, options: Options(headers: {'Accept': "application/json"}));
                                  // var response = await http.post(Uri.parse(url), body: payload, headers: {
                                  //   'Access-Control-Allow-Origin' : "*",
                                  //   'Accept': 'application/json'
                                  // });
                                  // print(response.body);
                                  // print(response.statusCode);
                                  // //  print(response.statusCode);
                                  // //  print(response.data);
                                  // if(response.statusCode == 200){}
                                }catch(ex){print(ex);}
                                // EasyLoading.show();
                                // evalpost();
                              }),
                            ],
                          ),
                        ),
                      ],
                    );
                  }
                }),
          ),
        ),
      ),
    );
  }

 Widget buildList(BuildContext context, int index) {
   return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: Colors.white,
      ),
      width: double.infinity,
      //height: 400,
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: InkWell(
        onTap: () {
        },
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left:12.0,top: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      Utilities.questionlist[index].question1,
                      style: TextStyle(
                          color: primary,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {
                              options[index] = "Excellent";
                              setState(() {
                                
                              });
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              margin: const EdgeInsets.symmetric(vertical: 8),
                              decoration: BoxDecoration(
                                color : options[index] != "Excellent" ? Colors.white : Colors.blue,
                                border: Border.all(
                                  color: Colors.blue
                                )
                              ),
                              alignment: Alignment.center,
                              child: Text('Excellent', style: TextStyle(
                                color: options[index] != "Excellent" ? Colors.black : Colors.white,
                              ),),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              options[index] = "Average";
                              setState(() {
                                
                              });
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              margin: const EdgeInsets.symmetric(vertical: 8),
                              decoration: BoxDecoration(
                                color : options[index] != "Average" ? Colors.white : Colors.blue,
                                border: Border.all(
                                  color: Colors.blue
                                )
                              ),
                              alignment: Alignment.center,
                              child: Text('Average', style: TextStyle(
                                color: options[index] != "Average" ? Colors.black : Colors.white,
                              ),),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              options[index] = "Below Average";
                              setState(() {
                                
                              });
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              margin: const EdgeInsets.symmetric(vertical: 8),
                              decoration: BoxDecoration(
                                color : options[index] != "Below Average" ? Colors.white : Colors.blue,
                                border: Border.all(
                                  color: Colors.blue
                                )
                              ),
                              alignment: Alignment.center,
                              child: Text('Below Average', style: TextStyle(
                                color: options[index] != "Below Average" ? Colors.black : Colors.white,
                              ),),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              options[index] = "Good";
                              setState(() {
                                
                              });
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              margin: const EdgeInsets.symmetric(vertical: 8),
                              decoration: BoxDecoration(
                                color : options[index] != "Good" ? Colors.white : Colors.blue,
                                border: Border.all(
                                  color: Colors.blue
                                )
                              ),
                              alignment: Alignment.center,
                              child: Text('Good', style: TextStyle(
                                color: options[index] != "Good" ? Colors.black : Colors.white,
                              ),),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              options[index] = "Poor";
                              setState(() {
                                
                              });
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              margin: const EdgeInsets.symmetric(vertical: 8),
                              decoration: BoxDecoration(
                                color : options[index] != "Poor" ? Colors.white : Colors.blue,
                                border: Border.all(
                                  color: Colors.blue
                                )
                              ),
                              alignment: Alignment.center,
                              child: Text('Poor', style: TextStyle(
                                color: options[index] != "Poor" ? Colors.black : Colors.white,
                              ),),
                            ),
                          )
                        ],
                      ),
                    )
       
                ],
               ),
              ), 
            )
          ],
        ),  
      ),
    );
//     return Container(
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(25),
//         color: Colors.white,
//       ),
//       width: double.infinity,
//       height: 400,
//       margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
//       padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
//       child: InkWell(
//         onTap: () {
//         },
//         child: Row(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             Expanded(
//               child: Padding(
//                 padding: const EdgeInsets.only(left:12.0,top: 10.0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: <Widget>[
//                     Text(
//                       Utilities.questionlist[index].question1,
//                       style: TextStyle(
//                           color: primary,
//                           fontWeight: FontWeight.bold,
//                           fontSize: 18),
//                     ),
//                     SizedBox(
//                       height: 6,
//                     ),
//                     CustomRadioButton(
//                              buttonLables: [
//                                     "Excellent",
//                                     "Average",
//                                     "Below Average",
//                                     "Good",
//                                     "Poor",
//                                      ],
//                              buttonValues: [
//                                     "Excellent",
//                                     "Average",
//                                     "Below Average",
//                                     "Good",
//                                     "Poor",
//                                      ],
//                              radioButtonValue: (value) {
                               
//                              },
//                              horizontal: true,
//                              selectedColor: Theme.of(context).colorScheme.secondary, unSelectedColor: Colors.white,
//     ),
//         // ListTile(  
//         //   title: const Text('Excellent'),  
//         //   leading: Radio<EvaluationAns>(  
//         //     value: EvaluationAns.excellent,  
//         //     groupValue: _value, 
//         //     onChanged: (EvaluationAns? value) {
//         //       setState(() {
//         //         _value=value;
//         //         Utilities.radiovalue=value.toString();
                
//         //       });
//         //       },   
//         //   ),  
//         // ),  
//         // ListTile(  
//         //   title: const Text('Average'),  
//         //   leading: Radio<EvaluationAns>(  
//         //     value: EvaluationAns.average,  
//         //     groupValue: _value, 
//         //     onChanged: (EvaluationAns? value) {
//         //       setState(() {
//         //         _value=value;
//         //         Utilities.radiovalue=value.toString();
                
//         //       });
//         //       },   
//         //   ),  
//         // ),   
//         // ListTile(  
//         //   title: const Text('Below Average'),  
//         //   leading: Radio<EvaluationAns>(  
//         //     value: EvaluationAns.belowAverage,  
//         //     groupValue: _value, 
//         //     onChanged: (EvaluationAns? value) {
//         //       setState(() {
//         //         _value=value;
//         //         Utilities.radiovalue=value.toString();
                
//         //       });
//         //       },   
//         //   ),  
//         // ),  
//         // ListTile(  
//         //   title: const Text('Good'),  
//         //   leading: Radio<EvaluationAns>(  
//         //     value: EvaluationAns.good,  
//         //     groupValue: _value, 
//         //     onChanged: (EvaluationAns? value) {
//         //       setState(() {
//         //         _value=value;
//         //         Utilities.radiovalue=value.toString();
                
//         //       });
//         //       },   
//         //   ),  
//         // ), 
//         // ListTile(  
//         //   title: const Text('Poor'),  
//         //   leading: Radio<EvaluationAns>(  
//         //     value: EvaluationAns.poor,  
//         //     groupValue: _value, 
//         //     onChanged: (EvaluationAns? value) {
//         //       setState(() {
//         //         _value=value;
//         //         Utilities.radiovalue=value.toString();
//         //         // for(int i=0;i<Utilities.questionlist.length;i++)
//         //         // {
//         //         //   Utilities.post.add({"Emp_no:"+Utilities.courseslist[index].emp_no,"Reg_No:"+Utilities.regno,
//         //         //   "Course_no:"+Utilities.courseslist[index].courseNo,"Discipline:BCS","Semester_No:"
//         //         //   +Utilities.semester,"Question_Desc:"+Utilities.questionlist[i].questionId.toString(),
//         //         //   "Answer_Desc:Poor","Answer_Marks:1"}
//         //         //   );
//         //         // }
//         //         // print(Utilities.post.toList());
                
//         //       });
//         //       },   
//         //   ),  
//         // ),  
//                 ],
//                ),
//               ), 
//             )
//           ],
//         ),  
//       ),
//     ); 
//   }
//   evalpost() async {
//     int totalevaluatedquestion=Utilities.questionlist.length;
//     int saved=0;
//     for (int i=0;i<Utilities.questionlist.length;i++)
//     {++saved;
//       if(Utilities.radiovalue!='')
//       {
//         int ans_mark=1;
//         if(Utilities.radiovalue=='Excellent') ans_mark=5;
//         else if(Utilities.radiovalue=='Good') ans_mark=4;
//         else if(Utilities.radiovalue=='Average') ans_mark=3;
//         else if(Utilities.radiovalue=='Below Average') ans_mark=2;
//         else if(Utilities.radiovalue=='Poor') ans_mark=1;
      
//       final uri = Uri.parse(Utilities.baseurl+'/TeacherEvalutionV2/api/student/addStdEvaluation');
//   final headers = {'Content-Type': 'application/json'};
//   var Data = {
//           "Emp_no":"Utilities.courseslist[i].emp_no" ,
//           "Reg_No": "Utilities.regno",
//           "Course_no": "Utilities.courseslist[i].courseNo",
//           "Discipline": "Utilities.courseslist[i].discipline",
//           "Semester_no": "Utilities.semester.toString()",
//           "Question_Desc": "Utilities.questionlist[i].questionId",
//           "Answer_Desc": "Utilities.radiovalue.toString()",
//           "Answer_Marks": "ans_mark.toString()",
//         };
  
//   String jsonBody = json.encode(Data);
//   final encoding = Encoding.getByName('utf-8');

//   http.Response response = await post(
//     uri,
//     headers: headers,
//     body: jsonBody,
//     encoding: encoding,
//   );

//   int statusCode = response.statusCode;
//   String responseBody = response.body;
//   EasyLoading.dismiss();
//     }}
// }

   }
}


