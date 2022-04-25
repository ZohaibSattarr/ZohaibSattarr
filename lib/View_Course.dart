// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:teacherevaluation/controllers/widgets.dart';


class ViewCourses extends StatefulWidget {
  const ViewCourses({Key? key}) : super(key: key);

  @override
  State<ViewCourses> createState() => _ViewCourses();
}

class _ViewCourses extends State<ViewCourses> {
  var fullname = TextEditingController();
  var email = TextEditingController();
  var relation = TextEditingController();
  var password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: Center(child: Text("Courses Detail")),backgroundColor: Colors.deepPurple,),
        body:  MyBackground(
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:[
                  Text(
                    "Student Name:",
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                  SizedBox(height: 15,),
                  Text(
                    "Arid no:",
                     style: TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                  SizedBox(height: 15,),
                  Text(
                    "Discipline:",
                     style: TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                  SizedBox(height: 25,),
                  Center(
                    child: Text("Courses",
                    style: TextStyle(
                        fontSize: 30.0,
                        color: Colors.deepPurple,
                      ),),
                  ),
                  SizedBox(height: 20,),
                  Table(
                  children:  [
                  TableRow(
                    children: [
                      Text(
                        "Course No",
                        style: TextStyle(
                      fontSize: 17.0,
                    ),
                      ),
                      Text(
                        "Course Title",
                        style: TextStyle(
                      fontSize: 17.0,
                    ),
                      ),
                      Text(
                        "Teacher",
                        style: TextStyle(
                      fontSize: 17.0,
                    ),
                      ),
                      Text("Evaluation",
                      style: TextStyle(
                      fontSize: 17.0,
                    ),), ],
                  )
                ],
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
              )
              ],
               
              ),
            ),

           
          ) ,
          )
     
    );
  }
}


 