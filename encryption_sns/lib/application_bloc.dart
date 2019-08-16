import 'dart:async';

class ApplicationBloc {
  String _passWord;

  ApplicationBloc() {
    _passWord = "";
  }

  void setPassWord(String passWord) {
    this._passWord = passWord;
  }
}