import 'package:flutter/material.dart';

class Process extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ProcessView();
  }
}


class ProcessView extends StatefulWidget {
  @override
  _ProcessViewState createState() => new _ProcessViewState();
}

class _ProcessViewState extends State {

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
        body: Center(
          child: Container(
            //width: 200,
            padding: EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                labelText: "Text",
              ),
              controller: textFieldController,
              keyboardType: TextInputType.multiline,
              maxLines: null,
              textAlign: TextAlign.left,
              focusNode: this.focusNode,
            ),
          ),
        ),
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
            print(index); //
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
}
