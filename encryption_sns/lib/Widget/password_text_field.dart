import 'package:flutter/material.dart';

class PasswordTextField extends StatefulWidget {
  final TextEditingController passWordTextFieldController;

  PasswordTextField({Key key, @required this.passWordTextFieldController}) : super(key: key);

  @override
  _PasswordTextFieldState createState() => new _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 90,
      padding: EdgeInsets.all(0.0),
      child: TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder()
          //labelText: "PassWord",
        ),
        controller: widget.passWordTextFieldController,
        maxLength: 6,
      ),
    );
  }
}