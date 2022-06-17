// // ignore_for_file: prefer_const_constructors, deprecated_member_use

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';

// ignore_for_file: avoid_print, prefer_const_constructors

import 'package:flutter/cupertino.dart';


// import 'controllers/Utilities.dart';
// import 'controllers/widgets.dart';

// class Admin extends StatefulWidget {
//   const Admin({Key? key}) : super(key: key);

//   @override
//   State<Admin> createState() => _AdminState();
// }

// class _AdminState extends State<Admin> {
//   MaterialBanner _showMaterialBanner(BuildContext context) {
//     return MaterialBanner(
//         content: Text('Data Added Successfully!'),
//         leading: Icon(
//           Icons.warning,
//           color: Colors.deepPurple,
//         ),
//         padding: EdgeInsets.all(2),
//         backgroundColor: Colors.white,
//         contentTextStyle: TextStyle(
//             fontSize: 16,
//             fontWeight: FontWeight.w600,
//             color: Colors.deepPurple),
//         actions: [
//           TextButton(
//             onPressed: () {
//               ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
//             },
//             child: Container(
//               //color: Colors.deepPurple,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(20),
//                 color: Colors.deepPurple,
//               ),

//               padding:
//                   EdgeInsets.only(left: 18, right: 18, top: 10, bottom: 10),
//               child: Text(
//                 'Ok',
//                 style: TextStyle(color: Colors.black),
//               ),
//             ),
//           ),
//         ]);
//   }

//   Map<String, bool> values = {
//     'Non Irritating Content': false,
//     'Non Emotional Content': false,
//     'Age Related Content': false,
//     'Entartaining Content': false,
//     'Current Affairs': false,
//   };
  

//   var tmpArray = [];

//   getCheckboxItems() {
//     values.forEach((key, value) {
//       if (value == true) {
//         tmpArray.add(key);
//       }
//     });

//     // Printing all selected items on Terminal screen.

//     print(tmpArray);
//     // Utilities.dfeedbackdes = tmpArray.toString() + " " + other.text;
//     // print(Utilities.dfeedbackdes);
//     // Here you will get all your selected Checkbox items.

//     // Clear array after use.
//     tmpArray.clear();
//   }

//   var other = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: CupertinoNavigationBar(
//         middle: Text("Customize QnA"),
//         leading: InkWell(
//           onTap: () {
//             Navigator.pop(context);
//           },
//           child: Icon(Icons.arrow_back_rounded),
//         ),
//         backgroundColor: Colors.deepPurple,
//       ),
//       body: SingleChildScrollView(
//         child: MyBackground(
//             child: Column(
//           children: [
//             // Container(
//             //   decoration: BoxDecoration(
//             //       border: Border.all(color: Colors.white),
//             //       boxShadow: [
//             //         BoxShadow(
//             //             color: Colors.black.withOpacity(0.4), blurRadius: 5)
//             //       ],
//             //       borderRadius: BorderRadius.circular(15),
//             //       color: Colors.grey[200]),
//             //   height: 40,
//             //   width: Utilities.getSize(context).width,
//             //   child: Center(
//             //     child: Text(
//             //       "Add Questions",
//             //       style: TextStyle(fontSize: 20),
//             //     ),
//             //   ),
//             // ),
//              MyInputField(controller: other, hint: "New question"),
//              Padding(
//                padding: const EdgeInsets.only(right: 10),
             
//                child: MyButton(text: "ADD", onTap: (){}),
//              ),
//             SizedBox(
//               height: 50,
//             ),
//             Container(
//               margin: EdgeInsets.only(bottom: 5, top: 10),
//               decoration: BoxDecoration(
//                   border: Border.all(color: Colors.black, width: 2),
//                   borderRadius: BorderRadius.circular(4)),
//               height: 200,
//               child: ListView(
//                 children: values.keys.map((String key) {
//                   return CheckboxListTile(
//                     title: Text(key),
//                     value: values[key],
//                     activeColor: Colors.deepPurple,
//                     checkColor: Colors.white,
//                     onChanged: (bool? value) {
//                       setState(() {
//                         values[key] = value!;
//                       });
//                     },
//                   );
//                 }).toList(),
//               ),
//             ),
//             SizedBox(height: 0),
           
//             SizedBox(height: 55),
//             MyButton(
//                 text: "Post",
//                 onTap: () {
//                   // getCheckboxItems();
//                   // Utilities.dfeedback = "modify";
//                   // verifydata();
//                 })
//           ],
//         )),
//       ),
//     );
//   }

