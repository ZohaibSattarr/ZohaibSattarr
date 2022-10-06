

// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, prefer_typing_uninitialized_variables, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import '../models/bar_chart_model.dart';
import 'Utilities.dart';
import 'package:charts_flutter/flutter.dart' as charts;

//import 'package:flutter_radio_group/radio_list.dart';


class MyButton extends StatelessWidget {
  String text;
  double? textSize = 12;
  FontWeight? fontWeight = FontWeight.w600;
  VoidCallback onTap;
  MyButton(
      {Key? key,
      required this.text,
      this.textSize,
      this.fontWeight,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(top: 5, bottom: 5),
        width: Utilities.getSize(context).width * 0.9,
        padding: EdgeInsets.only(top: 16, bottom: 16),
        decoration: BoxDecoration(
          color: Colors.deepPurple,
          boxShadow: [
            BoxShadow(color: Colors.white.withOpacity(0.4), blurRadius: 10)
          ],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ),
      ),
    );
  }
}
//DropDownButton


class MyDropDownButton extends StatefulWidget {
  const MyDropDownButton({Key? key}) : super(key: key);

  @override
  State<MyDropDownButton> createState() => _MyDropDownButton();
}

class _MyDropDownButton extends State<MyDropDownButton> {
  

  @override
  Widget build(BuildContext context) {  
    return Container(
      margin: EdgeInsets.only(top: 5, bottom: 5),
        width: Utilities.getSize(context).width * 0.9,
        padding: EdgeInsets.only(top: 1, bottom: 1,left: 10),
        decoration: BoxDecoration(
          //color: Colors.deepPurple,
          // boxShadow: [
          //   BoxShadow(color: Colors.white.withOpacity(0.4), blurRadius: 10)
          // ],
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(12),
        ),
      child: DropdownButton<String>(
        value: Utilities.dropdownValue,
        isExpanded: true,
        icon:  Icon(Icons.arrow_drop_down),
        //elevation: 40,
        style:  TextStyle(color: Colors.deepPurple,fontSize:20),
        underline: Container(
          height: 2,
          color: Colors.grey[300],
        ),
        onChanged: (String? newValue) {
          setState(() {
            Utilities.dropdownValue = newValue!;
           // print(dropdownValue);
          }
          );
        },
        items: <String>['Student', 'Admin', 'Director']
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }
}
// class AwesomeDropdown extends StatefulWidget {
//   @override
//   _AwesomeDropdownState createState() => _AwesomeDropdownState();
// }

// class _AwesomeDropdownState extends State<AwesomeDropdown> {
//   final List<String> textList = ["Student", "Admin","Director"];
//   late String _currentItemSelected;

//   @override
//   void initState() {
//     super.initState();
//     _currentItemSelected = textList[0];
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//        margin: EdgeInsets.only(top: 5, bottom: 5),
//         width: Utilities.getSize(context).width * 0.9,
//         padding: EdgeInsets.only(top: 5, bottom: 5,left: 10),
//         decoration: BoxDecoration(
//           //color: Colors.deepPurple,
//           // boxShadow: [
//           //   BoxShadow(color: Colors.white.withOpacity(0.4), blurRadius: 10)
//           // ],
//           border: Border.all(color: Colors.white),
//           borderRadius: BorderRadius.circular(12),
//         ),
//       child: PopupMenuButton<String>(
//         itemBuilder: (context) {
//           return textList.map((str) {
//             return PopupMenuItem(
//               value: str,
//               child: Text(str),
//             );
//           }).toList();
//         },
//         child: Row(
//           mainAxisSize: MainAxisSize.min,
//           children: <Widget>[
//             Text(_currentItemSelected),
//             Icon(Icons.arrow_drop_down),
//           ],
//         ),
//         onSelected: (v) {
//           setState(() {
//             print('!!!===== $v');
//             _currentItemSelected = v;
//           });
//         },
//       ),
//     );
//   }
// }



//Semester_DropDownButton

class SemesterdropDown extends StatefulWidget {
  const SemesterdropDown({Key? key}) : super(key: key);

  @override
  State<SemesterdropDown> createState() => _SemesterdropDown();
}

class _SemesterdropDown extends State<SemesterdropDown> {
  

  @override
  Widget build(BuildContext context) {  
    return Container(
      //margin: EdgeInsets.only(top: 5, bottom: 5),
        width: Utilities.getSize(context).width * 0.9,
        padding: EdgeInsets.only(top: 1, bottom: 1,left: 10),
        decoration: BoxDecoration(
          //color: Colors.deepPurple,
          // boxShadow: [
          //   BoxShadow(color: Colors.white.withOpacity(0.4), blurRadius: 10)
          // ],
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(12),
        ),
      child: DropdownButton<String>(
        value: Utilities.semestervalue,
        isExpanded: true,
        icon:  Icon(Icons.arrow_drop_down),
        //elevation: 40,
        style:  TextStyle(color: Colors.deepPurple,fontSize:20),
        underline: Container(
          height: 2,
          color: Colors.grey[300],
        ),
        onChanged: (String? newValue) {
           Utilities.semestervalue=newValue!;
        },
        items: <String>['2022SM', '2021FM', '2021SM']
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }
}






class CourseDropDown extends StatefulWidget {
  int count;
   CourseDropDown({Key? key, required this.count}) : super(key: key);


  @override
  State<CourseDropDown> createState() => _CourseDropDown();
}

class _CourseDropDown extends State<CourseDropDown> {
  

  @override
  Widget build(BuildContext context) {  
    return Container(
      //margin: EdgeInsets.only(top: 5, bottom: 5),
        width: 90,
        padding: EdgeInsets.only(top: 1, bottom: 1,left: 10),
        decoration: BoxDecoration(
          //color: Colors.deepPurple,
          // boxShadow: [
          //   BoxShadow(color: Colors.white.withOpacity(0.4), blurRadius: 10)
          // ],
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(12),
        ),
      child:  DropdownButton<String>(
        value: Utilities.coursedropdownvalue,
          isExpanded: true,
        icon:  Icon(Icons.arrow_drop_down),
        //elevation: 40,
        style:  TextStyle(color: Colors.deepPurple,fontSize:20),
        underline: Container(
          height: 2,
          color: Colors.grey[300],
        ),
           onChanged: (String? newValue) {
          setState(() {
              if(Utilities.reportSelectorCounter==1)
            {
              Utilities.c1=newValue!.split(",")[1];
            }
            else if(Utilities.reportSelectorCounter==2)
            {
              Utilities.c2=newValue!.split(",")[1];
            }
            else
            {
              Utilities.c3=newValue!.split(",")[1];
            }
            Utilities.coursedropdownvalue = newValue;
           // print(dropdownValue);
           Utilities.selectedCourcesreport.add({
              'count' : widget.count,
              'type' : 'course',
              'value' : newValue
            });
          }
          );
           },
          items: Utilities.CourseList.map((data) {
              return DropdownMenuItem<String>(
                value:data.title+","+data.courseNo,
                child: Text(
                  data.title+","+data.courseNo,
                   style: TextStyle(color: Colors.deepPurpleAccent),
                ),
              );
            }).toList(),
        ),
    );
  }
}
//teacherdropdown

class TeacherDropDown extends StatefulWidget {
  int count;
  TeacherDropDown({Key? key, required this.count}) : super(key: key);

  @override
  State<TeacherDropDown> createState() => _TeacherDropDown();
}

class _TeacherDropDown extends State<TeacherDropDown> {
  

  @override
  Widget build(BuildContext context) {  
    return Container(
      margin: EdgeInsets.only(top: 5, bottom: 5),
        width: 120,
        padding: EdgeInsets.only(top: 1, bottom: 1,left: 1),
        decoration: BoxDecoration(
          //color: Colors.deepPurple,
          // boxShadow: [
          //   BoxShadow(color: Colors.white.withOpacity(0.4), blurRadius: 10)
          // ],
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(12),
        ),
      child:  DropdownButton<String>(
        value: Utilities.teacherdropdownvalue,
          isExpanded: true,
        icon:  Icon(Icons.arrow_drop_down),
        //elevation: 40,
        style:  TextStyle(color: Colors.deepPurple,fontSize:20),
        underline: Container(
          height: 2,
          color: Colors.grey[300],
        ),
           onChanged: (String? newValue) {
          setState(() {
             if(Utilities.reportSelectorCounter==1)
            {
              Utilities.t1=newValue!.split(",")[1];
            }
            else if(Utilities.reportSelectorCounter==2)
            {
              Utilities.t2=newValue!.toString().split(",")[1];
            }
            else
            {
              Utilities.t3=newValue!.toString().split(",")[1];
            }
            Utilities.teacherdropdownvalue = newValue;
           // print(dropdownValue);
           Utilities.selectedCourcesreport.add({
              'count' : widget.count,
              'type' : 'teacher',
              'value' : newValue
            });
          }
          );
           },
          items: Utilities.TeacherList.map((data) {
              return DropdownMenuItem<String>(
                value:data.name+","+data.empNo,
                child: Text(
                  data.name+","+data.empNo,
                   style: TextStyle(color: Colors.deepPurpleAccent),
                ),
              );
            }).toList(),
        ),
    );
  }
}
// //TemplateDropDown
// class TemplateDropDown extends StatefulWidget {
//   TemplateDropDown({Key? key}) : super(key: key);

//   @override
//   State<TemplateDropDown> createState() => _TemplateDropDown();
// }

// class _TemplateDropDown extends State<TemplateDropDown> {
  

//   @override
//   Widget build(BuildContext context) {  
//     return 
//   }
// }



//semesterdropdown

class SemesterDropDown extends StatefulWidget {
  int count;
  SemesterDropDown({Key? key, required this.count}) : super(key: key);

  @override
  State<SemesterDropDown> createState() => _SemesterDropDown();
}

class _SemesterDropDown extends State<SemesterDropDown> {
  

  @override
  Widget build(BuildContext context) {  
    return Container(
      margin: EdgeInsets.only(top: 5, bottom: 5),
        width: 120,
        padding: EdgeInsets.only(top: 1, bottom: 1,left: 1),
        decoration: BoxDecoration(
          //color: Colors.deepPurple,
          // boxShadow: [
          //   BoxShadow(color: Colors.white.withOpacity(0.4), blurRadius: 10)
          // ],
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(12),
        ),
      child:  DropdownButton<String>(
        value: Utilities.semesterdropdownvalue,
          isExpanded: true,
        icon:  Icon(Icons.arrow_drop_down),
        //elevation: 40,
        style:  TextStyle(color: Colors.deepPurple,fontSize:20),
        underline: Container(
          height: 2,
          color: Colors.grey[300],
        ),
           onChanged: (String? newValue) {
             setState(() {
            if(Utilities.reportSelectorCounter==1)
            {
              Utilities.s1=newValue!;
            }
            else if(Utilities.reportSelectorCounter==2)
            {
              Utilities.s2=newValue!;
            }
            else
            {
              Utilities.s3=newValue!;
            }
            Utilities.semestervalue = newValue;
           // print(dropdownValue);
          }
          );
          setState(() {
            Utilities.semesterdropdownvalue = newValue!;
            Utilities.selectedCourcesreport.add({
              'count' : widget.count,
              'type' : 'semester',
              'value' : newValue
            });
           // print(dropdownValue);
          }
          );
           },
          items: Utilities.SemesterList.map((data) {
              return DropdownMenuItem<String>(
                value:data.semesterNo,
                child: Text(
                  data.semesterNo,
                   style: TextStyle(color: Colors.deepPurpleAccent),
                ),
              );
            }).toList(),
        ),
    );
  }
}


//mybackground

// ignore: must_be_immutable
class MyBackground extends StatefulWidget {
  Widget child;
  MyBackground({Key? key, required this.child}) : super(key: key);

  @override
  State<MyBackground> createState() => _MyBackgroundState();
}

class _MyBackgroundState extends State<MyBackground> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      height: Utilities.getSize(context).height,
      width: Utilities.getSize(context).width,
      child: widget.child,
      color: Colors.grey[300],
      // decoration: const BoxDecoration(
      //     image: DecorationImage(
      //   fit: BoxFit.cover,
      //   image: AssetImage("assets/images/background_image.png"),
      // )
      // ),
    );
  }
}
//myinputfield

// ignore: must_be_immutable
class MyInputField extends StatefulWidget {
  TextEditingController controller;
  String hint;
  MyInputField({
    Key? key,
    required this.controller,
    required this.hint,
  }) : super(key: key);

