// import 'package:flutter/cupertino.dart';
// ignore_for_file: prefer_const_constructors, avoid_print, unused_import, prefer_const_constructors_in_immutables

import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:teacherevaluation/controllers/Utilities.dart';
import 'package:teacherevaluation/controllers/widgets.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text("Login")),backgroundColor: Colors.deepPurple,),
        body: MyBackground(
            child: SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // InkWell(
            //     onTap: () {
            //       Navigator.pop(context);
            //     },
            //     child: const Icon(
            //       Icons.arrow_back,
            //       color: Colors.blue,
            //     )),
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
            const SizedBox(
              height: 30,
            ),
            MyInputField(controller: username, hint: "User Name"),
            SizedBox(height: 25,),
            MyPasswordInputField(controller: password, hint: "Password"),
            const SizedBox(
              height: 45,
            ),
            MyButton(text: "Login",fontWeight: FontWeight.bold, onTap: () {
              // username.text="2018-arid-1128";
              // password.text="123";

              login(context);
              navbarcall();
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
       var request = await http.get(Uri.parse(Utilities.baseurl+"/api/student/login/" +username.text  +"/"+password.text ));
    
    print('sending request...');

    if (request.statusCode == 200) {
      print(request.body.toString());
      Utilities.regno=username.text;
      Utilities.semester=request.body.toString();
      print('OK Call');
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Login Successful!")));
      Navigator.pushNamed(context, '/View_Course');
    } else {
      print('Not Uploaded');
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Oops!Something went wrong")));
    }
  }

  Future<List<Navbarmodel>> navbarcall() async {
    final response = await http.get(
        Uri.parse(Utilities.baseurl + '/api/student/NavBar/'+username.text+'/2021FM'));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      Utilities.navbarlist.clear();
      print(data);
      for (Map<String, dynamic> i in data) {
        Utilities.navbarlist.add(Navbarmodel.fromJson(i));
      }
      print(Utilities.navbarlist);
      return Utilities.navbarlist;
      
    } else {
      return Utilities.navbarlist;
    }
  }
  }
