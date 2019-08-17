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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('処理画面')),
      body: Center(
          child: Text('Back to MyPage 1')
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
    );
  }

  void onNavigationBarItemChanged(int index) {
    setState(() {
      this._currentIndex = index;
    });
  }
}