  @override
  State<MyInputField> createState() => _MyInputFieldState();
}

class _MyInputFieldState extends State<MyInputField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 10.0),
        child: TextField(
          controller: widget.controller,
          decoration:
              InputDecoration(border: InputBorder.none, hintText: widget.hint),
        ),
      ),
    );
  }
}

//mypasswordinput field

// ignore: must_be_immutable
class MyPasswordInputField extends StatefulWidget {
  TextEditingController controller;
  String hint;

  MyPasswordInputField({
    Key? key,
    required this.controller,
    required this.hint,
  }) : super(key: key);

  @override
  State<MyPasswordInputField> createState() => _MyPasswordInputFieldState();
}

class _MyPasswordInputFieldState extends State<MyPasswordInputField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 10.0),
        child: TextField(
          controller: widget.controller,
          obscureText: true,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: widget.hint,
          ),
        ),
      ),
    );
  }
}

// drawer widget

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Column(
      children: [
        Container(
          color: Colors.blueAccent,
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          child: Center(
            child: Column(
              children: <Widget>[
                Container(
                  width: 100,
                  height: 100,
                  margin: const EdgeInsets.only(
                    top: 30,
                  ),
                  decoration: const BoxDecoration(
                    color: Colors.blue,
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage('assets/images/biitlogo.png'),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text("Memory Jogger",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                    )),
              ],
            ),
          ),
        ),
        ListTile(
          leading: const Icon(Icons.home),
          title: const Text("Home",
              style: TextStyle(
                fontSize: 16,
              )),
          onTap: () {
            Navigator.pushNamed(context, '/after_login_caretaker');
          },
        ),
        ListTile(
          leading: const Icon(Icons.info),
          title: const Text("Personal Information",
              style: TextStyle(
                fontSize: 16,
              )),
          onTap: () {
            Navigator.pushNamed(context, '/patient_personal_info');
          },
        ),
        ListTile(
          leading: const Icon(Icons.picture_in_picture_sharp),
          title: const Text("Pictures",
              style: TextStyle(
                fontSize: 16,
              )),
          onTap: () {
            Navigator.pushNamed(context, '/patient_pictures');
          },
        ),
        ListTile(
          leading: Icon(Icons.notification_important),
          title: const Text("Remindars",
              style: TextStyle(
                fontSize: 16,
              )),
          onTap: () {
            Navigator.pushNamed(context, '/patient_remindars');
          },
        ),
        const ListTile(
          leading: Icon(Icons.logout_outlined),
          title: Text("Logout",
              style: TextStyle(
                fontSize: 16,
              )),
          onTap: null,
        ),
      ],
    ));
  }
}




