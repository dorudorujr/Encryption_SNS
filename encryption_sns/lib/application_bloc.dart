import 'dart:async';
import 'package:encrypt/encrypt.dart';

class ApplicationBloc {
  final _encryptionController = StreamController<void>();
  final _decryptionController = StreamController<void>();

  StreamSink<void> get encryption => _encryptionController.sink;
  StreamSink<void> get decryption => _decryptionController.sink;


  String _passWord;
  final iv = IV.fromLength(16);

  ApplicationBloc() {
    this._passWord = "";

    _bind();
  }

  void _bind() {
    _encryptionController.stream.listen((_) => _encryption());
    _decryptionController.stream.listen((_) => _decryption());
  }

  void dispose() {
    _encryptionController.close();
    _decryptionController.close();
  }

  void setPassWord(String passWord) {
    this._passWord = passWord;
  }

  void _encryption() {
    final key = Key.fromUtf8('my 32 length key................');
    Encrypter encrypter = Encrypter(AES(key));
    print(encrypter.encrypt('test', iv: iv).base64);
  }

  void _decryption() {
    print("decryption");
  }
}