import 'dart:async';
import 'package:encrypt/encrypt.dart';

class ApplicationBloc {
  final _encryptionController = StreamController<String>();
  final _decryptionController = StreamController<String>();
  final _showingTextController = StreamController<String>();

  // 入力用sinkのGetter
  StreamSink<String> get encryption => _encryptionController.sink;
  StreamSink<String> get decryption => _decryptionController.sink;
  StreamSink<String> get _processNotificationText => _showingTextController.sink;

  // 出力用streamのGetter
  Stream<String> get showingText => _showingTextController.stream;



  String _passWord = "";
  final iv = IV.fromLength(16);

  ApplicationBloc() {
    _bind();
  }

  void _bind() {
    _encryptionController.stream.listen((value){ _encryption(value); });
    _decryptionController.stream.listen((value) => _decryption(value));
  }

  void dispose() {
    _encryptionController.close();
    _decryptionController.close();
  }

  void setPassWord(String passWord) {
    int _notEnoughKeyLenght = 32 - passWord.length;

    for(int i = 0; i < _notEnoughKeyLenght; i++) {
     passWord  = passWord + ".";
    }

    this._passWord = passWord;
  }

  void _encryption(String text) {
    final key = Key.fromUtf8(_passWord);   //keyの文字列は32文字必要
    Encrypter encrypter = Encrypter(AES(key));
    //print(encrypter.encrypt(text, iv: iv).base64);
    _processNotificationText.add(encrypter.encrypt(text, iv: iv).base64);
  }

  void _decryption(String text) {
    print("decryption");
  }
}