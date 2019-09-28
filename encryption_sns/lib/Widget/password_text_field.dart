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
      width: 200,
      padding: EdgeInsets.all(16.0),
      child: TextField(
        decoration: InputDecoration(
          labelText: "PassWord",
        ),
        controller: widget.passWordTextFieldController,
        maxLength: 32,
      ),
    );
  }
}