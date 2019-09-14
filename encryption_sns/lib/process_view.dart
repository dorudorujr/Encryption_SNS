import 'package:flutter/material.dart';
import 'package:encryption_sns/application_bloc.dart';
import 'package:flutter/services.dart';
import 'package:flutter_selectable_text/flutter_selectable_text.dart';

class ProcessView extends StatefulWidget {
  final ApplicationBloc _applicationBloc;

  ProcessView(this._applicationBloc);

  @override
  _ProcessViewState createState() => new _ProcessViewState(this._applicationBloc);
}

class _ProcessViewState extends State {

  int _currentIndex = 0;
  final textFieldController = TextEditingController();
  FocusNode focusNode = FocusNode();
  final ApplicationBloc _applicationBloc;

  _ProcessViewState(this._applicationBloc);

  @override
  // widgetの破棄時にコントローラも破棄する
  void dispose() {
    textFieldController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final applicationBloc = this._applicationBloc;
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
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          items: [
            new BottomNavigationBarItem(
                icon: new Icon(Icons.lock_outline),
                title: Text("暗号化")
            ),
            new BottomNavigationBarItem(
                icon: new Icon(Icons.lock_open),
                title: Text("復号化")
            ),
          ],
          onTap: (int index) {
            //ここに処理関数を指定する
            onNavigationBarItemChanged(index);

            switch(index) {
              case 0: {
                applicationBloc.encryption.add(textFieldController.text);
              }
              break;
              case 1: {
                applicationBloc.decryption.add(textFieldController.text);
              }
              break;
              default: {}
              break;
            }
          },
        ),
      ),
    );
  }

  void onNavigationBarItemChanged(int index) {
    setState(() {
      this._currentIndex = index;
    });
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
          stream: _applicationBloc.showingText,                //出力用streamを取得
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
