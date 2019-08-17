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
      home: ApplicationBlocProvider(child: MainView(),),
      routes: <String, WidgetBuilder> {
        '/main': (BuildContext context) => new ApplicationBlocProvider(child: MainView(),),
        '/processView': (BuildContext context) => new ApplicationBlocProvider(child: Process(),)
      },//MainView()
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
              ),
            ),
            RaisedButton(
              color: Colors.red,
              onPressed: (){
                bloc.setPassWord(passWordTextFieldController.text);
                Navigator.pushNamed(context, '/processView');
                passWordTextFieldController.clear();
              },
              child: Text("RELEASE"),
            ),
          ],
        ),
      ),
    );
  }

}
