// import 'package:flutter/cupertino.dart';
// ignore_for_file: prefer_const_constructors

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:teacherevaluation/controllers/widgets.dart';

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
              login(context);
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
      var response = await http.post(Uri.parse("http://192.168.1.102/TeacherEvaluation/api/student/login?regno="+username.text+"& pass="+password.text),);
    
      if (response.statusCode==200) {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text("login successfull")));
        Navigator.pushNamed(context, '/View_Course');
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text("invalid email/password")));
      }
    } 
  }
