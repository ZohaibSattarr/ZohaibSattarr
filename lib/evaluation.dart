// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_this

import 'package:flutter/material.dart';

class TeacherEvaluation extends StatefulWidget {
  const TeacherEvaluation({ Key? key }) : super(key: key);

  @override
  State<TeacherEvaluation> createState() => _TeacherEvaluationState();
}

class _TeacherEvaluationState extends State<TeacherEvaluation> {
  @override
    bool valuefirst = false;  
  bool valuesecond = false;  
  bool valuethird=false;
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text("Teacher evaluation")),backgroundColor: Colors.deepPurple,),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.fromLTRB(15, 5, 5, 5),
          child: Column(
            children: [
              SizedBox(height: 15,),
              Row(
                //  crossAxisAlignment:CrossAxisAlignment.stretch,
                children: [
                  Text(
                            "Semester:",
                            style: TextStyle(
                              fontSize: 20.0,
                            ),
                          ),
                          SizedBox(width: 120,),
                          Text(
                            "Program:",
                             style: TextStyle(
                              fontSize: 20.0,
                            ),
                          ),
                ],
              ),
                      SizedBox(height: 25,),
                      Row(
                        children: [
                          Text(
                            "Course No:",
                             style: TextStyle(
                              fontSize: 20.0,
                            ),
                          ),
                          SizedBox(width: 112,),
                          Text(
                            "Course Title:",
                             style: TextStyle(
                              fontSize: 20.0,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 35,),
                      Row(
                        children: [
                          Text(
                                "Teacher:",
                                 style: TextStyle(
                                  fontSize: 22.0,
                                ),
                              ),
                        ],
                      ),
                       SizedBox(height: 25,),
                    Center(
                      child: Text("Questions",
                      style: TextStyle(
                          fontSize: 30.0,
                          color: Colors.deepPurple,
                        ),),
                    ),
                    SizedBox(height: 20,),
                Container(
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.fromLTRB(0, 12, 0, 0),
                  height: 450,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.grey,
                    boxShadow: [
                      BoxShadow(
                         color: Colors.black38,
                         blurRadius: 25.0,
                         spreadRadius: 5,
                      )
                    ],
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(width: 200,),
                          Text(
                                "Excellent",
                                 style: TextStyle(
                                  fontSize: 15.0,
                                ),
                              ),
                              SizedBox(width: 15,),
                              Text(
                                "Average",
                                 style: TextStyle(
                                  fontSize: 15.0,
                                ),
                              ),
                              SizedBox(width: 15,),
                              Text(
                                "Poor",
                                 style: TextStyle(
                                  fontSize: 15.0,
                                ),
                              ),
                        ],
                      ),
                      Row(
                        children: [
                           Flexible(
                             child: Text(
                                  "1. Knowledge of this teacher about the subject ?(Has he/she a thorough knowledge and understanding of the subject being taught?)",
                                   style: TextStyle(
                                    fontSize: 15.0,
                                  ),
                                ),
                           ),
                           SizedBox(width: 160,
                            child: Row(
                              children: [
                                Checkbox(  
                      checkColor: Colors.greenAccent,  
                      activeColor: Colors.red,  
                      value: this.valuefirst,  
                      // onChanged: (bool value) {  
                        // setState(() {  
                        //   this.valuefirst = value;  
                        // });  
                      // },  
                      onChanged: null,
                    ),
                    SizedBox(width: 5,),
                     Checkbox(  
                      checkColor: Colors.greenAccent,  
                      activeColor: Colors.red,  
                      value: this.valuefirst,  
                      // onChanged: (bool value) {  
                        // setState(() {  
                        //   this.valuefirst = value;  
                        // });  
                      // },  
                      onChanged: null,
                    ),
                    SizedBox(width: 5,),
                     Checkbox(  
                      checkColor: Colors.greenAccent,  
                      activeColor: Colors.red,  
                      value: this.valuefirst,  
                      // onChanged: (bool value) {  
                        // setState(() {  
                        //   this.valuefirst = value;  
                        // });  
                      // },  
                      onChanged: null,
                    ),
                              ],
                            ),  
                           ),
                        ],
                      ),
                    ],
                  ),
                )
      
            ],
          ),
        ),
      ),
      
    );
  }
}