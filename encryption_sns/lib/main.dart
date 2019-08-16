import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainView()
    );
  }
}

class MainView extends StatefulWidget {
  @override
  _MainViewState createState() => new _MainViewState();
}

class _MainViewState extends State {

  final passWordTextFieldController = TextEditingController();


  @override
  // widgetの破棄時にコントローラも破棄する
  void dispose() {
    passWordTextFieldController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 200,
              padding: EdgeInsets.all(10.0),
              child: TextField(
                controller: passWordTextFieldController,
              ),
            ),
            new Text(
              "b",
              style: new TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

}
