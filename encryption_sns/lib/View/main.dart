import 'package:flutter/material.dart';
import 'package:encryption_sns/Bloc/application_bloc_provider.dart';
import 'package:encryption_sns/Widget/password_text_field.dart';
import 'package:encryption_sns/Widget/release_raised_button.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TopView(), //MainView()
    );
  }
}

class TopView extends StatefulWidget {
  @override
  _TopViewState createState() => new _TopViewState();
}

class _TopViewState extends State<TopView> {
  final passWordTextFieldController = TextEditingController();

  @override
  // widgetの破棄時にコントローラも破棄する
  void dispose() {
    super.dispose();
    passWordTextFieldController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            PasswordTextField(passWordTextFieldController: passWordTextFieldController),
            ApplicationBlocProvider(child: ReleaseRaisedButton(passWordTextFieldController: passWordTextFieldController),),
          ],
        ),
      ),
    );
  }
}