// //   Future<void> verifydata() async {
// //     var request = http.Request(
// //         'POST',
// //         Uri.parse(Utilities.baseurl +
// //             '/memoryjogger/api/pictures/updatedes?pid=' +
// //             Utilities.pictureid.toString() +
// //             "&dfeed=" +
// //             Utilities.dfeedback +
// //             "&dfeeddes=" +
// //             Utilities.dfeedbackdes));

// //     http.StreamedResponse response = await request.send();

// //     if (response.statusCode == 200) {
// //       print(await response.stream.bytesToString());
// //       ScaffoldMessenger.of(context)
// //           .showMaterialBanner(_showMaterialBanner(context));
// //     } else {
// //       print(response.reasonPhrase);
// //     }
// //   }

// }
import 'dart:convert';


import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:teacherevaluation/controllers/widgets.dart';

import 'controllers/Utilities.dart';
import 'models/questionmodel.dart';
class CheckBoxInListView extends StatefulWidget {
  @override
  _CheckBoxInListViewState createState() => _CheckBoxInListViewState();
}

class _CheckBoxInListViewState extends State<CheckBoxInListView> {
   var que = TextEditingController();
   var sem= TextEditingController();
   
  List<bool> _isChecked=[];


  @override
  void initState()  {
 
    super.initState();
    _isChecked = List<bool>.filled(Utilities.questionlist.length, false);
  }

  @override
    List<dynamic> tmpArray = [];
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CupertinoNavigationBar(
        middle: Text("Customize QnA"),
        leading: InkWell(
          onTap: () {
           Navigator.pushNamed(context, '/login');
          },
          child: Icon(Icons.arrow_back_rounded),
        ),
        backgroundColor: Colors.deepPurple,
      ),
      body: SingleChildScrollView(
        child: MyBackground(
          child: Column(
            children: [ SizedBox(height: 40,),
            SemesterdropDown(),
              MyInputField(controller: que, hint: 'New Question'),
              //  MyInputField(controller: sem, hint: 'Semester'),
               Container(
                   padding: const EdgeInsets.only(left: 210),
                   margin: const EdgeInsets.only(left: 70,right: 10),
                   child: MyButton(text: "ADD", onTap: (){
                     EasyLoading.show();
                     makePostRequest();
                     que.clear();
                     }),
                 ),
              SizedBox(height: 40,),
              Container(
                decoration: BoxDecoration(
                      border: Border.all(color: Colors.white),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.4), blurRadius: 5)
                      ],
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.grey[200]),
                height: 350,
                child: ListView.builder(
                  itemCount: Utilities.questionlist.length,
                  itemBuilder: (context, index) {
                    return CheckboxListTile(
                      title: Text(Utilities.questionlist[index].question1.toString()),
                      value: _isChecked[index],
                      onChanged: (val) {
                        setState(
                          () {
                            _isChecked[index] = val!;
                            // ignore: unused_local_variable
                            var dat=Utilities.questionlist[index].question1.toString()+","+Utilities.semestervalue.toString();
                            Map<String, dynamic> body = {'Question1': Utilities.questionlist[index].question1.toString(), 'Description': Utilities.semestervalue.toString()};
                            makePostRequests(body);
                            //tmpArray.add(dat);
                            print(body);
                          },
                        );
                      },
                    );
                  },
                ),
              ),
                SizedBox(height: 55),
                MyButton(
                    text: "Post",
                    onTap: () {
                     
                      setState(() {
                        _isChecked = List<bool>.filled(Utilities.questionlist.length, false);
                      });
                     // _isChecked = List<bool>.filled(Utilities.questionlist.length, false);
                     
                      
                      ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Data Posted Successfull!"),backgroundColor: Colors.green,));
                      // getCheckboxItems();
                      // Utilities.dfeedback = "modify";
                      // verifydata();
                    })
            ],
          ),
        ),
      ),
      
    );
  }
makePostRequest() async {

  final uri = Uri.parse(Utilities.baseurl+'/TeacherEvalutionV2/api/admin/addsinglequestion');
  final headers = {'Content-Type': 'application/json'};
  Map<String, dynamic> body = {'Question1': que.text, 'Description': Utilities.semestervalue.toString()};
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
  EasyLoading.dismiss();
}
makePostRequests(Map<String, dynamic> body) async {
EasyLoading.show();
  final uri = Uri.parse(Utilities.baseurl+'/TeacherEvalutionV2/api/admin/addsinglequestion');
  final headers = {'Content-Type': 'application/json'};
  //  = {'Question1': que.text, 'Description': sem.text};
  String jsonBody = json.encode(body);
  final encoding = Encoding.getByName('utf-8');

  http.Response response = await post(
    uri,
    headers: headers,
    body: jsonBody,
    encoding: encoding,
  );
  EasyLoading.dismiss();

  int statusCode = response.statusCode;
  String responseBody = response.body;
}
}