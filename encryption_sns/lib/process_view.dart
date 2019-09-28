import 'package:flutter/material.dart';
import 'package:encryption_sns/application_bloc.dart';
import 'package:flutter/services.dart';
import 'package:encryption_sns/Widget/ProcessView/bottom_navigationbar.dart';

class ProcessView extends StatefulWidget {
  final ApplicationBloc applicationBloc;

  ProcessView({Key key, @required this.applicationBloc}) : super(key: key);

  @override
  _ProcessViewState createState() => new _ProcessViewState();
}

class _ProcessViewState extends State<ProcessView> {

  int _currentIndex = 0;
  final textFieldController = TextEditingController();
  FocusNode focusNode = FocusNode();

  @override
  // widgetの破棄時にコントローラも破棄する
  void dispose() {
    textFieldController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        focusNode.unfocus();
      },
      child: Scaffold(
        appBar: AppBar(title: Text('処理画面')),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              _textField(),
              _resultTextCard(),
            ],
          ),
        )
        ,
        bottomNavigationBar: ProcessBottomNavigationBar(applicationBloc: widget.applicationBloc, textFieldController: textFieldController),
      ),
    );
  }

  Widget _textField() {
    return Container(
      padding: EdgeInsets.only(top: 10,left: 20,right: 20,bottom: 10),
      child: TextField(
        decoration: InputDecoration(
            hintText: "Text"
        ),
        controller: textFieldController,
        keyboardType: TextInputType.multiline,
        maxLines: 10,
        maxLength: 500,
        maxLengthEnforced: true,
        textAlign: TextAlign.left,
        focusNode: this.focusNode,
      ),
    );
  }

  Widget _resultTextCard() {
    return Card(
      elevation: 4.0,
      margin: const EdgeInsets.all(16.0),
      child: Container(
        padding: EdgeInsets.all(10),
        width: 400,
        height: 200,
        child: StreamBuilder(
          stream: widget.applicationBloc.showingText,                //出力用streamを取得
          builder: (context, snapshot) {
            return _resultText(snapshot.hasData ? snapshot.data.toString() : "");
          },
        ),
      ),
    );
  }

  Widget _resultText(String resultText) {
    return GestureDetector(
      child: new Tooltip(preferBelow: false,
          message: "Copy", child: new Text(resultText)),
      onTap: () {
        Clipboard.setData(new ClipboardData(text: resultText));
      },
    );
  }
}
