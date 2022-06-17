// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:flutter_easyloading/flutter_easyloading.dart';
// import 'package:teacherevaluation/Admin.dart';
// import 'controllers/Utilities.dart';
// import 'controllers/widgets.dart';
// import 'models/questionmodel.dart';
// import 'package:http/http.dart' as http;
// class test extends StatelessWidget {
//   const test({Key? key}) : super(key: key);
//   Future<List<Questionmodel>> getallquestions(BuildContext context) async {
//     EasyLoading.show();
//     final response = await http.get(
//         Uri.parse(Utilities.baseurl+'/TeacherEvalutionV2/api/student/GetQuestions'));
//     var data = jsonDecode(response.body.toString());
//     if (response.statusCode == 200) {
//       Utilities.questionlist.clear();
//       for (Map<String, dynamic> i in data) {
//         Utilities.questionlist.add(Questionmodel.fromJson(i));
//       }
//       Navigator.push(context, MaterialPageRoute(builder: (context)=>CheckBoxInListView()));
//       EasyLoading.dismiss();
//       return Utilities.questionlist;
      
//     } else {
//       EasyLoading.dismiss();
//       return Utilities.questionlist;
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child:
//         MyButton(onTap: () {
//          EasyLoading.show();
//           getallquestions(context);
         
//         }, text: 'Build',)
//       ),
//     );
//   }
// }