class MyTextfield extends StatelessWidget {
  final IconData icon;
  final String hint;
  final FormFieldValidator<String> validator;
  final TextEditingController textEditingController;
  final TextInputType keyboardtype;
  final bool obscure;
  final bool readonly;
  final bool showicon;
  final int? maxlenght;
  final Function()? ontap;
  const MyTextfield(
      {Key? key,
      required this.hint,
      required this.icon,
      required this.validator,
      required this.textEditingController,
      this.obscure = false,
      this.readonly = false,
      this.showicon = true,
      this.ontap,
      this.keyboardtype = TextInputType.text,
      this.maxlenght = null})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textCapitalization: TextCapitalization.sentences,
      maxLines: 1,
      maxLength: maxlenght,
      readOnly: readonly,
      obscureText: obscure,
      keyboardType: keyboardtype,
      onTap: readonly ? ontap : null,
      controller: textEditingController,
      style: Theme.of(context).textTheme.headline1?.copyWith(
            fontSize: 9,
            color: Colors.black,
          ),
      decoration: InputDecoration(
          fillColor: Colors.grey.shade200,
          filled: true,
          hintText: hint,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: BorderSide(
                color: Colors.grey.shade200,
                width: 0,
              )),
          contentPadding:
              EdgeInsets.symmetric(horizontal: 5, vertical: 2.3),
          hintStyle: Theme.of(context).textTheme.headline1?.copyWith(
                fontSize: 9,
                color: Colors.deepPurple,
              ),
          prefixIcon: showicon
              ? Icon(
                  icon,
                  size: 22,
                  color: Colors.deepPurple,
                )
              : null,
          suffixIcon: readonly
              ? Icon(
                  icon,
                  size: 22,
                  color: Colors.deepPurple,
                )
              : null),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: validator,
    );
  }
}

