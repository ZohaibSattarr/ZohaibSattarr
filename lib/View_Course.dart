// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, prefer_adjacent_string_concatenation, unnecessary_string_interpolations

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:teacherevaluation/controllers/widgets.dart';
import 'package:teacherevaluation/models/courses.dart';
import 'package:http/http.dart' as http;
import 'package:teacherevaluation/models/navbar.dart';

import 'controllers/Utilities.dart';


class ViewCourses extends StatefulWidget {
  const ViewCourses({Key? key}) : super(key: key);

  @override
  State<ViewCourses> createState() => _ViewCourses();
}

class _ViewCourses extends State<ViewCourses> {
  final TextStyle dropdownmenuitem =
      TextStyle(color: Colors.black, fontSize: 19);
  final primary = Color.fromARGB(255, 71, 153, 207);
  final secondary = Color(0xfff29a94);
  
  Future<List<Courses>> getallcourses() async {
    final response = await http.get(
        Uri.parse(Utilities.baseurl + '/api/student/getcourses/2018-Arid-1128/2021FM'));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      Utilities.courseslist.clear();
      for (Map<String, dynamic> i in data) {
        Utilities.courseslist.add(Courses.fromJson(i));
      }

      return Utilities.courseslist;
      
    } else {
      return Utilities.courseslist;
    }
  }


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Color(0xfff0f0f0),
      body: SingleChildScrollView(
        child: MyBackground(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: FutureBuilder(
                future: getallcourses(),
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
                          padding: EdgeInsets.only(top: 255),
                          height: MediaQuery.of(context).size.height,
                          width: double.infinity,
                          child: ListView.builder(
                              itemCount: Utilities.courseslist.length,
                              itemBuilder: (BuildContext context, int index) {
                                return buildList(context, index);
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
                                  SizedBox(height: 20,),
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

                                      Text("Semester No",style: TextStyle(
                                            color: Colors.white, fontSize: 24),),
                                      Text(
                                        Utilities.navbarlist[0].semesterNo.toUpperCase(),
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 24),
                                      ),
                                    ],
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
                                height: 110,
                              ),
                              // 
                            ],
                          ),
                        )
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
      height: 150,
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: InkWell(
        onTap: () {
        },
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child:Padding(
                padding: const EdgeInsets.only(left:12.0,top: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      Utilities.courseslist[index].courseDesc,
                      style: TextStyle(
                          color: primary,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Row(
                      children: <Widget>[
                        Icon(
                          Icons.email_outlined,
                          color: secondary,
                          size: 20,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text("${Utilities.courseslist[index].empFirstname.toString()} "+"${Utilities.courseslist[index].empLastname.toString()}",
                            style: TextStyle(
                                color: primary, fontSize: 13, letterSpacing: .3)),
                      ],
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Row(
                      children: <Widget>[
                        Icon(
                          CupertinoIcons.person_badge_plus,
                          color: secondary,
                          size: 20,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(Utilities.courseslist[index].courseNo,
                            style: TextStyle(
                                color: primary, fontSize: 13, letterSpacing: .3)),
                         
                      ],
                    ),
                     Center(child: OutlinedButton.icon(onPressed: (){
                       Navigator.pushNamed(context, '/teacher_evaluation');
                       Utilities.teachername=Utilities.courseslist[index].empFirstname.toString()+" "+Utilities.courseslist[index].empLastname.toString();
                     }, icon: Icon(Icons.event_available_outlined), label: Text("Evaluate"))), 
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}



 
