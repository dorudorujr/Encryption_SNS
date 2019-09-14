import 'package:flutter/material.dart';
import 'package:encryption_sns/application_bloc_provider.dart';
import 'package:encryption_sns/process_view.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ApplicationBlocProvider(child: MainView(),), //MainView()
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
    final bloc = ApplicationBlocProvider.of(context).applicationBloc;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 200,
              padding: EdgeInsets.all(16.0),
              child: TextField(
                decoration: InputDecoration(
                    labelText: "PassWord",
                ),
                controller: passWordTextFieldController,
                maxLength: 32,
              ),
            ),
            RaisedButton(
              color: Colors.red,
              onPressed: (){
                bloc.setPassWord(passWordTextFieldController.text);
                Navigator.push(
                  context,
                  new MaterialPageRoute<Null>(
                    settings: const RouteSettings(name: "/processView"),
                    builder: (BuildContext context) => new ProcessView(bloc)
                  ),
                );
                passWordTextFieldController.clear();
              },
              child: Text("解除"),
              shape: CircleBorder(
                side: BorderSide(
                  color: Colors.black,
                  width: 1.0,
                  style: BorderStyle.solid,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

}
