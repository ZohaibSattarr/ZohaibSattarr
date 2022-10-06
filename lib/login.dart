// import 'package:flutter/cupertino.dart';
// ignore_for_file: prefer_const_constructors, avoid_print, unused_import, prefer_const_constructors_in_immutables

import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;
import 'package:teacherevaluation/Admin.dart';
import 'package:teacherevaluation/Report.dart';
import 'package:teacherevaluation/Task.dart';
import 'package:teacherevaluation/controllers/DirectorController.dart';
import 'package:teacherevaluation/controllers/Utilities.dart';
import 'package:teacherevaluation/controllers/widgets.dart';
import 'package:teacherevaluation/models/questionmodel.dart';

import 'models/navbar.dart';

// ignore: must_be_immutable
class UserLogin extends StatefulWidget {
  UserLogin({Key? key}) : super(key: key);

  @override
  State<UserLogin> createState() => _UserLoginState();
}

class _UserLoginState extends State<UserLogin> {
var username = TextEditingController();
var password = TextEditingController();
DirectorController dir=DirectorController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  CupertinoNavigationBar(
        middle: Text("Login"),
        backgroundColor: Colors.deepPurple,
        brightness: Brightness.dark,
      ),
        body: MyBackground(
            child: SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
                child: Container(
              decoration: BoxDecoration(
                  border: Border.all(width: 1),
                  borderRadius: BorderRadius.circular(100),color: Colors.black),
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/images/download.jpg'),
                radius: 70,
              ),
            )),
             SizedBox(
              height: 30,
            ),
            MyInputField(controller: username, hint: "User Name"),
            SizedBox(height: 25,),
            MyPasswordInputField(controller: password, hint: "Password"),
           SizedBox(height: 25,),
             MyDropDownButton(),
               SizedBox(
              height: 25,
            ),
            MyButton(text: "Login",fontWeight: FontWeight.bold, onTap: () {
              EasyLoading.show();
             if(Utilities.dropdownValue=='Student')
             {
              login(context);
              navbarcall();
             }
             else if(Utilities.dropdownValue=='Admin')
             {
               admin(context);
             }
             else if(Utilities.dropdownValue=='Director') 
             {
              if(username.text=='Director'&& password.text=='123')
               {
                 Navigator.pushNamed(context,'/DirectorChoice');
                 EasyLoading.dismiss();
              }
             }
            }),
            const SizedBox(
              height: 20,
            ),
            
          ],
        ),
      ),
    )));
  }

  Future<void> login(context) async {
    
       var request = await http.get(Uri.parse(Utilities.baseurl+"/TeacherEvalutionV2/api/student/login/" +username.text  +"/"+password.text ));
    
    print('sending request...');

    if (request.statusCode == 200) {
      print(request.body.toString());
      Utilities.regno=username.text;
      // Utilities.semester=request.body.toString();
      EasyLoading.dismiss();
      print('OK Call');
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Student Login Successfull!"),backgroundColor: Colors.green,));
      Navigator.pushNamed(context, '/View_Course');
    } else {
      print('Not Uploaded');
      EasyLoading.dismiss();
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Oops!Something went wrong"),backgroundColor: Colors.red,));
    }
  }
    Future<void> admin(context) async {
       var request = await http.get(Uri.parse(Utilities.baseurl+"/TeacherEvalutionV2/api/Admin/AdminLogin/" +Utilities.dropdownValue+"/"+username.text+"/"+password.text ));
    
    print('sending request...');

    if (request.statusCode == 200) {
    //  getallquestions(context);
      print('OK Call');
      EasyLoading.dismiss();
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Admin Login Successfull!"),backgroundColor: Colors.green,));
      Navigator.pushNamed(context, '/Task');
    } else {
      print('Not Uploaded');
      EasyLoading.dismiss();
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Oops!Something went wrong"),backgroundColor: Colors.red,));
    }
  }


 
  // Future<List<Questionmodel>> getallquestions(BuildContext context) async {
  //   final response = await http.get(
  //       Uri.parse(Utilities.baseurl+'/TeacherEvalutionV2/api/student/GetQuestions'));
  //   var data = jsonDecode(response.body.toString());
  //   if (response.statusCode == 200) {
  //     Utilities.questionlist.clear();
  //     for (Map<String, dynamic> i in data) {
  //       Utilities.questionlist.add(Questionmodel.fromJson(i));
  //     }
  //     Navigator.push(context, MaterialPageRoute(builder: (context)=>CheckBoxInListView()));
  //     EasyLoading.dismiss();
  //     return Utilities.questionlist;
      
  //   } else {
  //     EasyLoading.dismiss();
  //     return Utilities.questionlist;
  //   }
  // }
  Future<List<Navbarmodel>> navbarcall() async {
    final response = await http.get(
        Uri.parse(Utilities.baseurl + '/TeacherEvalutionV2/api/student/NavBar/'+username.text+'/2021FM'));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      Utilities.navbarlist.clear();
      print(data);
      for (Map<String, dynamic> i in data) {
        Utilities.navbarlist.add(Navbarmodel.fromJson(i));
      }
      EasyLoading.dismiss();
      print(Utilities.navbarlist);
      return Utilities.navbarlist;
      
    } else {
      EasyLoading.dismiss();
      return Utilities.navbarlist;
    }
  }
}