//BarChartGraph

class ReportChart extends StatelessWidget {
  final List<ReportSeries> data;

 ReportChart({required this.data});

  @override
  Widget build(BuildContext context) {
    List<charts.Series<ReportSeries, String>> series = [
      charts.Series(
        id: "Report",
        data: data,
        domainFn: (ReportSeries series, _) => series.questionDesc.toString(),
        measureFn: (ReportSeries series, _) => series.averageMarks,
       
      )
    ];

    return Container(
      height: 500,
      width: Utilities.getSize(context).width*1.6,
      padding: EdgeInsets.all(1),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(1.0),
          child: Column(
            children: <Widget>[
              // Text(
              //   "World of Warcraft Subscribers by Year",
              //   style: Theme.of(context).textTheme.bodyText1,
              // ),
              Expanded(
                child: charts.BarChart(
                  series, 
                barGroupingType: charts.BarGroupingType.grouped,
                animate: true),
              )
            ],
          ),
        ),
      ),
    );
  }
}


// //RadioButton


// class RadioGroup extends StatefulWidget{
//   @override
//   State createState() {
//     // TODO: implement createState
//     return RadioGroupWidget();
//   }

// }

// class RadioGroupWidget extends State
// {
  

//   late final listplatform;
//   int selected=1;

//   RadioGroupWidget(this.listplatform);
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     listplatform=[];

//     listplatform.add(PlatFormList("Flutter", 1));
//     listplatform.add(PlatFormList("Go", 2));
//     listplatform.add(PlatFormList("JAVA", 3));
//     listplatform.add(PlatFormList("Kotlin", 4));
//     listplatform.add(PlatFormList("Android", 5));
//   }

//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     return Column(
//       children: [

//         Padding(
//             padding : EdgeInsets.all(14.0),
//             child: Text('Selected Platform = '+listplatform[selected-1].platform, style: TextStyle(fontSize: 23))
//         ),

//         Container(
//           height: 350.0,
//           child: Column(
//             children:
//             listplatform.map((data) => RadioListTile(
//               title: Text("${data.platform}"),
//               groupValue: selected,
//               value: data.index,
//               onChanged: (val) {
//                 setState(() {
//                   selected = data.index;
//                 });
//               },
//             )).toList(),
//           ),
//         ),

//       ],
//     );
//   }

// }
// class PlatFormList {
//   String platform;
//   int index;
//   PlatFormList(this.platform,this.index);
// }






















