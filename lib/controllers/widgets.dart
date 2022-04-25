import 'package:flutter/material.dart';
import 'Utilities.dart';


class MyButton extends StatelessWidget {
  String text;
  double? textSize = 12;
  FontWeight? fontWeight = FontWeight.w400;
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
    return Center(
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(18),
          margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
          width: Utilities.getSize(context).width*0.4,
          decoration: BoxDecoration(
            color: Colors.deepPurple,
            borderRadius: BorderRadius.circular(13),
          ),
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 20, fontWeight: fontWeight, color: Colors.black,),
          ),
        ),
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
      decoration: const BoxDecoration(
          color: Colors.white60,
         ),
    );
  }
}
//myinputfield

// ignore: must_be_immutable
class MyInputField extends StatefulWidget {
  TextEditingController controller;
  String hint;
  MyInputField({Key? key, required this.controller, required this.hint})
      : super(key: key);

  @override
  State<MyInputField> createState() => _MyInputFieldState();
}

class _MyInputFieldState extends State<MyInputField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 5),
      child: TextField(
          controller: widget.controller,
          style: const TextStyle(fontSize: 16, color: Colors.black),
          cursorColor: Colors.black,
          decoration: InputDecoration(
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black, width: 1.0),
            ),
            hintText: widget.hint,
            hintStyle: const TextStyle(
                fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black),
          )),
    );
  }
}

//mypasswordinput field

// ignore: must_be_immutable
class MyPasswordInputField extends StatefulWidget {
  TextEditingController controller;
  String hint;
  MyPasswordInputField({Key? key, required this.controller, required this.hint})
      : super(key: key);

  @override
  State<MyPasswordInputField> createState() => _MyPasswordInputFieldState();
}

class _MyPasswordInputFieldState extends State<MyPasswordInputField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 5),
      child: TextField(
          controller: widget.controller,
          obscureText: true,
          obscuringCharacter: '*',
          style: const TextStyle(fontSize: 16, color: Colors.black),
          cursorColor: Colors.black,
          decoration: InputDecoration(
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black, width: 1.0),
            ),
            hintText: widget.hint,
            hintStyle: const TextStyle(
                fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black),
          )),
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




















