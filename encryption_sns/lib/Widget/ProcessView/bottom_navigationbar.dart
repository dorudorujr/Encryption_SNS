import 'package:flutter/material.dart';
import 'package:encryption_sns/application_bloc.dart';

class ProcessBottomNavigationBar extends StatefulWidget {
  final ApplicationBloc applicationBloc;

  ProcessBottomNavigationBar({Key key, @required this.applicationBloc}) : super(key: key);

  @override
  _BottomNavigationBarState createState() => new _BottomNavigationBarState();
}

class _BottomNavigationBarState extends State<ProcessBottomNavigationBar> {

  final encryptionBottomNavigationBar = new BottomNavigationBarItem(
      icon: new Icon(Icons.lock_outline),
      title: Text("暗号化")
  );
  final decryptionBottomNavigationBar = new BottomNavigationBarItem(
      icon: new Icon(Icons.lock_open),
      title: Text("復号化")
  );

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      items: [
        this.encryptionBottomNavigationBar,
        this.decryptionBottomNavigationBar,
      ],
      onTap: (int index) {
        //ここに処理関数を指定する
        onNavigationBarItemChanged(index);

        switch(index) {
          case 0: {
            widget.applicationBloc.encryption.add(null);
          }
          break;
          case 1: {
            widget.applicationBloc.decryption.add(null);
          }
          break;
          default: {}
          break;
        }
      },
    );
  }

  void onNavigationBarItemChanged(int index) {
    setState(() {
      this._currentIndex = index;
    });
  }
}